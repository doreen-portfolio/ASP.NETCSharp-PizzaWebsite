using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterpages_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.User.IsInRole("admin")) {
            lnkToppings.Visible = false;
        }
        if (!Page.User.IsInRole("sales"))
        {
            lnkReports.Visible = false;
        }
        if (!Page.User.Identity.IsAuthenticated)
        {
            authMenu.Visible = false;
        }
    }
}
