<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashBoard/Admin.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="OnlineShoeWebsite.AdminDashBoard.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

        .line {
            border: 1.5px solid #ff2400;
            width: 100px;
            background: #ff2400;
            border-radius: 5px;
            margin: auto;
        }

        .table-bordered thead td, .table-bordered thead th {
            text-align: center;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <h4 class="text-center">List of Products</h4>
    <p class="line"></p>
    <br />
    <br />
    <%-- <div style="overflow-x:scroll";>
      <%--  <asp:GridView ID="gvProduct" runat="server" CssClass="table table-bordered">

           </asp:GridView>
    </div>--%>


    <table id="tbDetails" class="table table-bordered">
        <thead>
            <tr style="border: solid 1px #000000">
                <th>PId</th>
                <th>Name</th>
                <th>Price</th>
                <th>Selling Price</th>
                <th>Quantity</th>
                <th>Brand</th>
                <th>Category</th>
                <th>Gender</th>
                <th>Image</th>
                <th>Description</th>
                <th>Size</th>

            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>


    <br />


    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProductList.aspx/BindDatatable",
                data: "{}",
                dataType: "json",
                success: function (data) {

                    //console.log(data.d);

                    for (var i = 0; i < data.d.length; i++) {
                        $("#tbDetails").append
                            ("<tr><td>" + data.d[i].PId +
                                "</td><td>" + data.d[i].PName +
                                "</td><td>" + data.d[i].PPrice +
                                "</td><td>" + data.d[i].PSelling_Price +
                                "</td><td>" + data.d[i].PQuantity +
                                "</td><td>" + data.d[i].BrandName +
                                "</td><td>" + data.d[i].CatName +
                                "</td><td>" + data.d[i].GenderName +
                            "</td><td><img src= " + data.d[i].PImage + " width='100px' height='100px' class='img-fluid'/>" +
                                "</td><td>" + data.d[i].PDescription +
                                "</td><td>" + data.d[i].SizeNumber +
                                //"</td><td><a href = DeleteProd.aspx?PId=" + data.d[i].PId + " class='btn btn-warning'>Delete</a>"  +
                                "</td></tr>"
                            );


                    }

                    $('#tbDetails').DataTable();
                },
                error: function (result) {
                    alert("Error");
                }
            });
        });
    </script>
</asp:Content>
