using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MarysPizzeriaModel;
using System.Data;

public partial class ToppingPage : System.Web.UI.Page
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

    protected void PopulateToppings()
    {
        var qry = from c in ctx.Toppings
                  select c;
        gvToppings.DataSource = qry.ToList();
        gvToppings.DataBind();
    }

    protected bool ExistToppingId(int toppingId)
    {
        var toppingToFind = ctx.Toppings.Find(toppingId);
        return toppingToFind != null;
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

    /// <summary>
    ///     Private helper that creates a new topping
    /// </summary>
    /// <param name="toppingName"></param>
    /// <param name="toppingActive"></param>
    private void AddNewTopping(string toppingName, string toppingActive)
    {
        Topping tp = new Topping { name = toppingName, active = toppingActive };
        ctx.Toppings.Add(tp);
        ctx.SaveChanges();
    }

    /// <summary>
    ///     Private helper that saves the edited topping.
    /// </summary>
    /// <param name="ID"></param>
    /// <param name="toppingName"></param>
    /// <param name="toppingActive"></param>
    private void UpdateTopping(string ID, string toppingName, string toppingActive)
    {
        int id = Convert.ToInt32(ID);
        Topping tp = ctx.Toppings.Find(id);
        tp.name = toppingName;
        tp.active = toppingActive;
        ctx.SaveChanges();
    }

    /// <summary>
    ///     Private helper that deletes the topping with toppingId ID
    /// </summary>
    /// <param name="ID"></param>
    private void DeleteTopping(string ID)
    {
        try
        {
            int id = Convert.ToInt32(ID);
            Topping tp = ctx.Toppings.Find(id);
            ctx.Toppings.Remove(tp);
            ctx.SaveChanges();
        }
        catch
        {
            txtLbl.Text = "Could not Delete Topping. Order exists with this topping";
        }
    }

    protected void gvToppings_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvToppings.EditIndex = e.NewEditIndex;
        BindGridView();
    }


    protected void gvToppings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvToppings.EditIndex = -1;

        BindGridView();

    }

    /// <summary>
    ///     Deletes a row.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvToppings_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = gvToppings.Rows[e.RowIndex].FindControl("lblToppingId") as Label;
        DeleteTopping(id.Text);
        BindGridView();
    }
   
    protected void gvToppings_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = gvToppings.Rows[e.RowIndex].FindControl("lblToppingId") as Label;
        TextBox name = gvToppings.Rows[e.RowIndex].FindControl("txtToppingName") as TextBox;
        DropDownList state = gvToppings.Rows[e.RowIndex].FindControl("txtToppingActive") as DropDownList;

        UpdateTopping(id.Text, name.Text, state.Text);
        
        gvToppings.EditIndex = -1;
        BindGridView();
    }

    /// <summary>
    ///     If Command was Insert, add Topping
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvToppings_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.Equals("Insert"))
        {
            TextBox n = gvToppings.FooterRow.FindControl("txtTName") as TextBox;
            DropDownList a = gvToppings.FooterRow.FindControl("txtTActive") as DropDownList;

            Topping tp = new Topping {name = n.Text, active = a.Text};
            ctx.Toppings.Add(tp);
            ctx.SaveChanges();
            BindGridView();
        }
    }
}
