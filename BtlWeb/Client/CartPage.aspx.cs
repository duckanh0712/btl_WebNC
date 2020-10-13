using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BtlWeb.Client
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<CustomProduct> products = (List<CustomProduct>)Session["carts"];
                if (products == null || products.Count == 0)
                {
                    lblErr.Text = "Giỏ hàng của bạn trống!";
                    btnBuy.Visible = false;
                }
                else
                {
                    int prices = 0;
                    lwCarts.DataSource = products;
                    lwCarts.DataBind();
                    foreach (CustomProduct customProduct in products)
                    {
                        prices += customProduct.Count * customProduct.product.price;
                    }

                    lblPrices.Text = prices.ToString("0,0") + " VND";

                }
            }
        }

        protected void plusProductCart_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument.ToString());
            List<CustomProduct> carts = (List<CustomProduct>)Session["carts"];
            Product product = new Product();
            foreach (CustomProduct custom in carts)
            {
                if (custom.product.id == id)
                {
                    product = custom.product;
                    break;
                }
            }

            carts = CustomProduct.addAProduct(product, carts);

            int cartsCount = (int)Session["cartsCount"];
            cartsCount++;

            Session["cartsCount"] = cartsCount;
            Session["carts"] = carts;

            resetValue();
        }

        protected void minusProductCart_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int count = 0;
            int id = Convert.ToInt32(btn.CommandArgument.ToString());
            List<CustomProduct> carts = (List<CustomProduct>)Session["carts"];
            Product product = new Product();
            foreach (CustomProduct custom in carts)
            {
                if (custom.product.id == id)
                {
                    product = custom.product;
                    count = custom.Count;
                    break;
                }
            }

            if (count == 1)
            {
                btnDel.CommandArgument = Convert.ToString(id);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "none",
                   "<script type=\"text/javascript\" language=\"Javascript\" >"
                   + "$('#myModal').modal('show');</script>", false);
                return;
            }
            carts = CustomProduct.removeAProduct(product, carts);

            int cartsCount = (int)Session["cartsCount"];
            cartsCount--;

            Session["cartsCount"] = cartsCount;
            Session["carts"] = carts;

            resetValue();
        }

        protected void detailProduct_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect("DetailPage.aspx?id=" + btn.CommandArgument.ToString());
        }

        protected void deleteProduct_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument.ToString());
            int count = 0;
            List<CustomProduct> carts = (List<CustomProduct>)Session["carts"];
            Product product = new Product();
            foreach (CustomProduct custom in carts)
            {
                if (custom.product.id == id)
                {
                    product = custom.product;
                    count = custom.Count;
                    break;
                }
            }

            btnDel.CommandArgument = Convert.ToString(id);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "none",
               "<script type=\"text/javascript\" language=\"Javascript\" >"
               + "$('#myModal').modal('show');</script>", false);
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"])
            {
                Response.Redirect("/Client/BillPage.aspx");
            }
            else
            {
                Response.Write("<script> alert('Bạn chưa đăng nhập. Vui lòng đăng nhập để thanh toán!');" +
                   "window.location='http://localhost:54996/Client/LoginPage.aspx';</script>");
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int id = Convert.ToInt32(btn.CommandArgument.ToString());
            int count = 0;
            List<CustomProduct> carts = (List<CustomProduct>)Session["carts"];
            Product product = new Product();
            foreach (CustomProduct custom in carts)
            {
                if (custom.product.id == id)
                {
                    product = custom.product;
                    count = custom.Count;
                    break;
                }
            }

            carts = CustomProduct.removeAllProduct(product, carts);

            int cartsCount = (int)Session["cartsCount"];
            cartsCount -= count;

            Session["cartsCount"] = cartsCount;
            Session["carts"] = carts;

            resetValue();
        }

        private void resetValue()
        {
            int prices = 0;
            int cartsCount = (int)Session["cartsCount"];
            List<CustomProduct> carts = (List<CustomProduct>)Session["carts"];
            foreach (CustomProduct customProduct in carts)
            {
                prices += customProduct.Count * customProduct.product.price;
            }

            lblPrices.Text = prices.ToString("0,0") + " VND";
            Label lblCartCount = (Label)Master.FindControl("lblCartCount");
            lblCartCount.Text = cartsCount.ToString();
            lwCarts.DataSource = carts;
            lwCarts.DataBind();
        }
    }
}