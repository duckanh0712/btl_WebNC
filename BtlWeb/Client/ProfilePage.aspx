<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="BtlWeb.Client.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/ProfilePageCss.css" rel="stylesheet" />
    <script src="../Theme/js/bootstrap.min.js"></script>
    <div class="container">
        <h1 style="text-align: center">Thông tin cá nhân</h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <form id="formReg" runat="server" action="saveProfile.aspx" method="post">
                    <div class="container col-md-offset-2 col-md-10">
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Họ và tên </label>
                            <div class="col-md-5">
                                <asp:Label ID="LabelFullName" runat="server"><%# Eval("name")%></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 control-label">Địa chỉ</label>
                            <div class="col-md-5">
                                <asp:Label ID="LabelAddress" runat="server"><%# Eval("address")%></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 control-label">Số điện thoại</label>
                            <div class="col-md-5">
                                <asp:Label ID="LabelPhone" runat="server"><%# Eval("phone")%></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 control-label">Ngày sinh</label>
                            <div class="col-md-5">
                                <asp:Label ID="Label1" runat="server"><%# Eval("dateOfBirth")%></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 control-label">Email</label>
                            <div class="col-md-5">
                                <asp:Label ID="Label2" runat="server"><%# Eval("email")%></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 control-label">Giới tính</label>
                            <div class="col-md-5">
                                <asp:Label ID="Label3" runat="server"><%# Eval("gender")%></asp:Label>
                            </div>
                        </div>
                        <%--<div class="row">
                    <div class="col-md-offset-6">
                        
                        <input type="submit" class="btn btn-default"value="Lưu" />
                    </div>
                </div>--%>
                    </div>
                </form>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
