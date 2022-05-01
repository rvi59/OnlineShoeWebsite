<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="OnlineShoeWebsite.SearchResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container">
        <br />
        <br />
            <center>
                <asp:Label ID="lblSearch" ForeColor="Black" CssClass="text-" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-warning" Text="Go Back" PostBackUrl="~/Default.aspx" Visible="false"/>
            </center>
        <br />
             <asp:DataList ID="DataListSearch" runat="server" RepeatDirection="Horizontal" CssClass="table" RepeatColumns="4">
                <ItemTemplate>
                    <div class="card" style="width: 18rem;">
                        <asp:Image ID="Image1" runat="server" Width="250px" Height="220px" ImageUrl='<%# Bind("PImage", "{0}") %>' CssClass="img-fluid card-img-top" />
                        <div class="card-body">
                            <asp:Label ID="Label1" class="card-title" runat="server" Text='<%# Eval("PName") %>'></asp:Label>
                            <p>
                                <b>Price</b>
                                <asp:Label ID="Label12" class="card-title card-text" ForeColor="red" Font-Italic="true" Font-Bold="true" runat="server" Text='<%# Eval("PPrice") %>'></asp:Label>
                                <asp:Label ID="Label14" class="card-title card-text" ForeColor="red" Font-Italic="true" Font-Strikeout="true" runat="server" Text='<%# Eval("PSelling_Price") %>'></asp:Label>
                            </p>
                             <a href="ProductDetails.aspx?PId=<%# Eval("PId") %>" style="width: 110px;" class="btn btn-warning card-link">View More</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

        </div>
</asp:Content>
