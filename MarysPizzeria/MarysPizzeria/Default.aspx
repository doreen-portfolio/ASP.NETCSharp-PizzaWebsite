<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPages/MasterPage.master" Theme="SmokeAndGlass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <title>Mary's Pizzeria | Home</title>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.7.2.min.js"><\/script>')</script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.carousel').carousel({
                interval: 3000
            });
        });
    </script>

    <style>
        .panel1 {
            height: 175px;
            background-color: brown;
            color: white;
            text-align: center;
            border: 5px solid white;
        }

        .panel2 {
            height: 175px;
            background-color: chocolate;
            color: white;
            text-align: center;
            border: 5px solid white;
        }

        .panel3 {
            height: 175px;
            background-color: yellowgreen;
            color: white;
            text-align: center;
            border: 5px solid white;
        }
    </style>

</asp:Content>

<asp:Content ContentPlaceHolderID="cphContent" runat="server">
    <div class="container">
        <div class="row">

            <div style="border: 5px solid white;">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="Images/pic1.jpg" alt="..." />
                        </div>
                        <div class="item">
                            <img src="Images/pic9.jpg" alt="..." />
                        </div>
                        <div class="item">
                            <img src="Images/pic6.jpg" alt="..." />
                        </div>
                        <div class="item">
                            <img src="Images/pic12.jpg" alt="..." />
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"></a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"></a>
                </div>
            </div>
            <asp:Panel ID="anonMenu" runat="server">
                <div class="col-md-3">
                    <a href="Pages/OrderPage.aspx">
                        <div class="row panel1">
                            <h2>Order</h2>
                        </div>
                    </a>
                    <a href="Pages/AvailableToppingsPage.aspx">
                        <div class="row panel2">
                            <h2>Available Toppings</h2>
                        </div>
                    </a>
                    <a href="Login.aspx">
                        <div class="row panel3">
                            <h2>Employee Login</h2>
                        </div>
                    </a>
                </div>
            </asp:Panel>
        </div>
        <div>
            <h1>About</h1>
            <p>
                Since its beginning in 1960 on Willingdon Ave, Mary's Pizzeria is proud to be Burnaby's #1 choice for home made classic Italian cuisine. Enjoy a variety of delicious pizzas, pastas, panini sandwiches, desserts, and beverages. Our pizza and pasta sauce is made fresh daily with special secret organic ingredients. Come join us in our family run restaurant where you are treated like family and  experience a part of Italy right here in Burnaby.
            </p>
        </div>

        <hr />
    </div>
</asp:Content>
