using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace maersk.mae_Admin
{
    public partial class viewSchedule : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           

            if (isValidDtime())
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {            GridViewRow row = GridView1.Rows[e.RowIndex];
 

                    using (SqlCommand comm = new SqlCommand())
                    {
                        int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                        string vessel = (row.Cells[2].Controls[0] as TextBox).Text;
                        string fromLoc = (row.Cells[3].Controls[0] as TextBox).Text;
                        string frarr = (row.Cells[4].Controls[0] as TextBox).Text;
                        string frdept = (row.Cells[5].Controls[0] as TextBox).Text;
                        string toLoc = (row.Cells[6].Controls[0] as TextBox).Text;
                        string toarr = (row.Cells[7].Controls[0] as TextBox).Text;
                        string todept = (row.Cells[8].Controls[0] as TextBox).Text;
                        string space = (row.FindControl("space") as DropDownList).SelectedItem.Value;

                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(' " + space + " ' )", true);

                        comm.Connection = con;
                        comm.CommandType = System.Data.CommandType.Text;
                        comm.CommandText = "UPDATE schedule SET"
                            + "vessel = @vessel, from = @from,frarr = @frarr," +
                            " frdept = @frdept, toLoc= @toLoc" +
                            " , toarr=@toarr,todept= @todept, space=@space) WHERE Id = @Id";


                        comm.Parameters.AddWithValue("@Id", Id);

                        comm.Parameters.AddWithValue("@vessel", vessel);
                        //comm.Parameters.AddWithValue("@from", from.Text);
                        //comm.Parameters.AddWithValue("@frarr", frArrdateTime.Text);
                        //comm.Parameters.AddWithValue("@frdept", frDeptdateTime.Text);
                        //comm.Parameters.AddWithValue("@to", to.Text);
                        //comm.Parameters.AddWithValue("@toarr", ArrdateTime.Text);
                        //comm.Parameters.AddWithValue("@todept", DeptdateTime.Text);
                        comm.Parameters.AddWithValue("@fromLoc", fromLoc);
                        comm.Parameters.AddWithValue("@frarr", Convert.ToDateTime(frarr));
                        comm.Parameters.AddWithValue("@frdept", Convert.ToDateTime(frdept));
                        comm.Parameters.AddWithValue("@toLoc", toLoc);
                        comm.Parameters.AddWithValue("@toarr", Convert.ToDateTime(toarr));
                        comm.Parameters.AddWithValue("@todept", Convert.ToDateTime(todept));
                        comm.Parameters.AddWithValue("@space", space.ToString());

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
            bool x = true;
            return x;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            TextBox tbox = e.Row.Cells[4].Controls[0] as TextBox;
            if (tbox != null)
            {
                //set property here
                tbox.TextMode = TextBoxMode.MultiLine;
            }
        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            GridView gw = sender as GridView;
            if (gw.EditIndex != -1)
            {
                GridViewRow row = gw.Rows[gw.EditIndex];
                //((TextBox)row.Cells[4].Controls[0]).TextMode = TextBoxMode.DateTimeLocal;
                //((TextBox)row.Cells[5].Controls[0]).TextMode = TextBoxMode.DateTimeLocal;
                //((TextBox)row.Cells[7].Controls[0]).TextMode = TextBoxMode.DateTimeLocal;
                //((TextBox)row.Cells[8].Controls[0]).TextMode = TextBoxMode.DateTimeLocal;


            }
        }



        //protected void rowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    TextBox tbox = e.Row.FindControl("d") as TextBox;
        //    if (tbox != null)
        //    {
        //        //set property here
        //        tbox.TextMode = TextBoxMode.DateTimeLocal;
        //        }
        //}


    }
}