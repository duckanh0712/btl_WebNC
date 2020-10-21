<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="BtlWeb.Client.RegisterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/RegisterPage.css" rel="stylesheet" />
    <script src="../Theme/js/bootstrap.min.js"></script>
    <script src="../Public/script/my_js.js"></script>
    <div class="container">
        <h1 style="text-align: center">THÔNG TIN ĐĂNG KÍ</h1>
        <form id="formRegister" runat="server">
            <div class="container col-md-offset-2 col-md-10">
                <div class="form-group row">
                    <label for="<%=txtFullName.ClientID%>" class="col-md-2 control-label">Họ và tên </label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtFullName" runat="server" class="form-control" onchange="test(this)" placeholder="Họ và tên"></asp:TextBox>
                    </div>
                    <span id="err<%=txtFullName.ClientID%>" class="help-block col-md-4" text=""></span>
                </div>

                <div class="form-group row">
                    <label for="<%=dateDob.ClientID%>" class="col-md-2 control-label">Ngày sinh</label>
                    <div class="col-md-5">
                        <input type="date" id="dateDob" name="dateDob" class="form-control" runat="server"  placeholder="Ngày sinh"/>
                    </div>
                    <span id="errns" class="help-block col-md-4" text=""></span>
                </div>
    
                <div class="form-group row">
                    <label for="<%=listGender.ClientID%>" class="col-md-2 control-label">Giới tính</label>
                    <div class="col-md-5">
                        <asp:DropDownList required ID="listGender" runat="server" class="form-control" placeholder="Chọn giới tính">
                            <asp:ListItem Value="True">Nam</asp:ListItem>
                            <asp:ListItem Value="False">Nữ</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <span id="err<%=listGender.ClientID%>" class="help-block col-md-4" text=""></span>
                </div>

                <div class="form-group row">
                    <label for="<%=txtAddress.ClientID%>" class="col-md-2 control-label">Địa chỉ</label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtAddress" runat="server" class="form-control" placeholder="Địa chỉ"></asp:TextBox>
                    </div>
                    <span id="err<%=txtAddress.ClientID%>" class="help-block col-md-4" text=""></span>
                </div>

                <div class="form-group row">
                    <label for="<%=txtPhoneNumber.ClientID%>" class="col-md-2 control-label">Số điện thoại</label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtPhoneNumber" class="form-control" runat="server" onChange="validatePhoneNumber()" placeholder="Số điện thoại"></asp:TextBox>
                    </div>
                    <span id="errPhoneNumber" class="help-block col-md-4" text=""></span>
                </div>

                <div class="form-group row">
                    <label for="<%=txtEmail.ClientID %>" class="col-md-2 control-label">Email</label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtEmail" runat="server" class="form-control" onChange="validateEmail()" placeholder="Email" type="email"></asp:TextBox>
                    </div>
                    <asp:Label ID="errEmail" class="col-md-4 control-label errorMsg" runat="server" Text=""></asp:Label>
                </div>

                <div class="form-group row">
                    <label for="<%=txtUsername.ClientID %>" class="col-md-2 control-label">Tên đăng nhập</label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtUsername" runat="server" class="form-control" placeholder="Tên tài khoản"></asp:TextBox>
                    </div>
                    <asp:Label ID="errUsername" class="col-md-3 control-label errorMsg" runat="server" Text=""></asp:Label>
                </div>

                <div class="form-group row">
                    <label for="<%=txtPassword.ClientID %>" class="col-md-2 control-label">Mật khẩu</label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtPassword" runat="server" class="form-control"  placeholder="Mật khẩu" type="password" onChange="validatePassword()"></asp:TextBox>
                    </div>
                    <span id="errPassword" class="help-block col-md-4 errorMsg" text=""></span>
                </div>
                <div class="form-group row">
                    <label for="<%=txtPassword2.ClientID %>" class="col-md-2 control-label">Nhập lại mật khẩu</label>
                    <div class="col-md-5">
                        <asp:TextBox required ID="txtPassword2" runat="server" class="form-control" placeholder="Nhập lại mật khẩu" type="password" onChange="validatePassword1()"></asp:TextBox>
                    </div>
                    <span id="errPassword1" class="help-block col-md-4 errorMsg" text=""></span>
                </div>
                <div class="row">
                    <div class="col-md-offset-6">
                        <asp:Button ID="btnSubmit" class="btn btn-default" runat="server" Text="Đăng ký" OnClientClick="return validate();" OnClick="btnSubmit_Click" />
                        <input type="reset" class="btn btn-default" text="Nhập lại" />
                    </div>
                </div>

            </div>
            <div class="modal fade" id="regSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Đăng ký thành công</h4>
                        </div>
                        <div class="modal-body">
                            Chúc mừng bạn đã đăng ký thành viên thành công. Ngay bây giờ bạn đã có thể mua hàng và thanh toán hóa đơn. Đi mua sắm ngay thôi :D
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-default" href="HomePage.aspx">Trang chủ</a>
                            <a type="button" class="btn btn-default" href="LoginPage.aspx">Đi tới đăng nhập</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- Modal -->
    </div>
   <script type="text/javascript"> 
       function validatePassword() {
           var password = document.getElementById('<%=txtPassword.ClientID%>');
           var passwordRegex = /^[a-zA-Z0-9]{6,}$/; 
           if (!passwordRegex.test(password.value)) {
               password.parentElement.parentElement.classList.add("has-error");
               document.getElementById('errPassword').innerHTML = "Mật khẩu tối thiểu từ 6 ký tự";
               password.focus();
               return false;
           } else {
               password.parentElement.parentElement.classList.remove("has-error");
               password.parentElement.parentElement.classList.add("has-success");
               document.getElementById('errPassword').innerHTML = "";
               return true;
           }
       }

       function validatePassword1() {


           var password1 = document.getElementById('<%=txtPassword.ClientID%>');
        var password = document.getElementById('<%=txtPassword2.ClientID%>');
            if (password.value.trim() != password1.value.trim()) {
               password.parentElement.parentElement.classList.add("has-error");
               document.getElementById('errPassword1').innerHTML = "Mật khẩu nhập lại không đúng";
               password.focus();
               return false;
           } else {
               password.parentElement.parentElement.classList.remove("has-error");
               password.parentElement.parentElement.classList.add("has-success");
               document.getElementById('errPassword1').innerHTML = "";
               return true;
           }
       }

       function validatePhoneNumber() {
           var regexPhoneNumber = /^(0)([0-9]{8,10})*$/;
           var phoneNumber = document.getElementById('<%=txtPhoneNumber.ClientID%>');
           if (!regexPhoneNumber.test(phoneNumber.value)) {
               document.getElementById('errPhoneNumber').innerHTML = "Số điện thoại không đúng";
               phoneNumber.parentElement.parentElement.classList.add("has-error");
               phoneNumber.focus();
               return false;
           } else {
               document.getElementById('errPhoneNumber').innerHTML = "";
               phoneNumber.parentElement.parentElement.classList.remove("has-error");
               phoneNumber.parentElement.parentElement.classList.add("has-success");
               return true;
           }
       }
     

    </script>
</asp:Content>
