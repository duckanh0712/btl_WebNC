<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="LogoutPage.aspx.cs" Inherits="BtlWeb.Client.LogoutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Đăng xuất thành công!
   
    <form id="formLogout" runat="server">
        <asp:Button ID="btnHomePage" runat="server" Text="Trang chủ" OnClick="btnHomePage_Click" />
    </form>
</asp:Content>
