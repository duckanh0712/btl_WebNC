<%@ Page Title="" Language="C#" MasterPageFile="~/Server/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="BtlWeb.Server.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/GridStyle.css" rel="stylesheet" />
    <form id="formCates" runat="server">
        <asp:Button ID="AddCategory" runat="server" Text="Thêm"/>
        <asp:GridView ID="GridViewCategory" runat="server" CssClass="Grid" PagerStyle-CssClass="pgr" AutoGenerateColumns="false" Width="100%" OnRowCommand="GridViewCategory_RowCommand"
            AlternatingRowStyle-CssClass="alt" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridViewCategory_PageIndexChanging" PageSize="10">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <%--<asp:Button ID="update" runat="server" Text="Sửa" OnClick="update_Click"/>--%>
                        <asp:LinkButton ID="update" runat="server" CommandName="update" Text="Sửa"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="delete" runat="server" CommandName="delete" Text="Xóa" OnClientClick="javaScript:return confirm('Bạn có chắc muốn xóa không?');"></asp:LinkButton>
                        <%--<asp:Button ID="delete" runat="server" Text="Xóa" OnClick="delete_Click" OnClientClick="javaScript:return confirm('Bạn có chắc muốn xóa không?');"/>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</asp:Content>
