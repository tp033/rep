using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace maersk.mae_Admin
{
    public partial class registerAgent : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void regAgent_Click(object sender, EventArgs e)
        {
            checkExistingUsername();

        }

        private void checkExistingUsername()
        {
            SqlConnection con = new SqlConnection(strcon);
            string sql = "SELECT COUNT(*) FROM agent WHERE username = @username";
            SqlCommand comm = new SqlCommand(sql, con);
            comm.Parameters.AddWithValue("@username", Username.Text);
            con.Open();

            Int32 count = Convert.ToInt32(comm.ExecuteScalar());
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username exist')", true);

                //username exist message
            }
            else
            {
                addUser();
            }
            con.Close();

        }

        private void addUser()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {

                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = con;
                    comm.CommandType = System.Data.CommandType.Text;
                    comm.CommandText = "INSERT INTO agent " 
                        + "VALUES(@username, @password,@email, @name, @number) "  
                        + "INSERT INTO agentCompany "
                        + "VALUES(@username,@Company,@Department,@Country,@Address,@State,@City,@PostalCode)";
                    comm.Parameters.AddWithValue("@username", Username.Text);
                    comm.Parameters.AddWithValue("@password", password.Text);
                    comm.Parameters.AddWithValue("@email", email.Text);
                    comm.Parameters.AddWithValue("@name", name.Text);
                    comm.Parameters.AddWithValue("@number", number.Text);
                    comm.Parameters.AddWithValue("@Company", company.Text);
                    comm.Parameters.AddWithValue("@Department", dept.Text);
                    comm.Parameters.AddWithValue("@Country", country.Text);
                    comm.Parameters.AddWithValue("@Address", address.Text);
                    comm.Parameters.AddWithValue("@State", State.Text);
                    comm.Parameters.AddWithValue("@City", City.Text);
                    comm.Parameters.AddWithValue("@PostalCode", code.Text);
               
                    try
                    {
                        con.Open();
                        int recordsAffected = comm.ExecuteNonQuery();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Agent Registered');window.location.href = window.location.href;", true);
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
}