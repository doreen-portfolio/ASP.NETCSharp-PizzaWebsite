<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs"
    Inherits="Login" MasterPageFile="~/MasterPages/MasterPage.master" Theme="SmokeAndGlass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <title>Mary's Pizzeria | Login</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <asp:Login ID="Login1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em" ForeColor="#333333" TextLayout="TextOnTop">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em" ForeColor="#1C5E55" />
        <TextBoxStyle Font-Size="1em" />
        <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="1em" ForeColor="White" />
    </asp:Login>
</asp:Content>
