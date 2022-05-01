<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineShoeWebsite.Accounts.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
    <style>
        .myrow {
            box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 10px;
        }

        .lbl {
            font-weight: bold;
            color: #2D2D2D;
        }

        .img1 {
            margin-left: 50px;
        }

        .leftside {
            background: #CFD6E5;
            background: -webkit-linear-gradient(to top, #CFD6E5 0%, #E6ECF3 500%);
            background: -moz-linear-gradient(to top, #CFD6E5 0%, #E6ECF3 50%);
            background: linear-gradient(to top, #CFD6E5 0%, #E6ECF3 50%);
        }

        .Loginbtn {
            padding-top: 4px;
            padding-bottom: 8px;
            padding-left: 30px;
            padding-right: 30px;
            font-family: 'Lato', sans-serif;
            border-radius: 20px;
            border: none;
            background-color: #F95E77;
            color: #fff;
            font-size: 20px;
        }

            .Loginbtn:hover {
                text-decoration: none;
                color: #fff;
                background-color: #Ea2143;
                font-size: 22px;
                transition: all .2s ease-in-out;
                padding-top: 6px;
                padding-bottom: 8px;
                padding-left: 30px;
                padding-right: 30px;
            }




        .logRespo0 {
            width: 40%;
            display: inline-block;
        }

        .logRespo1 {
            width: 40%;
            display: inline-block;
            float: right;
        }


        @media screen and (min-width:992px) and (max-width:1199px) {

            .logRespo1 {
                width: 50%;
                display: inline-block;
                float: right;
            }
        }



        @media screen and (min-width:768px) and (max-width:990px) {

            .logRespo1 {
                width: 50%;
                display: inline-block;
                float: right;
            }


            .logRespo0 {
                width: 100%;
                text-align: center;
            }

            .logRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            .Loginbtn {
                padding-left: 90px;
                padding-right: 90px;
            }
        }



        @media screen and (min-width:480px) and (max-width:766px) {


            html, body {
                overflow-x: hidden;
            }


            .myrow {
                margin: 2px;
            }

            .logRespo1 {
                width: 50%;
                display: inline-block;
                float: right;
            }


            .logRespo0 {
                width: 100%;
                text-align: center;
            }

            .logRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            .Loginbtn {
                padding-left: 140px;
                padding-right: 140px;
            }
        }




        @media screen and (min-width:400px) and (max-width:479px) {


            html, body {
                overflow-x: hidden;
            }

            .myrow {
                margin: 2px;
            }

            .logRespo1 {
                width: 50%;
                display: inline-block;
                float: right;
            }


            .logRespo0 {
                width: 100%;
                text-align: center;
            }

            .logRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            .Loginbtn {
                padding-left: 110px;
                padding-right: 110px;
                margin-left: -5px;
            }
        }



        @media screen and (min-width:360px) and (max-width:399px) {


            html, body {
                overflow-x: hidden;
            }

            .myrow {
                margin: 2px;
            }

            .logRespo1 {
                width: 50%;
                display: inline-block;
                float: right;
            }


            .logRespo0 {
                width: 100%;
                text-align: center;
            }

            .logRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            .Loginbtn {
                padding-left: 90px;
                padding-right: 90px;
                margin-left: -10px;
            }
        }




        @media screen and (min-width:300px) and (max-width:359px) {


            html, body {
                overflow-x: hidden;
            }


            .myrow {
                margin: 2px;
            }

            .logRespo1 {
                width: 50%;
                display: inline-block;
                float: right;
            }


            .logRespo0 {
                width: 100%;
                text-align: center;
            }

            .logRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            .Loginbtn {
                padding-left: 60px;
                padding-right: 60px;
                margin-left: -10px;
            }
        }


        @media screen and (max-width:447px) {
            #myLogHead {
                font-size: 2em;
            }
        }


        #regisbtn {
            color: #F95E77;
            text-align: center;
            margin-top: -10px;
            font-family: 'Lato', sans-serif;
        }


            #regisbtn:hover {
                font-size: 18px;
                transition: all .2s ease-in-out;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container" style="min-height: 700px; margin-top: 5%; margin-bottom: 5%;">
        <div class="row myrow">
            <div class="col-md-6" style="background-color: #f7f8fa;">
                <img src="Images/LoginImg.png" alt="Alternate Text" class="img-fluid img1" />
            </div>
            <div class="col-md-6 leftside">
                <div>
                    <center>
                        <h1 id="myLogHead" style="color: #56B2BD; font-weight: bold; font-family: 'Lato', sans-serif; margin-top: 14px; margin-bottom: 12px;">Login Here</h1>
                    </center>
                </div>
                <div style="width: 80%; margin: auto; margin-top: 50px;">

                    <div class="form-group">
                        <label class="lbl">Enter Your Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="lbl">Enter New Password</label>
                        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:CheckBox ID="ChkRem" runat="server" />
                        <label class="form-check-label">Remember me</label>
                    </div>

                     <div class="form-group">
                         <a href="ForgotPassword.aspx">Forget Password</a>
                    </div>
                    <br />
                    <br />

                    <div class="logRespo0">
                        <asp:Button ID="Loginbtn" runat="server" CssClass="Loginbtn" Text="Login" OnClick="Loginbtn_Click" OnClientClick="myLogfun();"/>
                    </div>
                    <div class="logRespo1">
                        <p style="font-weight: 500; font-family: 'Lato', sans-serif;">Already have Account ?</p>
                        <a href="Registration.aspx" style="text-decoration: none;">
                            <p id="regisbtn">Sign up here</p>
                        </a>
                    </div>

                </div>
                <center>
                </center>
            </div>
        </div>
    </div>

</asp:Content>
