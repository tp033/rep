using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using maersk.Models;
using System.Web.Security;
using System.Security.Policy;
using System.Data.SqlClient;
using System.Configuration;

namespace maersk.Account
{
    public partial class Login : Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            //FormsAuthentication.SetAuthCookie(Username.Text, true);
            //Response.Redirect("~/About.aspx");
            checkLogin();
        }

        private void checkLogin()
        {
            SqlConnection con = new SqlConnection(strcon);
            string sql = "SELECT COUNT(*) FROM agent WHERE username = @username AND password = @password";
            SqlCommand comm = new SqlCommand(sql, con);
            comm.Parameters.AddWithValue("@username", Username.Text);
            comm.Parameters.AddWithValue("@password", Password.Text);
            con.Open();

            Int32 count = Convert.ToInt32(comm.ExecuteScalar());
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('valid agent credential')", true);
                Session["agentUsername"] = Username.Text;
                Response.Redirect("~/mae_Agent/ViewBooking.aspx");
                //to agent homepage
            }
            else
            {
                checkAdmin();
            }
            con.Close();
        }

        private void checkAdmin()
        {
            SqlConnection con = new SqlConnection(strcon);
            string sql = "SELECT COUNT(*) FROM admin WHERE username = @username AND password = @password";
            SqlCommand comm = new SqlCommand(sql, con);
            comm.Parameters.AddWithValue("@username", Username.Text);
            comm.Parameters.AddWithValue("@password", Password.Text);
            con.Open();

            Int32 count = Convert.ToInt32(comm.ExecuteScalar());
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('valid admin credential')", true);
                Response.Redirect("~/mae_Admin/ViewAllBooking.aspx");

                //to admin homepage
            }
            else
            {
                ErrorMessage.Visible = true;
                FailureText.Text = "Invalid credential";
               // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('invalid credential')", true);
            }
            con.Close();
        }
    }
}