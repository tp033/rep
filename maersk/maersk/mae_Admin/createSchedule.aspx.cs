using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace maersk.mae_Admin
{
    public partial class createSchedule : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<string> getVessels(string ves)
        {
            List<string> vesObj = new List<string>();
            string connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            //com.CommandText = string.Format("select vessel from schedule where vessel like '%{0}%'", ves);

            string cmdString = string.Format("select DISTINCT vessel from schedule where vessel like '%{0}%'", ves);
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = connString;
            using (cnn)
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cnn.Open();
                    cmd.Connection = cnn;
                    cmd.CommandText = cmdString;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            vesObj.Add(reader.GetString(0));
                        }
                        reader.Close();
                    }
                }

            }
            cnn.Close();
            return vesObj;
        }

        [WebMethod]
        public static List<string> getLocations(string loc)
        {
            List<string> location = new List<string>();
            string connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            //com.CommandText = string.Format("select vessel from schedule where vessel like '%{0}%'", ves);

            string cmdString = string.Format("select fromLoc from schedule where fromLoc like '%{0}%' UNION select toLoc from schedule where toLoc like '%{0}%'", loc);
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = connString;
            using (cnn)
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cnn.Open();
                    cmd.Connection = cnn;
                    cmd.CommandText = cmdString;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            location.Add(reader.GetString(0));
                        }
                        reader.Close();
                    }
                }

            }
            
            cnn.Close();
            return location;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        { //from.Text =frArrdateTime.Text;

            insertSchedule();
        }

        private void insertSchedule()
        {

            if (isValidDtime())
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    using (SqlCommand comm = new SqlCommand())
                    {
                       
                        comm.Connection = con;
                        comm.CommandType = System.Data.CommandType.Text;
                        comm.CommandText = "INSERT INTO schedule "
                            + "VALUES(@vessel, @from,@frarr, @frdept,@to, @toarr,@todept, @space) ";
                        comm.Parameters.AddWithValue("@vessel", vessel.Text);
                        //comm.Parameters.AddWithValue("@from", from.Text);
                        //comm.Parameters.AddWithValue("@frarr", frArrdateTime.Text);
                        //comm.Parameters.AddWithValue("@frdept", frDeptdateTime.Text);
                        //comm.Parameters.AddWithValue("@to", to.Text);
                        //comm.Parameters.AddWithValue("@toarr", ArrdateTime.Text);
                        //comm.Parameters.AddWithValue("@todept", DeptdateTime.Text);
                        comm.Parameters.AddWithValue("@from", from.Text);
                        comm.Parameters.AddWithValue("@frarr", Convert.ToDateTime(frArrdateTime.Text) );
                        comm.Parameters.AddWithValue("@frdept", Convert.ToDateTime(frDeptdateTime.Text)) ;
                        comm.Parameters.AddWithValue("@to", to.Text);
                        comm.Parameters.AddWithValue("@toarr", Convert.ToDateTime(ArrdateTime.Text))  ;
                        comm.Parameters.AddWithValue("@todept", Convert.ToDateTime(DeptdateTime.Text))  ;
                        comm.Parameters.AddWithValue("@space", space.SelectedValue.ToString());

                        try
                        {
                            con.Open();
                            int recordsAffected = comm.ExecuteNonQuery();
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('agent registered')", true);
                        }
                        catch (SqlException)
                        {
                            // error here
                        }
                        finally
                        {
                            con.Close();
                        }


                    }
                }
            }
        }


        private bool isValidDtime()
        {

       bool valid = false;
            //M / dd / yyyy hh: mm
            //frArrdateTime.Text = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
            //DateTime frDep = Convert.ToDateTime(frDeptdateTime.Text);
            string testl = Convert.ToDateTime(frDeptdateTime.Text).ToString();
            SqlConnection con = new SqlConnection(strcon);
            string sql = "select COUNT(*) from schedule " +
    "WHERE ( @frarr BETWEEN frarr AND todept " +
     "OR @frdept BETWEEN frarr AND todept " +
    "OR @toarr BETWEEN frarr AND todept " +
     "OR @todept BETWEEN frarr AND todept) " +
     "AND @vessel = vessel"; 
            SqlCommand comm = new SqlCommand(sql, con);
            comm.Parameters.AddWithValue("@vessel", vessel.Text);
            comm.Parameters.AddWithValue("@frarr",Convert.ToDateTime(frArrdateTime.Text));
            comm.Parameters.AddWithValue("@frdept", Convert.ToDateTime(frDeptdateTime.Text));
            comm.Parameters.AddWithValue("@toarr", Convert.ToDateTime(ArrdateTime.Text));
            comm.Parameters.AddWithValue("@todept", Convert.ToDateTime(DeptdateTime.Text));

            con.Open();

            Int32 count = Convert.ToInt32(comm.ExecuteScalar());
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The vessel has a booking in between the selected dates')", true);

                return false;
          
            }
            else
            {con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Booking created')", true);

                return true;
                

            }
        }
    }
}
