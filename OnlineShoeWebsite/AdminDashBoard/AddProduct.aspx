<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
    <style>
        .b1 {
            box-shadow: rgb(0 0 0 / 24%) 0px 3px 8px;
            min-height: 820px;
            padding-top: 35px;
            padding-right: 30px;
            padding-left: 30px;
            margin-bottom: 50px;
        }

            .b1 label {
                font-size: 22px;
                font-weight: 400;
            }

        @media screen and (max-width:1024px) {
            .b1 {
                min-height: 950px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container b1">

        <h3 class="font-weight-bold">Add Product</h3>
        <br />
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Product Name</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtPName" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>


         <div class="form-group row">
            <label class="col-sm-2 col-form-label">Short Name</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtPShortName" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Price</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtPPrice" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Selling Price</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtPSPrice" runat="server" class="form-control" TextMode="Number"></asp:TextBox>

            </div>
        </div>

         <div class="form-group row">
            <label class="col-sm-2 col-form-label">Quantity</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtQty" runat="server" class="form-control" TextMode="Number"></asp:TextBox>

            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Brand</label>
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlBrand" runat="server" class="form-control"></asp:DropDownList>

            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Category</label>
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlCategory" runat="server" class="form-control"></asp:DropDownList>
            </div>
        </div>



        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Gender</label>
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlGender" runat="server" class="form-control"></asp:DropDownList>

            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Size</label>
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlSize" runat="server" class="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Description</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Upload Image</label>
            <div class="col-sm-8">
                <asp:FileUpload ID="FileUpload1" runat="server" class="file-input" ValidateRequestMode="Enabled" />
                <br />
                <%--<asp:Label ID="lblimgError" runat="server" Text="" ForeColor="Red"></asp:Label>--%>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <asp:Button ID="btnSubmit" runat="server" Text="Add Product" class="btn btn-success" OnClick="btnSubmit_Click" OnClientClick="javascript: return myFun();" />
                <span class="btn btn-primary" style="float: right;"><a href="ProductList.aspx">Product List</a></span>

            </div>
        </div>
    </div>


    <script>

        function myFun() {
            var prodName = $('#ContentPlaceHolder1_txtPName').val();
            var prodSName = $('#ContentPlaceHolder1_txtPShortName').val();
            var prodPrice = $('#ContentPlaceHolder1_txtPPrice').val();
            var prodSellprice = $('#ContentPlaceHolder1_txtPSPrice').val();
            var txtQty = $('#ContentPlaceHolder1_txtQty').val();
            var prodBrand = $('#ContentPlaceHolder1_ddlBrand').val();
            var prodCat = $('#ContentPlaceHolder1_ddlCategory').val();
            var prodGender = $('#ContentPlaceHolder1_ddlGender').val();
            var prodSize = $('#ContentPlaceHolder1_ddlSize').val();
            var prodDesc = $('#ContentPlaceHolder1_txtDesc').val();
           
           
            console.log(prodName);
            if (prodName == "") {
               alert('Please Enter Product Name');
               return false;
            }

            if (prodSName == "") {
                alert('Please Enter Product Short Name');
                return false;
            }

            if (prodPrice == "") {
                alert('Please Enter Price Name');
                return false;
            }
            if (prodSellprice == "") {
                alert('Please Enter Selling Price Name');
                return false;
            }
            if (txtQty == "") {
                alert('Please Enter Product Quantity');
                return false;
            }
            if (prodBrand < 1) {
                alert('Please Select Brand');
                return false;
            }
            if (prodCat < 1) {
                alert('Please Select Category');
                return false;
            }
            if (prodGender < 1) {
                alert('Please Select Gender');
                return false;
            }
            if (prodSize < 1) {
                alert('Please Select Size');
                return false;
            }
            if (prodDesc == "") {
                alert('Please Enter Description');
                return false;
            }
          
           return true;
       }
    </script>
</asp:Content>
