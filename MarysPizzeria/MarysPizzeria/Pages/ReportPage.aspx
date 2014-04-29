<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportPage.aspx.cs" 
    Inherits="Pages_ReportPage" MasterPageFile="~/MasterPages/MasterPage.master" Theme="SmokeAndGlass"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <title>Mary's Pizzeria | Customer Orders Report</title>
    <style type="text/css">
        #DateFrom {
            height: 30px;
            width: 35px;
        }

        #DateTo {
            height: 30px;
            width: 35px;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="cphContent" runat="server">
    <div class="form-group">
        <h1>Order Reports</h1>
        <table>
            <tr>
                <td>From:
                <asp:TextBox ID="txtDateFrom" runat="server" ReadOnly="True" />
                    <div id="dateFrom">
                        <asp:Calendar ID="calDateFrom"
                            OnSelectionChanged="calDateFrom_SelectionChanged"
                            runat="server" />
                    </div>
                </td>
                <td> </td>
                <td>To:
                <asp:TextBox ID="txtDateTo" runat="server" ReadOnly="True" />
                    <div id="dateTo">
                        <asp:Calendar ID="calDateTo"
                            OnSelectionChanged="calDateTo_SelectionChanged"
                            runat="server" />
                    </div>
                </td>
            </tr>
        </table>

        <asp:Button ID="genReports" class="btn btn-primary" Text="Get Reports" runat="server" OnClick="genReports_Click" />
        <br />
        <br />
    </div>
    <asp:Label ID="lblReports" runat="server" Text=""></asp:Label>
</asp:Content>


