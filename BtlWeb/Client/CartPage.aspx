<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="BtlWeb.Client.CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/CartPageCss.css" rel="stylesheet" />
    <script src="../Theme/js/bootstrap.min.js"></script>
    <div class="container">
        <%if ((int)Session["cartsCount"] != 0)
            { %>
        <h4>Giỏ hàng</h4>
        <form runat="server" id="formCarts">
            <table class="table table-hover">
                <tr>
                    <th class="col-md-1">#</th>
                    <th class="col-md-3">Hình minh hoạ</th>
                    <th class="col-md-2">Tên sản phẩm</th>
                    <th class="col-md-2">Giá</th>
                    <th class="col-md-1">Số lượng</th>
                    <th class="col-md-2">Xem chi tiết</th>
                    <th class="col-md-2">Xoá sản phẩm</th>
                </tr>
                <asp:ListView ID="lwCarts" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <label><%#  Eval("product.id")%></label></td>
                            <td>
                                <img src='<%# "../Public/images/"+Eval("product.images")%>' class="img-rounded" />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("product.name")%>'></asp:Label></td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("product.price", "{0:0,00 VND}")%>'></asp:Label></td>
                            <td>
                                <asp:ImageButton ID="plusProductCart" runat="server" src="../Public/images/add.png" Style="height: 15px; width: auto;" CommandArgument='<%# Eval("product.id")%>' CommandName='<%# Eval("product.id")%>' OnClick="plusProductCart_Click" />
                                <asp:Label runat="server" Text='<%# Eval("Count")%>'></asp:Label>
                                <asp:ImageButton ID="minusProductCart" runat="server" src="../Public/images/minus.png" Style="height: 15px; width: auto;" CommandArgument='<%# Eval("product.id")%>' CommandName='<%# Eval("product.id")%>' OnClick="minusProductCart_Click" />

                            </td>
                            <td>
                                <asp:Button ID="detailProduct" runat="server" CommandArgument='<%# Eval("product.id")%>' CommandName='<%# Eval("product.id")%>' Text="Chi Tiết sản phẩm" OnClick="detailProduct_Click" class="btn btn-info" /></td>
                            <td>
                                <asp:Button ID="deleteProduct" runat="server" CommandArgument='<%# Eval("product.id")%>' CommandName='<%# Eval("product.id")%>' Text="Xóa khỏi giỏ hàng" OnClick="deleteProduct_Click" class="btn btn-danger" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </table>
            <div class="row" style="text-align: center;">
                <asp:Label ID="lblPrices" runat="server" Text="" Style="color: #ff0000; font-weight: bold; font-size: 25px; font-style: italic; text-align: center;"></asp:Label>
                <asp:Button ID="btnBuy" runat="server" Text="Thanh toán" OnClick="btnBuy_Click" class="btn btn-success" />
            </div>


            <div>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Xóa sản phẩm</h4>
                            </div>
                            <div class="modal-body">
                                Bạn có muốn loại bỏ sản phẩm khỏi giỏ hàng ?
                           
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <asp:Button ID="btnDel" class="btn btn-default" runat="server" Text="Xác nhận" OnClick="btnDel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </form>
        <%}
            else
            {%>
        <div class="row col-md-4 col-md-offset-5" style="margin-top: 30px;">
            <asp:Label ID="lblErr" runat="server" Text="" Style="color: red; font-size: 20px;"></asp:Label>
            <br />
            <img style="text-align: center;" src="../Public/images/carts-empty.jpg" />
        </div>
        <%} %>
    </div>
</asp:Content>
