<%@ Page Title="" Language="C#" MasterPageFile="~/Server/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="BtlWeb.Server.UpdateCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="UpdateCategory" runat="server">
        <h1 class="mt-4">Update Category</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Data
            </div>
            <div class="card-body">
                <asp:Label ID="Label1" runat="server" Text="Label">Tên danh mục</asp:Label>
                <asp:TextBox ID="name" runat="server">
                </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Phải nhập tên danh mục"></asp:RequiredFieldValidator><br />
                <asp:Button ID="updateCate" runat="server" OnClick="updateCate_Click" Text="Sửa" />
            </div>
        </div>
    </form>
</asp:Content>
