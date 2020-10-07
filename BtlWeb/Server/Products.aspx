<%@ Page Title="" Language="C#" MasterPageFile="~/Server/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="BtlWeb.Server.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/GridStyle.css" rel="stylesheet" />
    <form id="form11" runat="server">
        <asp:GridView ID="GridViewProduct" runat="server" CssClass="Grid" PagerStyle-CssClass="pgr" AutoGenerateColumns="false" Width="100%" 
            AlternatingRowStyle-CssClass="alt" GridLines="None" AllowPaging="True" PageSize="10">
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
                        <asp:LinkButton ID="delete" runat="server" CommandName="delete" Text="Xóa"  OnClientClick="javaScript:return confirm('Bạn có chắc muốn xóa không?');"></asp:LinkButton>
                   <%--     <asp:Button ID="delete" runat="server" Text="Xóa" OnClick="delete_Click" OnClientClick="javaScript:return confirm('Bạn có chắc muốn xóa không?');"/>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</asp:Content>
