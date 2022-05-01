<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="OnlineShoeWebsite.Accounts.RecoverPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container my-5">
        <center>
            <h3>Reset Password</h3>
        </center>
        <br />
        <div class="form-group">
            <label style="font-weight: bold; color: #2D2D2D;">Enter New Password</label>
            <asp:TextBox ID="txtnpass" runat="server" placeholder="Enter New Password" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter New Password" ControlToValidate="txtnpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label style="font-weight: bold; color: #2D2D2D;">Confirm New Password</label>
            <asp:TextBox ID="txtcnpass" runat="server" placeholder="Enter Confirm Password" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Confirm New Password" ControlToValidate="txtcnpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matched" ControlToValidate="txtcnpass" ControlToCompare="txtnpass" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
        </div>
        <br />
        <div class="text-center">
            <asp:Button ID="btnReset" runat="server" CssClass="btn btn-success" Text="Reset" OnClick="btnReset_Click" />
        </div>
    </div>

</asp:Content>
