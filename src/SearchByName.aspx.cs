using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class CS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                DataTable dt = this.GetData("Select name,latitude,longitude from restaurant");

                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }

        }

        private DataTable GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["RestaurantConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String query = "select name,latitude,longitude from restaurant where name like '"+TextBox2.Text.ToString()+"%'";
            DataTable dt = this.GetData(query);

            rptMarkers.DataSource = dt;
            rptMarkers.DataBind(); 
           
            
        }
    }
}