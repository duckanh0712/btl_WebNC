<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BtlWeb.Client.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Public/css/HomePage.css" rel="stylesheet" />
    <div class="container">
        <form id="formHomePage" runat="server">
            <div class="col-md-3">
                <h4 style="font-weight: bold;">Bộ lọc</h4>
                <ul class="sidebar-menu tree">
                    <li>
                        <fieldset>
                            <legend>
                                <h5>Tên sản phẩm</h5>
                            </legend>
                            <asp:TextBox ID="txtNameProduct" runat="server" class="form-control" placeholder="Tên sản phẩm"></asp:TextBox>
                            <asp:Button ID="btnSearch" class="btn btn-default m-t-10" runat="server" Text="Tìm Kiếm" OnClick="btnSearch_Click" />
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            <legend>
                                <h4 style="font-weight: bold;">Danh mục sản phẩm</h4>
                                <ul class="category-item">
                                    <asp:Repeater ID="RepeaterCategory" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:LinkButton ID="LinkButtonItem" CssClass="imjusttext" runat="server" CommandArgument='<%# Eval("id")%>' OnClick="LinkButtonItem_Click">- <%# Eval("name")%></asp:LinkButton>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </legend>
                        </fieldset>
                    </li>
                </ul>
            </div>
            <div class="col-md-9">
                <div class="row">
                    <%--<h4 class="col-md-3">Danh mục sản phẩm</h4>--%>
                    <asp:Button ID="btnCanceSearch" runat="server" Text="Bỏ lọc sản phẩm" class="btn btn-default col-md-3" Visible="false" OnClick="btnCanceSearch_Click" Style="margin-top: 4px;" />
                </div>
                <asp:ListView ID="ListViewProduct" runat="server" OnPagePropertiesChanging="ListViewProduct_PagePropertiesChanging">
                    <ItemTemplate>
                        <div class="item col-md-4 col-sm-5">
                            <div class="row" id="ContentProduct">
                                <img src='<%# "../Public/images/"+Eval("images")%>' />
                                <div class="row">
                                    <asp:Label runat="server" Text='<%# Eval("name")%>'></asp:Label><br />
                                    <asp:Label runat="server" Text='<%# Eval("price", "{0:0,00 VND}")%>'></asp:Label><br />
                                    <asp:Button ID="btnProductDetail" class="btn btn-default" runat="server" CommandArgument='<%# Eval("id")%>' Text="Xem chi tiết" OnClick="btnProductDetail_Click" Style="max-width: 100%;" />
                                    <asp:Button ID="btnAddToCart" class="btn btn-default" runat="server" CommandArgument='<%# Eval("id")%>' Text="Thêm vào giỏ" OnClick="btnAddToCart_Click" Style="max-width: 100%;" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div class="col-md-12">
                <div class="row page-center">
                    <asp:DataPager ID="dtpArticles" runat="server" PagedControlID="ListViewProduct" PageSize="15" ClientIDMode="Static">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                ShowNextPageButton="false" ButtonCssClass="prev-page text-info" />
                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn-cur-page text-info"
                                NumericButtonCssClass="btn-num-page text-success" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="true" ShowNextPageButton="true"
                                ShowPreviousPageButton="false" ButtonCssClass="next-page text-info" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
