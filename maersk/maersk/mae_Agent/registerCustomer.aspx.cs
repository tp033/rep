using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace maersk.mae_Agent
{
    public partial class registerCustomer : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void regCus_Click(object sender, EventArgs e)
        {
            if (!checkExistingCustomer())
            {
                insertCustomerDetails();
            }
        }

        private void insertCustomerDetails()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {

                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = con;
                    comm.CommandType = System.Data.CommandType.Text;
                    comm.CommandText = "INSERT INTO customer "
                        + "VALUES(@custId,@email, @name, @number, @Address,@State,@City,@PostalCode,@agentUsername)";

                    comm.Parameters.AddWithValue("@email", email.Text);
                    comm.Parameters.AddWithValue("@name", name.Text);
                    comm.Parameters.AddWithValue("@number", number.Text);
                 
                    comm.Parameters.AddWithValue("@custId", custID.Text);
                    comm.Parameters.AddWithValue("@Address", address.Text);
                    comm.Parameters.AddWithValue("@State", State.Text);
                    comm.Parameters.AddWithValue("@City", City.Text);
                    comm.Parameters.AddWithValue("@PostalCode", code.Text);
                    comm.Parameters.AddWithValue("@agentUsername", Session["agentUsername"].ToString());

                    try
                    {
                        con.Open();
                        int recordsAffected = comm.ExecuteNonQuery();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration success: customer registered');window.location.href = window.location.href;", true);
                                     

                    }
                    catch (SqlException ex)
                    {
                        // error here
                        Debug.Write(ex.Errors.ToString());
                    }
                    finally
                    {
                        con.Close();
                    }


                }
            }
        }

        private bool checkExistingCustomer()
        {
            bool isFound = false;
            SqlConnection con = new SqlConnection(strcon);
            string sql = "SELECT COUNT(*) FROM customer WHERE email = @email OR custId = @custId";
            SqlCommand comm = new SqlCommand(sql, con);
            comm.Parameters.AddWithValue("@email", email.Text);
            comm.Parameters.AddWithValue("@custId", custID.Text);

            con.Open();

            Int32 count = Convert.ToInt32(comm.ExecuteScalar());
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration failed: Customer's email or NRIC/Passport is registered before this.')", true);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Registration failed: Customer's email or NRIC/Passport is registered before this.')", false);

                isFound = true;
                //email exist message
            }
            con.Close();
            return isFound;
        }
    }
}