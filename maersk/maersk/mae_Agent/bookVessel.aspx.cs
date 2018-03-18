using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace maersk.mae_Agent
{
    public partial class bookVessel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                sID.Text = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
            }
        }

        protected void regCus_Click(object sender, EventArgs e)
        {
            Response.Redirect("./registerItem.aspx?sID=" + sID.Text);
        }
    }
}