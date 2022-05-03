<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="OnlineShoeWebsite.Payout.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .navi{
            margin-top:6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="margin: auto; width: 50%;">
        <div style="margin-top: 100px;">
            <h3 style="text-align: center;">Checkout</h3>
        </div>

        <div class="form-group">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Address</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address Cannot be Empty" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
            

        </div>
        <div class="form-group">
            <label>Mobile Number</label>
            <asp:TextBox ID="txtNumber" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mobile Number Cannot be Empty" ForeColor="Red" ControlToValidate="txtNumber" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Valid Number" ForeColor="Red" ControlToValidate="txtNumber" Display="Dynamic" ValidationExpression="(0|91)?[7-9][0-9]{9}"></asp:RegularExpressionValidator>
            

        </div>
        <br />
        <div>
            <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn btn-success" OnClick="btnPay_Click" />
        </div>

    </div>




    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script>
       
      

        function OpenPaymentWindow(key, amountInSubmits, currency, name, description, imageLogo, orderId, profileName, profileEmail, profileMobile, notes) {

            notes = $.parseJSON(notes);

            var options = {
                "key": key, // Enter the Key ID generated from the Dashboard
                "amount": amountInSubmits, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                "currency": currency,
                "name": profileName,
                "description": description,
                "image": imageLogo,
                "order_id": orderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1

                "handler": function (response) {
                    window.location.href = "Success.aspx";
                },

                "prefill": {
                    "name": profileName,
                    "email": profileEmail,
                    "contact": profileMobile
                },
                "notes": notes,
                "theme": {
                    "color": "#3399cc"
                }
            };

            var rzp1 = new Razorpay(options);
            rzp1.open();
            rzp1.on('payment.failed', function (response) {

                console.log(response.error);
                alert('Oops, something went wrong.');
            });

        }





    </script>




</asp:Content>
