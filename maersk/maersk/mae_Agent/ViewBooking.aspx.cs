using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace maersk.mae_Agent
{
    public partial class ViewBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                sID.Text = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values["scheduleId"].ToString();
                bID.Text = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values["BookingId"].ToString();

            }
        }
    }
}