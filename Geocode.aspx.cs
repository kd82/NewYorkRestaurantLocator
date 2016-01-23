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
    public partial class Geocode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGetCoordinates_Click(object sender, EventArgs e)
        {
            Adress adrs = new Adress();
            adrs.Address = txtStreet.Text.ToString()+txtzipCode.Text.ToString() ;
            
            adrs.GeoCode();
            

            String strConnString = ConfigurationManager.ConnectionStrings["RestaurantConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertRestaurant";
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtName.Text.Trim();
            cmd.Parameters.Add("@Street", SqlDbType.VarChar).Value = txtStreet.Text.Trim();
            cmd.Parameters.Add("@ZipCode", SqlDbType.Float).Value = txtzipCode.Text.Trim();
            cmd.Parameters.Add("@latitude", SqlDbType.Float).Value = float.Parse(adrs.Latitude);
            cmd.Parameters.Add("@longitude", SqlDbType.Float).Value = float.Parse(adrs.Longitude);
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Record inserted successfully";
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

    public class Adress
    {
        public Adress()
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
                throw new Exception("The Error Occured"+ ex.Message);
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
                throw new Exception("An Error Occured"+ ex.Message);
            }
        }
    }
}
    
