<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="BtlWeb.Client.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Theme/js/bootstrap.min.js"></script>
    <div class="container">
        <h1 style="text-align: center">Đăng nhập</h1>
        <form id="formLogin" runat="server" class="form-horizontal col-md-9 col-md-offset-3">

            <div class="form-group">
                <label for="inputEmail3" class="col-md-2 control-label">Username</label>
                <div class="col-md-5">
                    <asp:TextBox required ID="txtUsername" class="form-control" runat="server" placeholder="Tên tài khoản"></asp:TextBox>
                </div>
                <span id="errUsername" class="help-block col-md-4" text="" style="margin: 0px; font-size: 13px;"></span>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                <div class="col-md-5">
                    <asp:TextBox required ID="txtPassword" runat="server" class="form-control" placeholder="Mật khẩu" type="password"></asp:TextBox>
                </div>
                <span id="errPassword" class="help-block col-md-4" text="" style="margin: 0px; font-size: 13px;"></span>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Remember me</label>
                <div class="col-md-5">
                    <asp:CheckBox ID="Remember" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-default" Text="Đăng Nhập" OnClick="btnSubmit_Click" />
                    <input type="reset" text="Nhập lại" class="btn btn-default" />
                </div>
            </div>
            <%--  --%>

            <div class="modal fade" id="loginSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Đăng nhập thành công</h4>
                        </div>
                        <div class="modal-body">
                            Chúc mừng bạn đã đăng nhập thành công. Ngay bây giờ bạn đã có thể mua hàng và thanh toán hóa đơn.
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-default" href="HomePage.aspx">Trang chủ</a>
                            <a type="button" class="btn btn-default" href="CartPage.aspx">Đi tới giỏ hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
