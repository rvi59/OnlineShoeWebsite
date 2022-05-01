<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="BrandList.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.BrandList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .line{
            border:1.5px solid #ff2400;
            width:100px;
            background:#ff2400;
            border-radius:5px;
            margin:auto;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <h4 class="text-center">List of Brands</h4>
    <p class="line"></p>
    <br />
    <br />

    <asp:GridView ID="gvBrand" runat="server" CssClass="table table-bordered" >
    </asp:GridView>

    <br />
 
</asp:Content>
