<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineShoeWebsite.Accounts.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

        .myrow{
            box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 10px;
        }


        .lbl {
            font-weight: bold;
            color: #2D2D2D;
        }

        .leftside {
            background: #CFD6E5;
            background: -webkit-linear-gradient(to top, #CFD6E5 0%, #E6ECF3 500%);
            background: -moz-linear-gradient(to top, #CFD6E5 0%, #E6ECF3 50%);
            background: linear-gradient(to top, #CFD6E5 0%, #E6ECF3 50%);
        }

        #signbtn {
            padding-top: 4px;
            padding-bottom: 8px;
            padding-left: 30px;
            padding-right: 30px;
            font-family: 'Lato', sans-serif;
            border-radius: 20px;
            background-color: #F95E77;
            color: #fff;
            font-size: 20px;
        }

            #signbtn:hover {
                text-decoration: none;
                color: #fff;
                background-color: #Ea2143;
                font-size: 22px;
                transition: all .2s ease-in-out;
                padding-top: 6px;
                padding-bottom: 10px;
                padding-left: 34px;
                padding-right: 34px;
            }

        .regRespo0 {
            width: 40%;
            display: inline-block;
        }

        .regRespo1 {
            width: 40%;
            display: inline-block;
            float: right;
        }

        @media screen and (min-width:770px) and (max-width:990px) {
            .regRespo0 {
                width: 100%;
                text-align: center;
            }

            .regRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            #signbtn {
                padding-left: 90px;
                padding-right: 90px;
            }
        }



        @media screen and (min-width:400px) and (max-width:560px) {

            .myrow{
                margin:2px;
            }

            .regRespo0 {
                width: 100%;
                text-align: center;
            }

            .regRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            #signbtn {
                padding-left: 100px;
                padding-right: 100px;
            }
        }



        @media screen and (min-width:350px) and (max-width:399px) {
             .myrow{
                margin:2px;
            }

            .regRespo0 {
                width: 100%;
                text-align: center;
            }

            .regRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }


            #signbtn {
                padding-left: 90px;
                padding-right: 90px;
            }
        }



        @media screen and (min-width:300px) and (max-width:349px) {

             .myrow{
                margin:2px;
            }

            .regRespo0 {
                width: 100%;
                text-align: center;
            }

            .regRespo1 {
                width: 100%;
                margin-top: 35px;
                text-align: center;
            }

            #signbtn {
                padding-left: 60px!important;
                padding-right: 60px!important;
            }
        }




        @media screen and (max-width:447px) {
            #myRegis {
                font-size: 2em;
            }
        }


        #logbtn {
            color: #F95E77;
            text-align: center;
            margin-top: -10px;
            font-family: 'Lato', sans-serif;
        }


            #logbtn:hover {
                font-size: 18px;
                transition: all .2s ease-in-out;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container" style="min-height: 700px; margin-top: 5%; margin-bottom: 5%;">
        <div class="row myrow">
            <div class="col-md-6" style="background-color: #f7f8fa;">
                <img src="Images/SignupImg.png" alt="Alternate Text" class="img-fluid" />
            </div>
            <div class="col-md-6 leftside">
                <div>
                    <center>
                        <h1 id="myRegis" style="color: #56B2BD; font-weight: bold; font-family: 'Lato', sans-serif; margin-top: 14px; margin-bottom: 12px;">Register Here</h1>
                    </center>
                </div>
                <div style="width: 80%; margin: auto">

                    <div class="form-group">
                        <label class="lbl">Enter User Name</label>
                        <input type="text" id="txtUname" class="form-control">
                    </div>

                    <div class="form-group">
                        <label class="lbl">Enter New Password</label>
                        <input type="text" id="txtPass" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="lbl">Confirm New Password</label>
                        <input type="text" id="txtCPass" class="form-control">
                    </div>

                    <div class="form-group">
                        <label class="lbl">Enter Your Email</label>
                        <input type="text" id="txtEmail" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="lbl">Enter Your Name</label>
                        <input type="text" id="txtname" class="form-control">
                    </div>
                    <br />
                   
                    <div class="regRespo0">
                        <a href="Login.aspx" id="signbtn">Sign Up</a>
                    </div>
                    <div class="regRespo1">
                        <p style="font-weight: 500; font-family: 'Lato', sans-serif;">Already have Account ?</p>
                        <a href="Login.aspx" style="text-decoration: none;">
                            <p id="logbtn">Login Here</p>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {

            $('#signbtn').on('click', function (e) {


                e.preventDefault();

                var msg;

                var username = $("#txtUname").val();
                var password = $("#txtPass").val();
                var confirm_Pass = $("#txtCPass").val();
                var email = $("#txtEmail").val();
                var name = $("#txtname").val();

                if (username == "") {
                    msg += alert('Please Enter UserName');
                    return false;
                }


                if (password == "") {
                    msg += alert('Please Enter Password');
                    return false;
                }

                var validPass = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                if (!validPass.test(password)) {
                    alert('Password must contain at least one Upper, Lower, Number, Symbol and must be more than 6 characters');
                    return false;
                }




                if (confirm_Pass == "") {
                    msg += alert('Please Enter Confirm Password');
                    return false;
                }

                if (email == "") {
                    msg += alert('Please Enter Email');
                    return false;
                }


                var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
                if (!filter.test(email)) {
                    alert('Please provide a valid email address');
                    return false;
                }





                if (name == "") {
                    msg += alert('Please Enter Name');
                    return false;
                }



                if (confirm_Pass != password) {
                    msg += alert('Password and Confirm password must be same');
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: "Registration.aspx/addNewUser",
                    data: "{'user_Name':'" + username + "', 'user_Pass':'" + password + "','user_Email':'" + email + "','Name':'" + name + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == true) {

                            alert("data inserted successfully");
                        }
                        else {
                            alert("data insertion failed");
                        }
                    },
                    error: function (response) {
                        alert('Error' + response);
                    }
                });
            });
        });


    </script>

</asp:Content>
