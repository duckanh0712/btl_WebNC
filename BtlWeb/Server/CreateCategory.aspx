<%@ Page Title="" Language="C#" MasterPageFile="~/Server/Admin.Master" AutoEventWireup="true" CodeBehind="CreateCategory.aspx.cs" Inherits="BtlWeb.CreateCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
         <asp:Label ID="Label1" runat="server" Text="Label">Tên danh mục</asp:Label>
        <asp:TextBox ID="name_Cat" runat="server" ><
        </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="name_Cat" ErrorMessage="Phải nhập tên danh mục" ></asp:RequiredFieldValidator><br />
        <asp:Button ID="create_btn" runat="server" OnClick="create_btn_Click" Text="Thêm" />
    </form>
</asp:Content>
