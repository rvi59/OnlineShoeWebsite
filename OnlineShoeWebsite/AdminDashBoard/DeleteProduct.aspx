<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="DeleteProduct.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.DeleteProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
         <h5>Enter Product Id </h5>
        <div class="row">
            <div class="col-md-6 col-lg-6">
                 <asp:TextBox ID="txtId" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
            </div>
             <div class="col-md-6 col-lg-6">
                   <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
        </div>
         <br />
        <asp:Label ID="lbl1" Font-Bold="true" Text="Product Short Summary" runat="server"/><br />
        <asp:GridView ID="GV1" CssClass="table table-bordered" runat="server"></asp:GridView>

        <br />

        <asp:Button ID="btnDel" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDel_Click" />

    </div>
</asp:Content>
