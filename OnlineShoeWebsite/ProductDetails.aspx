<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="OnlineShoeWebsite.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>

         .navi{
            margin-top:8px!important;
        }

        .cf {
            width: 100%;
            margin-left: -42%;
            display:flex;
            justify-content:flex-end;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:DataList ID="dlDetails" runat="server">
        <ItemTemplate>
    <div style="margin-left:3em; margin-right:3em; margin-top:2em;">
        <table class="table table-borderless">
            <tr class="row">
                <td class="col-md-4">
                     <asp:Image ID="Image1" runat="server" Width="425px" Height="360px" ImageUrl='<%# Bind("PImage", "{0}") %>' CssClass="img-fluid" />
                </td>
                <td class="col-md-8">
                    <table style="background-color:lavender;">
                        <tr>
                            <td><b>Name:</b></td>
                            <td>
                                <asp:Label ID="Label1" Font-Size="Medium" Font-Italic="true" runat="server" Text='<%# Eval("PName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Price:</b></td>
                            <td>
                                <asp:Label ID="Label2" Font-Size="Medium" Font-Italic="true" runat="server" Text='<%# Eval("PSelling_Price") %>'></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td><b>Brand:</b></td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Font-Italic="true" Text='<%# Eval("brandName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Category:</b></td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Font-Size="Medium" Font-Italic="true" Text='<%# Eval("CatName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Size:</b></td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Font-Size="Medium" Font-Italic="true" Text='<%# Eval("SizeNumber") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Gender:</b></td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Font-Size="Medium" Font-Italic="true" Text='<%# Eval("GenderName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Description</b></td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Font-Size="Medium" Font-Italic="true" Text='<%# Eval("PDescription") %>'></asp:Label>
                            </td>
                        </tr>
                       
                       
                    </table>
                    <br />
<%--                    <asp:LinkButton ID="lbCart" runat="server" OnClick="lbCart_Click" CssClass="btn btn-success">Add To Cart</asp:LinkButton>--%>
<%--                    <a href="Payout/Cart.aspx?PId=<%# Eval("PId") %>" class="btn btn-success">Add To Cart</a>--%>
<%--                    <asp:Button ID="btngotoCart" runat="server" CssClass="btn btn-success" Text="Add To Cart" OnClick="Button1_Click"/>--%>

                </td>
            </tr>
        </table>
    </div>
            </ItemTemplate>
        </asp:DataList>
    <div class="cf">
        <div>
            <table>
                <tr>
                    <td>
                <label class="font-weight-bold">Quantity&nbsp;&nbsp;</label>
                    </td>
                    <td>
                 <asp:TextBox ID="txtQty" runat="server" Text="1" TextMode="Number" Width="150px" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                      <td>
             <asp:LinkButton ID="lbCart" runat="server" OnClick="lbCart_Click" CssClass="btn btn-success">Add To Cart</asp:LinkButton>

                    </td>
                </tr>
               
            </table>
           
            
        </div>
       
    </div>

</asp:Content>
