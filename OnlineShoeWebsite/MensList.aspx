<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="MensList.aspx.cs" Inherits="OnlineShoeWebsite.MensList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
         .mycasual {
            margin: auto !important;
        }

          .navi{
            margin-top:8px!important;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>
          <br />
            <div class="text-center bg-light">
                <label class="font-weight-bolder" style="font-size: 22px;">Mens Shoes</label>
            </div>

            <asp:DataList ID="dlMens" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="mycasual">
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
</asp:Content>
