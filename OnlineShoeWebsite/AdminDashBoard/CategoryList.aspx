<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.CategoryList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .line {
            border: 1.5px solid #ff2400;
            width: 100px;
            background: #ff2400;
            border-radius: 5px;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h4 class="text-center">List of Category</h4>
    <p class="line"></p>
    <br />
    <br />

    <asp:GridView ID="gvCategory" runat="server" CssClass="table table-bordered" OnRowDataBound="gvCategory_RowDataBound">
    </asp:GridView>

</asp:Content>
