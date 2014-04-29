using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MarysPizzeriaModel;

public partial class OrderPage : System.Web.UI.Page
{
    private MaryPizzaEntities ctx = new MaryPizzaEntities();

    /// <summary>
    ///     On Page load, load toppings into CheckBox List.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        { 
        var toppings = (from t in ctx.Toppings
                        where t.active == "yes"
                        select t);

        cblToppings.DataValueField = "name";
        cblToppings.DataTextField = "name";
        cblToppings.DataSource = toppings.ToArray();
        cblToppings.DataBind();
        }
        orderSummaryForm.Visible = false;
    }

    /// <summary>
    ///     Validate if we can Deliver. The rule is such that if a pizza
    ///     is small, we cannot deliver.
    /// </summary>
    /// <param name="source"></param>
    /// <param name="args"></param>
    protected void CvDelivery_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (ddlPizzaSize.Text == "Small" && ddlDelivery.Text == "Delivery")
        {
            args.IsValid = false;
        }
    }

    /// <summary>
    ///     Private helper function determines if a topping was checked.
    /// </summary>
    /// <returns>true if toppings checked > 0 </returns>
    private bool hasSelection()
    {
        bool hasSelection = false;
        foreach (ListItem item in cblToppings.Items)
        {
            if (item.Selected)
            {
                hasSelection = true;
            }
        }
        return hasSelection;
    }
    /// <summary>
    /// Persist order into database.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmitOrder_Click(object sender, EventArgs e)
    {
        if (hasSelection() && CanDeliver() && PizzaNumberRange())
        {
            string firstName = tbFirstName.Text;
            string lastName = tbLastName.Text;
            string email = tbEmail.Text;
            string telephone = tbPhone.Text;
            string pizzaSize = ddlPizzaSize.Text;
            int numPizza = Convert.ToInt32(tbNumPizza.Text);
            string delivery = ddlDelivery.Text;
            DateTime orderDate = DateTime.Now;

            Order newOrder = new Order
            {
                firstname = firstName,
                lastName = lastName,
                email = email,
                phone = telephone,
                size = pizzaSize,
                noOfPizzas = numPizza,
                delivery = delivery,
                orderDate = orderDate
            };

            ctx.Orders.Add(newOrder);

            foreach (ListItem item in cblToppings.Items)
            {
                if (item.Selected)
                {
                    var qry = (from t in ctx.Toppings
                        where t.name == item.Text
                        select t).FirstOrDefault();

                    newOrder.Toppings.Add(qry);
                }
            }
            ctx.SaveChanges();
            clearForm();
            ShowOrderSummary(newOrder);
            Session["order"] = newOrder;
        }
    }

    /// <summary>
    ///     Private helper class clears form after a successful order is made.
    /// </summary>
    private void clearForm()
    {
        tbFirstName.Text = string.Empty;
        tbLastName.Text = string.Empty;
        tbEmail.Text = string.Empty;
        tbPhone.Text = string.Empty;
        ddlPizzaSize.SelectedIndex = 0;
        tbNumPizza.Text = string.Empty;
        ddlDelivery.SelectedIndex = 0;
        foreach (ListItem item in cblToppings.Items)
        {
            if (item.Selected)
            {
                item.Selected = false;
            }
        }
    }

    /// <summary>
    ///     Validate if any toppings have been chosen.
    ///     Must be greater than 0.
    /// </summary>
    /// <param name="source"></param>
    /// <param name="args"></param>
    protected void cvToppingChoice_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!hasSelection())
        {
            args.IsValid = false;
        }
    }
    /// <summary>
    /// For displaying order summary.
    /// </summary>
    /// <param name="o"></param>
    protected void ShowOrderSummary(Order o)
    {
        orderForm.Visible = false;
        string output = "<h1>Order Summary</h1><table class=\"table table-condensed table-responsive table-striped\">";
        output += "<tr><td>First Name</td><td>" + o.firstname + "</td></tr>";
        output += "<tr><td>Last Name</td><td>" + o.lastName + "</td></tr>";
        output += "<tr><td>Email</td><td>" + o.email + "</td></tr>";
        output += "<tr><td>Phone</td><td>" + o.phone + "</td></tr>";
        output += "<tr><td>Pizza Size</td><td>" + o.size + "</td></tr>";
        output += "<tr><td>Number of Pizzas</td><td>" + o.noOfPizzas + "</td></tr>";
        output += "<tr><td>Delivery</td><td>" + o.delivery + "</td></tr>";
        output += "<tr><td>Order Date</td><td>" + o.orderDate + "</td></tr>";
        output += "<tr><td>Toppings</td><td>";

        foreach (var t in o.Toppings)
        {
            output += t.name + ", ";
        }
        output += "</td></tr></table>";

        orderSummary.InnerHtml = output;
        orderSummaryForm.Visible = true;
    }
    /// <summary>
    /// Download text file containing order details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DownloadFile(Order o)
    {
        string path = MapPath("~/order.txt");

        StreamWriter sw = new StreamWriter(path, false);
        sw.WriteLine("First Name: " + o.firstname);
        sw.WriteLine("Last Name: " + o.lastName);
        sw.WriteLine("Email: " + o.email);
        sw.WriteLine("Phone: " + o.phone);
        sw.WriteLine("Pizza Size: " + o.size);
        sw.WriteLine("Number of Pizzas: " + o.noOfPizzas);
        sw.WriteLine("Delivery Method: " + o.delivery);
        sw.WriteLine("Order Date: " + o.orderDate);
        sw.Write("Toppings: ");
        foreach (var t in o.Toppings)
        {
            sw.Write(t.name + ", ");
        }
        sw.Close();
        string fileName = Path.GetFileName(path);
        Response.ContentType = "text/plain";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.TransmitFile(MapPath("~/") + fileName);
        Response.Flush();
        Response.End();
    }
    /// <summary>
    /// Button for returning to order form view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        orderSummaryForm.Visible = false;
        orderForm.Visible = true;
    }
    /// <summary>
    /// Button for downloading order summary file.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        Order o = (Order)Session["order"];
        DownloadFile(o);
    }
    /// <summary>
    /// Checks that small pizzas are not delivered. Small pizzas can only be picked up. 
    /// </summary>
    /// <returns></returns>

    protected bool CanDeliver()
    {
        if(ddlPizzaSize.Text == "Small" && ddlDelivery.Text == "Delivery")
        {
            return false;
        }
        return true;
    }
    /// <summary>
    /// Checks that the number of pizzas are within range of 1 - 99.
    /// </summary>
    /// <returns></returns>
    protected bool PizzaNumberRange()
    {
        int number = Convert.ToInt32(tbNumPizza.Text);
        if (number <= 0 || number >= 100)
        {
            return false;
        }
        return true;
    }
    /// <summary>
    /// Checks that the number of pizzas are within range of 1 - 99.
    /// </summary>
    /// <param name="source"></param>
    /// <param name="args"></param>
    protected void cvPizzaRange_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int number = Convert.ToInt32(tbNumPizza.Text);
        if (number <= 0 || number >= 100)
        {
            args.IsValid = false;
        }
    }
}