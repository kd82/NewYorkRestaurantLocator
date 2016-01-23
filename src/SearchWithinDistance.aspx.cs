using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Xml;
using System.Net;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class SearchWithin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!this.IsPostBack)
            {

                DataTable dt = this.GetData("Select name,latitude,longitude from restaurant");

                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }
             */ 
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
        protected void startSearchButton_Click(object sender, EventArgs e)
        {
            Adress1 adrs = new Adress1();
            adrs.Address = addressTextBox.Text.ToString();

            adrs.GeoCode();
             lblLattitude.Text = adrs.Latitude;
            lblLongtitude.Text = adrs.Longitude;
            

            String strConnString = ConfigurationManager.ConnectionStrings["RestaurantConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetNearByLocations";
            cmd.Parameters.Add(new SqlParameter("@CenterLatitude", float.Parse(adrs.Latitude)));
            cmd.Parameters.Add(new SqlParameter("@CenterLongitude", float.Parse(adrs.Longitude)));
            cmd.Parameters.Add(new SqlParameter("@SearchDistance", distanceDropDown.SelectedValue));
            cmd.Parameters.Add(new SqlParameter("@EarthRadius", 3961));  // In Miles
            cmd.Connection = con;
            try
            {
                con.Open();
                SqlDataReader reader;
                reader=cmd.ExecuteReader();
                //cmd.ExecuteNonQuery();
               

                //DataTable dt = this.GetData("Select name,latitude,longitude,ProxDistance from Restaurants");

                
                rptMarkers.DataSource = reader;
                rptMarkers.DataBind();
               /*if (reader.HasRows)
                {
                    Label1.Text=n.ToString();
                    
                }
                else
                {
                   
                    Label1.Text = "No Results to display please simplify your search or enter a place in and around New York";
                }
                */
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }




        }

        
    }

    public class Adress1
    {
        public Adress1()
        {
        }
        //Properties
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Address { get; set; }

        //The Geocoding here i.e getting the latt/long of address
        public void GeoCode()
        {
            //to Read the Stream
            StreamReader sr = null;

            //The Google Maps API Either return JSON or XML. We are using XML Here
            //Saving the url of the Google API 
            string url = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address=" +
            this.Address + "&sensor=false");

            //to Send the request to Web Client 
            WebClient wc = new WebClient();
            try
            {
                sr = new StreamReader(wc.OpenRead(url));
            }
            catch (Exception ex)
            {
                throw new Exception("The Error Occured" + ex.Message);
            }

            try
            {
                XmlTextReader xmlReader = new XmlTextReader(sr);
                bool latread = false;
                bool longread = false;

                while (xmlReader.Read())
                {
                    xmlReader.MoveToElement();
                    switch (xmlReader.Name)
                    {
                        case "lat":

                            if (!latread)
                            {
                                xmlReader.Read();
                                this.Latitude = xmlReader.Value.ToString();
                                latread = true;

                            }
                            break;
                        case "lng":
                            if (!longread)
                            {
                                xmlReader.Read();
                                this.Longitude = xmlReader.Value.ToString();
                                longread = true;
                            }

                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An Error Occured" + ex.Message);
            }
        }
    }
}
