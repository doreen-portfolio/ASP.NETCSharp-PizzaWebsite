<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ToppingPage.aspx.cs" 
    Inherits="ToppingPage" MasterPageFile="~/MasterPages/MasterPage.master" Theme="SmokeAndGlass" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="Server">
    <title>Mary's Pizzeria | Manage Toppings</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="form-group">
        <h1>Manage Toppings</h1>
        <br />
        <asp:Label ID="txtLbl" ForeColor="Red" runat="server" />
        <h2>Toppings</h2>
        <asp:GridView ID="gvToppings" runat="server" class="table table-condensed table-responsive table-striped" 
            AutoGenerateColumns="False" ShowFooter="True"
            OnRowCommand="gvToppings_RowCommand"
            OnRowDeleting="gvToppings_RowDeleting"
            OnRowEditing="gvToppings_RowEditing"
            OnRowCancelingEdit="gvToppings_RowCancelingEdit"
            OnRowUpdating="gvToppings_RowUpdating">
            <Columns>
                <asp:TemplateField  HeaderText="Topping ID" >
                    <ItemTemplate>
                        <asp:Label ID="lblToppingId" runat="server" Text='<%#Eval("toppingId") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button class="btn-primary" ID="btnInsert" runat="server" Text="Insert" 
                            CommandName="Insert"/>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="Name" >
                    <ItemTemplate>
                        <asp:Label ID="lblToppingName" runat="server" Text='<%#Eval("name") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtToppingName" runat="server" Text='<%#Bind("name") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTName" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="Active" >
                    <ItemTemplate>
                        <asp:Label ID="lblToppingActive" runat="server" Text='<%#Eval("active") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="txtToppingActive" runat="server" Text='<%#Bind("active") %>'>
                            <asp:ListItem Text="yes" Value="yes" />
                            <asp:ListItem Text="no" Value="no" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="txtTActive" runat="server" >
                            <asp:ListItem Text="yes" Value="yes" />
                            <asp:ListItem Text="no" Value="no" />
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button class="btn-primary" ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button class="btn-primary" ID="btnDelete" runat="server" CommandName="Delete" 
                            Text="Delete" onClientclick="return confirm('Are you sure you want to delete this item?')"/>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:Button class="btn-primary" ID="btnUpdate" runat="server" CommandName="Update"
                            Text="Update" OnClientClick="return confirm('Make changes permanent?')" />
                        <asp:Button class="btn-primary" ID="btnCancel" runat="server" CommandName="Cancel" 
                            Text="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    

</asp:Content>

