using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            anonMenu.Visible = true;
        }
        else
        {
            anonMenu.Visible = false;
        }
    }
}