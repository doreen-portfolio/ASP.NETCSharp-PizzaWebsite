using System;
using System.Linq;
using MarysPizzeriaModel;

public partial class Pages_ReportPage : System.Web.UI.Page
{
    private MaryPizzaEntities ctx = new MaryPizzaEntities();
    private DateTime dateFrom;
    private DateTime dateTo;

    protected void Page_Load(object sender, EventArgs e)
    {

        dateFrom = DateTime.Parse(calDateFrom.SelectedDate.ToString("d"));
        dateTo = DateTime.Parse(calDateTo.SelectedDate.ToString("d"));

        var qry = (from o in ctx.Orders
                   where DateTime.Compare(o.orderDate, dateFrom) >= 0
                         && DateTime.Compare(o.orderDate, dateTo) <= 0
                   select o);
        string resultsTable = "<table class=\"table table-condensed table-responsive table-striped\"><tr><td>First Name</td>";
        resultsTable += "<td>Last Name</td>";
        resultsTable += "<td>Email</td>";
        resultsTable += "<td>Phone</td>";
        resultsTable += "<td>Size</td>";
        resultsTable += "<td>Number of Pizzas</td>";
        resultsTable += "<td>Method of Delivery</td>";
        resultsTable += "<td>Order Date</td>";
        resultsTable += "<td>Toppings</td></tr>";

        foreach (var o in qry)
        {
            resultsTable += "<tr><td>" + o.firstname + "</td>";
            resultsTable += "<td>" + o.lastName + "</td>";
            resultsTable += "<td>" + o.email + "</td>";
            resultsTable += "<td>" + o.phone + "</td>";
            resultsTable += "<td>" + o.size + "</td>";
            resultsTable += "<td>" + o.noOfPizzas + "</td>";
            resultsTable += "<td>" + o.delivery + "</td>";
            resultsTable += "<td>" + o.orderDate + "</td><td>";

            foreach (var topping in o.Toppings)
            {
               resultsTable += topping.name + ", ";
            }
            resultsTable += "</td></tr>";
        }

        resultsTable += "</table>";
        lblReports.Text = resultsTable;
    }

    protected void calDateFrom_SelectionChanged(object sender, EventArgs e)
    {
        txtDateFrom.Text = calDateFrom.SelectedDate.ToString("d");
    }

    protected void calDateTo_SelectionChanged(object sender, EventArgs e)
    {
        txtDateTo.Text = calDateTo.SelectedDate.ToString("d");
    }
    protected void genReports_Click(object sender, EventArgs e)
    {

    }
}