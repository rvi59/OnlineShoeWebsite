<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineShoeWebsite.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .mySeachgroup {
            width: 80%;
            margin: auto;
        }

        .mycat{
            width:12%;
            margin:auto;
        }

        @media screen and (max-width:750px) {
            .mySearchbtn {
                margin-top: 10px !important;
            }
        }

        .mytouch{
            margin-left:4em;
        }

        .mycasual {
            margin: auto !important;
        }

        footer {
            width: 100%;
            background-color: #454444;
        }

        .container0 {
            width: 80%;
            margin: 0 auto;
            padding: 3rem 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

            .container0 .row {
                width: 100%;
                display: grid;
                gap: 10px;
                grid-template-columns: repeat(3, 1fr);
                place-items: center;
            }

                .container0 .row:nth-child(2) {
                    grid-template-columns: repeat(1, 1fr);
                    margin-top: 1rem;
                }

        .row .col {
            height: 100%;
            align-self: flex-start;
        }

        .col h3 {
            font-size: 25px;
            margin-bottom: 1rem;
            color:#fff;
        }

        ul li {
            list-style-type: none;
            margin: 0.75rem 0;
        }

            ul li a {
                font-size: 14px;
                color: #fff;
                text-decoration: none;
                padding: 7px 10px;
                border-radius: 5px;
                transition: 0.4s ease;
            }

                ul li a:hover {
                    background-color: #5ac1d8;
                }

        .container0 .row:nth-child(2) ul {
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }

            .container0 .row:nth-child(2) ul li a {
                color: #ccc;
                font-size: 16px;
            }

                .container0 .row:nth-child(2) ul li a:hover {
                    background-color: transparent;
                }

       
        .socail ul {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0;
            padding: 0;
        }

            .socail ul li {
                margin-right: 0.5rem;
            }

                .socail ul li a {
                    font-size: 24px;
                }

        @media screen and (max-width: 768px) {
            .container0 .row {
                grid-template-columns: repeat(1, 1fr);
                justify-content: center;
                align-items: center;
                text-align: center;
            }

             .mytouch{
            margin-left:0em;
        }

            .col h3 {
                font-size: 24px;
            }
            

            ul li a {
                font-size: 16px;
            }

            .container0 .row:nth-child(2) ul li a {
                font-size: 14px;
            }

            .m2{
                margin-top:10px;
            }
        }

        @media screen and (max-width: 520px) {
            .col h3 {
                font-size: 18px;
            }

           
            ul li a {
                font-size: 14px;
            }

            .container0 .row:nth-child(2) ul li a {
                font-size: 12px;
            }

            .m1{
                margin-left:-20px;
            }

            .m2{
                margin-left:-20px;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="container">
            <center>
                <div class="row my-4 mySeachgroup">
                    <div class="col-md-10">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                        <%-- <input type="text" placeholder="Search Product" class="form-control" />--%>
                    </div>
                    <div class="col-md-2 mySearchbtn">
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-secondary" Text="Search" CausesValidation="false" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </center>
        </div>

        <div class="mycat">
            <div class="row">
                <div class="col-md-6 m1">
                    <asp:Button ID="btnMen" runat="server" Text="Men" CssClass="btn btn-danger" OnClick="btnMen_Click"/>
                </div>
                 <div class="col-md-6 m2">
                     <asp:Button ID="btnWomen" runat="server" Text="Women" CssClass="btn btn-info" OnClick="btnWomen_Click"/>
                </div>
            </div>
        </div>
        <br />
       
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="Content/Imges/SliderImg/slide3.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Content/Imges/SliderImg/slide2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Content/Imges/SliderImg/slide1.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br />
        <br />


        <%--        Latest Casual Shoes--%>
        <div>
            <div class="text-center bg-light">
                <label class="font-weight-bolder" style="font-size: 22px;">Latest Casual Shoes</label>
            </div>

            <asp:DataList ID="dlCasual" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="mycasual">
                <ItemTemplate>
                    <div class="card" style="width: 18rem; margin: 10px;">
                        <asp:Image ID="Image1" runat="server" Width="280px" Height="190px" ImageUrl='<%# Bind("PImage", "{0}") %>' CssClass="card-img-top" />
                        <div class="card-body">
                            <asp:Label ID="Label1" class="card-title" runat="server" Text='<%# Eval("PShortName") %>'></asp:Label>
                            <p>
                                <b>Price</b>
                                 <asp:Label ID="Label14" class="card-title card-text" ForeColor="red" Font-Bold="true" runat="server" Text='<%# Eval("PSelling_Price") %>'></asp:Label>
                                <asp:Label ID="Label12" class="card-title card-text" ForeColor="red" Font-Italic="true" Font-Strikeout="true" runat="server" Text='<%# Eval("PPrice") %>'></asp:Label>
                            </p>
                            <a href="ProductDetails.aspx?PId=<%# Eval("PId") %>" style="width: 110px;" class="btn btn-warning card-link">View More</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <br />
        <br />


        <%--        Latest Formal Shoes--%>
        <div>
            <div class="text-center bg-light">
                <label class="font-weight-bolder" style="font-size: 22px;">Latest Formal Shoes</label>
            </div>

            <asp:DataList ID="dlFormal" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="mycasual">
                <ItemTemplate>
                    <div class="card" style="width: 16rem; margin: 10px;">
                        <asp:Image ID="Image1" runat="server" Width="280px" Height="300px" ImageUrl='<%# Bind("PImage", "{0}") %>' CssClass="img-fluid" />
                        <div class="card-body">
                            <asp:Label ID="Label1" class="card-title" runat="server" Text='<%# Eval("PShortName") %>'></asp:Label>
                            <p>
                                <b>Price</b>
                                <asp:Label ID="Label14" class="card-title card-text" ForeColor="red"  Font-Bold="true"  runat="server" Text='<%# Eval("PSelling_Price") %>'></asp:Label>
                                 <asp:Label ID="Label12" class="card-title card-text" ForeColor="red" Font-Italic="true" Font-Strikeout="true" runat="server" Text='<%# Eval("PPrice") %>'></asp:Label>

                            </p>
                            <a href="ProductDetails.aspx?PId=<%# Eval("PId") %>" style="width: 110px;" class="btn btn-warning card-link">View More</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <br />
        <br />

        <%--        Latest Sports Shoes--%>
        <div>
            <div class="text-center bg-light">
                <label class="font-weight-bolder" style="font-size: 22px;">Latest Sports Shoes</label>
            </div>

            <asp:DataList ID="dlSports" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="mycasual">
                <ItemTemplate>
                    <div class="card" style="width: 18rem; margin: 10px;">
                        <asp:Image ID="Image1" runat="server" Width="280px" Height="190px" ImageUrl='<%# Bind("PImage", "{0}") %>' CssClass="card-img-top" />
                        <div class="card-body">
                            <asp:Label ID="Label1" class="card-title" runat="server" Text='<%# Eval("PShortName") %>'></asp:Label>
                            <p>
                                <b>Price</b>
                                 <asp:Label ID="Label14" class="card-title card-text" ForeColor="red" Font-Bold="true" runat="server" Text='<%# Eval("PSelling_Price") %>'></asp:Label>
                                <asp:Label ID="Label12" class="card-title card-text" ForeColor="red" Font-Italic="true" Font-Strikeout="true" runat="server" Text='<%# Eval("PPrice") %>'></asp:Label>
                            </p>
                            <a href="ProductDetails.aspx?PId=<%# Eval("PId") %>" style="width: 110px;" class="btn btn-warning card-link">View More</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

    </div>
    <br />
    <br />
    <div>
          <%--Footer--%>
        <footer>
            <div class="container0">
                <div class="row">
                    <div class="col about">
                        <h3>About the US</h3>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Career</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Return policy</a></li>                           
                        </ul>
                    </div>

                     <div class="col about">
                        <h3>Help</h3>
                        <ul>
                            <li><a href="#">Payment</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Cancellation & Return</a></li>
                            <li><a href="#">Return Policy</a></li>
                            <li><a href="#">Security</a></li>
                            <li><a href="#">Return Policy</a></li>
                        </ul>
                    </div>

                    <div class="col socail">
                        <h3 class="mytouch">Get in touch</h3>
                        <ul>
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                </div>
                
            </div>
        </footer>
    </div>
</asp:Content>
