<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderPage.aspx.cs"
    Inherits="OrderPage" MasterPageFile="~/MasterPages/MasterPage.master" Theme="SmokeAndGlass"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <title>Mary's Pizzeria | Order</title>
    <style type="text/css">
        .auto-style1 {
            width: 112px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="form-group" id="orderForm" runat="server">
        <h1>Create Order</h1>
        <br />
        <table class="table-responsive">
            <tr>
                <td>First Name</td>
                <td>
                    <asp:TextBox ID="tbFirstName" class="form-control" 
                        runat="server" placeholder="First Name"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvFirstName" 
                        runat="server" ControlToValidate="tbFirstName" 
                        ErrorMessage="First Name is required." ForeColor="Red">*
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td>
                    <asp:TextBox ID="tbLastName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tbLastName" ErrorMessage="Last Name is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email address</td>
                <td>
                    <asp:TextBox ID="tbEmail" class="form-control" runat="server" placeholder="Email Address"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email address is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email address must have proper email format. " ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Telephone Number</td>
                <td>
                    <asp:TextBox ID="tbPhone" class="form-control" runat="server" placeholder="Telephone #"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="tbPhone" ErrorMessage="Telephone number must be of format xxx.xxx.xxxx" ForeColor="Red" ValidationExpression="\d{3}\.{1}\d{3}\.{1}\d{4}" Display="Dynamic">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvTelephone" runat="server" ControlToValidate="tbPhone" ErrorMessage="Telephone number is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Pizza size</td>
                <td>
                    <asp:DropDownList ID="ddlPizzaSize" runat="server">
                        <asp:ListItem>Small</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td>Number of Pizzas</td>
                <td>
                    <asp:TextBox ID="tbNumPizza" class="form-control" runat="server" placeholder="Number of Pizzas"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvNumPizza" runat="server" ControlToValidate="tbNumPizza" ErrorMessage="Number of pizzas is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvPizzaRange" runat="server" 
                        ErrorMessage="May only order between 1 and 99 pizzas." ForeColor="Red" 
                        OnServerValidate="cvPizzaRange_ServerValidate">*
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Preferred Toppings</td>
                <td>
                    <asp:CheckBoxList ID="cblToppings" runat="server" 
                        RepeatLayout="table" RepeatColumns="3" RepeatDirection="vertical"/>
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:CustomValidator ID="cvToppingChoice" runat="server" 
                        ErrorMessage="Must select at least 1 topping." ForeColor="Red" 
                        OnServerValidate="cvToppingChoice_ServerValidate">*
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Delivery</td>
                <td>
                    <asp:DropDownList ID="ddlDelivery" runat="server">
                        <asp:ListItem>Delivery</asp:ListItem>
                        <asp:ListItem>Pickup</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <asp:CustomValidator ID="cvDelivery" runat="server" ErrorMessage="No delivery of small sized pizzas." ForeColor="Red" OnServerValidate="CvDelivery_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmitOrder" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmitOrder_Click" />
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="orderSummaryForm" runat="server">
        <div id="orderSummary" runat="server">
            
        </div>
        <asp:Button ID="btnDownload" class="btn btn-primary" runat="server" Text="Download Summary" OnClick="btnDownload_Click" />
        <br />
        <br />
        <asp:Button ID="btnContinue" class="btn btn-primary" runat="server" Text="Continue" OnClick="btnContinue_Click" />
    </div>

</asp:Content>
