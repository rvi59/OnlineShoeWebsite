<%@ Page Title="" Language="C#" MasterPageFile="~/Shoe.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OnlineShoeWebsite.Payout.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .navi {
            margin-top: 8px !important;
        }
       
  #ContentPlaceHolder1_gvTotal td{
    border-right:1px solid white;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <br />
    <br />
    <center>
        <h2>Cart Details</h2>
    </center>
    <br />
    <br />
    <div class="container">

        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="Cartid" OnRowCancelingEdit="gvCart_RowCancelingEdit" OnRowDeleting="gvCart_RowDeleting" OnRowEditing="gvCart_RowEditing" OnRowUpdating="gvCart_RowUpdating" ShowFooter="true">
            <Columns>
                <asp:TemplateField HeaderText="Product Image" HeaderStyle-BackColor="#454d55" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Width="120px" Height="100px" ImageUrl='<%# Bind("PImage", "{0}") %>' CssClass="img-fluid" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Product Name" HeaderStyle-BackColor="#454d55" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label ID="Label1" Font-Size="Medium" Font-Italic="true" runat="server" Text='<%# Bind("PName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Product Price" HeaderStyle-BackColor="#454d55" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label ID="Label2" Font-Size="Medium" Font-Italic="true" runat="server" Text='<%# Bind("PSelling_Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quanity" HeaderStyle-BackColor="#454d55" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label ID="Label22" Font-Size="Medium" Font-Italic="true" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" Text='<%#Eval("Quantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Items Price" HeaderStyle-BackColor="#454d55" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label ID="Label3" Font-Size="Medium" Font-Italic="true" runat="server" Text='<%# Bind("TotalPrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action" HeaderStyle-BackColor="#454d55" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-info" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-info" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-dark" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

       


        <table class="table table-dark">
            <tr>
               
                 <td>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td> 
                 <td>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td> 
                 <td>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>   
                <td>
                    <label style="font-weight:bold; font-size:18px;">Total</label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="" Font-Bold="true" Font-Size="18px"></asp:Label>
                </td>
                  <td>
                      <asp:LinkButton ID="linkChk" runat="server" CssClass="btn btn-success" OnClick="linkChk_Click">Checkout</asp:LinkButton>
                </td> 
            </tr>
        </table>


    </div>

</asp:Content>
