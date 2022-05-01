<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OnlineShoeWebsite.Accounts.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container my-5">
        <div class="form-group">
            <label style="font-weight: bold;">Please Enter Your Email Address, We will send you the recovery mail for your Password.</label>
            <br />
            <asp:TextBox ID="txtmail" runat="server" CssClass="form-control" placeholder="Enter Email Address"></asp:TextBox>
            
        </div>
        <br />
        
       
        <asp:Button ID="btnMail" runat="server" Text="Get Mail"  CssClass="btn btn-success" OnClick="btnMail_Click" OnClientClick="check1();"/>

    </div>


    <script>
        //$("#btnMail").click(function (e) {

            //e.preventDefault();


            //var Fmail = $('#ContentPlaceHolder1_txtmail').val();

            //if ($.trim(Fmail).length == 0) {
            //    alert("Please enter your email address.");
            //    return false;
            //}

            //var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            //if (!filter.test(Fmail)) {
            //    alert('Please provide a valid email address');
            //    return false;
            //}
       
            //$.ajax({
            //    type: 'post',
            //    url: 'ForgotPassword.aspx/forgotPass',
            //    data: "{emailid:'" + Fmail + "'}",
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (response) {
            //        $("#inEmail").val("");
            //        alert("Mail Sent");
            //    },
            //    error: function (response) {
            //        alert("Failed");

            //    }


            //});


        //});

    </script>
</asp:Content>
