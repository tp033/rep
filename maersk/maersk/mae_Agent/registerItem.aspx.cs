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
    public partial class registerItem : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["sID"] != null)
            {
                sID.Text = Request.QueryString["sID"].ToString();
            }
       
        }

        protected void regItem_Click(object sender, EventArgs e)
        {

            {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {

                        using (SqlCommand comm = new SqlCommand())
                        {

                            comm.Connection = con;
                            comm.CommandType = System.Data.CommandType.Text;
                            comm.CommandText = "INSERT INTO Booking "
                                + "VALUES(@scheduleId, @custId,@ItemName, @ItemWeight,@containerType, @commodity,@containerQuantity, @isFragile, @agentUsername) ";
                            comm.Parameters.AddWithValue("@scheduleId", sID.Text);
                            comm.Parameters.AddWithValue("@custId", ddl_owner.SelectedValue);
                        comm.Parameters.AddWithValue("@ItemName", name.Text);
                        comm.Parameters.AddWithValue("@ItemWeight", weight.Text);
                            comm.Parameters.AddWithValue("@containerType", container_type.Value);
                            comm.Parameters.AddWithValue("@commodity", commodity.Value);
                            comm.Parameters.AddWithValue("@containerQuantity", quantity.Text);
                            comm.Parameters.AddWithValue("@agentUsername", Session["agentUsername"].ToString());
                            comm.Parameters.AddWithValue("@isFragile", isFragile.Checked.ToString());


                        try
                        {
                                con.Open();
                                int recordsAffected = comm.ExecuteNonQuery();

                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Booking registered');window.location.href = window.location.href;", true);
                            //Response.Redirect(Request.RawUrl);
                            }
                            catch (SqlException ex)
                            {
                            // error here
                            Debug.Write(ex.Message);
                            }
                            finally
                            {
                                con.Close();
                            }


                        }
                    
                }
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                sID.Text = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
            }
        }
    }
}