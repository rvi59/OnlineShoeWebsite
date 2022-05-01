<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="OnlineShoeWebsite.Payout.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        .navi {
            margin-top: 8px !important;
          
        }

        #HpUser{
            padding:8px;
        }


        #btnLogout:hover{
              background-color: #5ac1d8;
              border-radius:10px;
              padding-left:8px;
              padding-right:8px;
              padding-top:4px;
              padding-bottom:4px;

        }

         </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div id="invoice" style="margin:auto; width:50%;">
    <div class="container" style="border: 1px solid grey; margin-top: 50px;">
        <div class="row">
            <div class="col-md-6">
                <img src="../Content/Imges/mylogo.PNG" alt="Alternate Text" height="80" width="150" />
            </div>
            <div class="col-md-6" style="font-weight: bolder; margin-top:20px;">
                Invoice No:&nbsp;&nbsp; <span>
                    <asp:Label ID="lblOrderId" runat="server"></asp:Label>
                </span> 
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col-md-6">
                <div>
                    <b>Name :
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label></b>
                </div>
                <div>
                    <b>Email :
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></b>
                </div>
                <div>
                    <b>Mobile :
                        <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label></b>
                </div>
            </div>
            <br />

            <div class="col-md-6">
                <div>
                    <b>Address :
                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></b>
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvProdInfo" runat="server" CssClass="table"></asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
            
             
            </div>
            <div class="col-md-6">
                <div class="row" style="border:2px solid grey;">
                    <div class="col-md-6">
                       <label class="font-weight-bold"> Grand Total</label>
                    </div>
                      <div class="col-md-6">
                          <asp:Label ID="lblgdTotal" runat="server" Font-Bold="true" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            

        </div>

        <br />
      
    </div>
    </div>
    <br />
    <div class="container" style="width:50%; margin:auto;">
        <div>
           <%-- <asp:Button ID="btnPrint" runat="server" Text="Download Invoice" OnClick="btnPrint_Click"/>--%>
            <button class="btn btn-primary" onclick="printDiv()">Download as PDF</button>
        </div>
    </div>


   
  <script>
      function printDiv() {
          var divContents = document.getElementById("invoice").innerHTML;
          var a = window.open('', '', 'height=768, width=1300');
          //a.document.write('<html>');
          //a.document.write('<body > <h1>Div contents are <br>');
          a.document.write(divContents);
          //a.document.write('</body></html>');
          a.document.close();
          a.print();
      }
  </script>


</asp:Content>
