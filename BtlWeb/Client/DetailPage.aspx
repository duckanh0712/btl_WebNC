<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="DetailPage.aspx.cs" Inherits="BtlWeb.Client.DetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/DetailPage.css" rel="stylesheet" />
    <div class="container">
        <form id="formDetail" runat="server">
            <asp:Repeater ID="RepeaterProductById" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-5">
                            <img src='<%# "../Public/images/"+Eval("images")%>' />
                        </div>
                        <div class="col-md-6 col-md-offset-1" id="inforproduct">
                            <fieldset>
                                <legend>
                                    <h1 style="margin: 0px;">
                                        <asp:Label ID="lblName" runat="server" class="col-md-7"><%# Eval("name")%></asp:Label></h1>
                                </legend>
                                <div style="font-family: initial;">
                                    <table>
                                        <tr>
                                            <td>
                                                <b>Giá: </b><%# Eval("price", "{0:0,00 VND}")%></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>Số lượng: </b><%# Eval("quantity")%></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>Kho hàng: </b>
                                                <span>Đang còn hàng tại: </span>
                                                <br />
                                                <span style="margin-left: 70px; color: red; font-size: 15px">- 129+131 Lê Thanh Nghị - HBT - Hà Nội
                                               
                                                    <br />
                                                </span>
                                                <span style="margin-left: 70px; color: red; font-size: 15px">- 43 Thái Hà - Đống Đa - Hà Nội
                                               
                                                    <br />
                                                </span>
                                                <span style="margin-left: 70px; color: red; font-size: 15px">- 57 Nguyễn Văn Huyên - Cầu Giấy - Hà Nội<br />
                                                </span>
                                                <span style="margin-left: 70px; color: red; font-size: 15px">- A1-6 Lô 8A, Lê Hồng Phong, Ngô Quyền, Hải Phòng
                                        </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Bảo hành:</b> <%# Eval("guarantee")%> Tháng
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Giao hàng:</b>
                                                <br />
                                                <span style="margin-left: 62px; font-size: 15px">- Miễn phí giao hàng (Trong bán kính 20 km) cho đơn hàng từ 500.000đ trở lên 
                                        </span>
                                                <br />
                                                <span style="margin-left: 62px; font-size: 15px">- Miễn phí giao hàng 300 km với khách hàng Nets, Doanh Nghiệp, Dự Án
                                        </span>
                                                <br />
                                                <span style="margin-left: 62px; font-size: 15px">- Nhận giao hàng và lắp đặt từ 8h00 - 20h30 các ngày kể cả ngày lễ, thứ 7, CN
                                        </span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </fieldset>

                            <div class="price">
                                <asp:Label ID="lblPrices" runat="server" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btnAddToCarts" runat="server" Text="Thêm vào giỏ hàng" class="btn btn-primary btn-lg btn-block m-t" OnClick="btnAddToCarts_Click" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="container">
                            <h2>Mô tả</h2>
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#home">Thông tin chi tiết</a></li>
                                <li><a data-toggle="tab" href="#menu1">Đánh giá</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="home" class="tab-pane fade in active">
                                    <div>
                                        <h3 class="detail-title">Chất liệu tốt, siêu bền</h3>
                                        <img src='<%# "../Public/images/"+Eval("images")%>' style="width: auto; height: 700px;" /><br />
                                        <p><%# Eval("description")%>.</p>
                                    </div>
                                    <div>
                                        <h3 class="detail-title">Công nghệ đèn Led bắt mắt</h3>
                                        <img src='<%# "../Public/images/"+Eval("images")%>' style="width: auto; height: 700px;" /><br />
                                        <p><%# Eval("description")%>.</p>
                                    </div>
                                    <div>
                                        <h3 class="detail-title">Chất liệu tốt, siêu bền</h3>
                                        <img src='<%# "../Public/images/"+Eval("images")%>' style="width: auto; height: 700px;" /><br />
                                        <p><%# Eval("description")%>.</p>
                                    </div>
                                    <div>
                                        <h3 class="detail-title">Công nghệ đèn Led bắt mắt</h3>
                                        <img src='<%# "../Public/images/"+Eval("images")%>' style="width: auto; height: 700px;" /><br />
                                        <p><%# Eval("description")%>.</p>
                                    </div>
                                </div>
                                <div id="menu1" class="tab-pane fade">
                                    <h3>Đánh giá:</h3>
                                    <p>
                                        <asp:Label ID="lblDescribe" runat="server" Text="" class="col-md-8"></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </form>
    </div>
    <script src="../Theme/js/jquery-3.3.1.min.js"></script>
    <script src="../Theme/js/bootstrap.min.js"></script>
</asp:Content>
