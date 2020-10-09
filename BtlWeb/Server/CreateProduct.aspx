<%@ Page Title="" Language="C#" MasterPageFile="~/Server/Admin.Master" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="BtlWeb.Server.CreateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .trTable{
           padding-bottom: 10px; 
        }
    </style>
    <form id="AddProduct" runat="server">
        <h1 class="mt-4">Add Product</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Data
            </div>
            <div class="card-body">
                <table>
                    <tr>
                        <td class="trTable"><asp:Label ID="Label1" runat="server" Text="Label">Tên Sản Phẩm:</asp:Label></td>
                        <td class="trTable"><asp:TextBox ID="Name" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="Phải nhập tên SP"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td class="trTable"> <asp:Label ID="Label2" runat="server" Text="Label">Giá:</asp:Label></td>
                        <td><asp:TextBox ID="Price" runat="server">
                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Price" ErrorMessage="Phải nhập gia SP"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td  class="trTable"><asp:Label ID="Label3" runat="server" Text="Label">Số lượng:</asp:Label></td>
                        <td><asp:TextBox ID="Quantity" runat="server">
                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Quantity" ErrorMessage="Phải nhập so luong"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td  class="trTable"><asp:Label ID="Label5" runat="server" Text="Label">Thời gian bảo hành:</asp:Label></td>
                        <td><asp:DropDownList ID="DropDownListGuarantee" runat="server">
                        <asp:ListItem Text="6 Tháng" Value="6"></asp:ListItem>
                        <asp:ListItem Text="12 Tháng" Value="12"></asp:ListItem>
                        <asp:ListItem Text="24 Tháng" Value="24"></asp:ListItem>
                    </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td  class="trTable"> <asp:Label ID="Label6" runat="server" Text="Label">Danh mục:</asp:Label></td>
                        <td> <asp:DropDownList ID="DropDownListCate" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr >
                        <td class="trTable"> <asp:Label ID="Label8" runat="server" Text="Label">Ảnh:</asp:Label></td>
                        <td> <asp:FileUpload ID="FileUploadImages" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="trTable"><asp:Label ID="Label4" runat="server" Text="Label">Mô tả:</asp:Label></td>
                        <td> <asp:TextBox ID="Description" TextMode="multiline" Columns="50" Rows="5" runat="server" /></td>
                    </tr>
                    <tr>
                        
                        <td class="trTable"></td>
                        <td colspan="2"><asp:Button ID="addBtn" runat="server" OnClick="addBtn_Click" Text="Thêm" /></td>
                    </tr>
                </table>
 
            </div>
        </div>
    </form>
</asp:Content>
