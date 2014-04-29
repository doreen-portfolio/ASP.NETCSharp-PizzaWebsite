using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MarysPizzeriaModel;
using System.Data;

public partial class AvailableToppingsPage : System.Web.UI.Page
{
    MaryPizzaEntities ctx = new MaryPizzaEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        //PopulateToppings();

        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    // NEW STUFF

    /// <summary>
    ///     Private function to update the gridview.
    /// </summary>
    private void BindGridView()
    {
        var dt = (from t in ctx.Toppings select t).ToList();
        gvToppings.DataSource = dt;
        gvToppings.DataBind();
    }
}
