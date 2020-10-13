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
    public partial class BillPage : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<CustomProduct> products = (List<CustomProduct>)Session["carts"];
                if (!(bool)Session["isLogin"])
                {
                    Response.Write("<script>alert('Bạn chưa đăng nhập');window.location='http://localhost:54996/Client/LoginPage.aspx';</script>");
                }
                if (products == null || products.Count == 0)
                {
                    lblErr.Text = "Giỏ hàng của bạn trống!";
                    btnSubmit.Visible = false;
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
                    String username = (String)Session["name"];
                    getUserByUserName(username);
                    
                }
            }
        }

        private void getUserByUserName(string username)
        {
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getUserByUsername";
                    cmd.Parameters.Add(new SqlParameter("@username", username));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        lblName.Text = reader[4].ToString();
                        lblAddress.Text = reader[5].ToString();
                        lblPhoneNumber.Text = reader[7].ToString();
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime localDate = DateTime.Now;
            if ((bool)Session["isLogin"])
            {
                using (SqlConnection sqlConn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        sqlConn.Open();
                        cmd.Connection = sqlConn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "addToCart";
                        cmd.Parameters.Add(new SqlParameter("@userId", 2));
                        cmd.Parameters.Add(new SqlParameter("@date", localDate));
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("BuySuccessPage.aspx");
            }
        }
    }
}