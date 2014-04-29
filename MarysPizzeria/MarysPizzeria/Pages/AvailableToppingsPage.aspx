<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AvailableToppingsPage.aspx.cs" 
    Inherits="AvailableToppingsPage" MasterPageFile="~/MasterPages/MasterPage.master" Theme="SmokeAndGlass" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="Server">
    <title>Mary's Pizzeria | Manage Toppings</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="form-group">
        <h1>Available Toppings!</h1>
        <br />
        <asp:GridView ID="gvToppings" runat="server" class="table table-condensed table-responsive table-striped" 
            AutoGenerateColumns="true">
        </asp:GridView>
    </div>
    

</asp:Content>

