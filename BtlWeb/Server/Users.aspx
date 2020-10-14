<%@ Page Title="" Language="C#" MasterPageFile="~/Server/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BtlWeb.Server.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/GridStyle.css" rel="stylesheet" />
    <form id="formUser" runat="server">
        <h1 class="mt-4">Users</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                Data
            </div>
            <div class="card-body">
                <%--<asp:Button ID="AddProduct" runat="server" Text="Thêm" OnClick="AddProduct_Click" />--%>
                <asp:GridView ID="GridViewUser" runat="server" CssClass="Grid" PagerStyle-CssClass="pgr" AutoGenerateColumns="false" Width="100%"
                    AlternatingRowStyle-CssClass="alt" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridViewUser_PageIndexChanging" PageSize="10">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="username" HeaderText="Username" />
                        <asp:BoundField DataField="role" HeaderText="Role" />
                        <asp:BoundField DataField="address" HeaderText="Address" />
                        <asp:BoundField DataField="phone" HeaderText="Phone" />
                        <asp:BoundField DataField="dateOfBirth" HeaderText="Date Of Birth" />
                        <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="update" runat="server" CommandName="sua" Text="Sửa"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="delete" runat="server" CommandName="xoa" Text="Xóa" CommandArgument='<%# Eval("ID") %>' OnClientClick="javaScript:return confirm('Bạn có chắc muốn xóa không?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
