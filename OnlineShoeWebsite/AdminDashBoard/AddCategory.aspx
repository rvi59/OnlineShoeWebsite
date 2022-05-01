<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .b1 {
            box-shadow: rgb(0 0 0 / 24%) 0px 3px 8px;
            min-height: 340px;
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container b1">
        <h3 class="font-weight-bold">Add Category</h3>
        <br />
        <div class="form-group">
            <label for="txtcategory" class="font-weight-normal">Category Name</label>
            <asp:TextBox ID="txtcategory" runat="server" CssClass="form-control"></asp:TextBox>

        </div>
        <br />
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" OnClientClick="javascript: return myFun();"/>
            <span class="btn btn-primary" style="float: right;"><a href="CategoryList.aspx">Category List</a></span>

        </div>

    </div>

    <script>

        function myFun() {
           var categoryName = $('#ContentPlaceHolder1_txtcategory').val();
           
           console.log(categoryName);
           if (categoryName == "") {
               alert('Please Enter Category Name');
               return false;
           }
          
           return true;
       }
    </script>
</asp:Content>
