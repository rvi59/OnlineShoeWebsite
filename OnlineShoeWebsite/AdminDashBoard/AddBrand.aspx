<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.AddBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
    <style type="text/css">
        .b1 {
            box-shadow: rgb(0 0 0 / 24%) 0px 3px 8px;
            min-height: 390px;
            padding-top: 35px;
            padding-right: 30px;
            padding-left: 30px;
        }

            .b1 label {
                font-size: 22px;
            }

        #btnSubmit {
            border-radius: 22px;
        }

        .mySubmit {
            padding-bottom: 30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container b1">
        <h3 class="font-weight-bold">Add Brand</h3>
        <br />
        <div class="form-group">
            <label for="txtbrand" class="font-weight-normal">Brand Name</label>
            <asp:TextBox ID="txtbrand" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
       <%-- <div class="form-group">
            <label for="ddlCat" class="font-weight-normal">Select Category</label>
            <asp:DropDownList ID="ddlCat" runat="server" class="form-control"></asp:DropDownList>
        </div>--%>
       <%-- <div class="form-group">
            <label for="ddlSize" class="font-weight-normal">Select Size</label>
            <asp:DropDownList ID="ddlSize" runat="server" class="form-control"></asp:DropDownList>
        </div>--%>
        <br />
        <div class="mySubmit">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" CausesValidation="false" OnClick="btnSubmit_Click" OnClientClick="javascript: return myFun();"/>
            <span class="btn btn-primary" style="float: right;"><a href="BrandList.aspx">Brand List</a></span>
        </div>
        
    </div>
   <script>

       function myFun() {
           var brandName = $('#ContentPlaceHolder1_txtbrand').val();
           var catDrop = $("#ContentPlaceHolder1_ddlCat").val();
           //var sizeDrop = $("#ContentPlaceHolder1_ddlSize").val();
           console.log(brandName);
           if (brandName == "") {
               alert('Please Enter Brand Name');
               return false;
           }
           //if (catDrop <1) {
           //    alert('Please Select Category');
           //    return false;
           //}
           //if (sizeDrop<1) {
           //    alert('Please Select Size');
           //    return false;
           //}
           return true;
       }
   </script>

</asp:Content>
