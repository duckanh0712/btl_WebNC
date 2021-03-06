﻿using System;
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
    public partial class Home : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
                LoadCategory();
            }
        }

        private void LoadCategory()
        {
            using (SqlConnection sqlconn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlconn.Open();
                    cmd.Connection = sqlconn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "getAllCategories";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    RepeaterCategory.DataSource = dt;
                    RepeaterCategory.DataBind();
                }
            }
        }

        private void LoadData()
        {
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getAllProducts";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ListViewProduct.DataSource = dt;
                    ListViewProduct.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtNameProduct.Text.Trim() != null || txtNameProduct.Text.Trim().Count() > 0)
            {
                string name = txtNameProduct.Text.Trim();
                using (SqlConnection sqlConn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        sqlConn.Open();
                        cmd.Connection = sqlConn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "findProductByName";
                        cmd.Parameters.Add(new SqlParameter("@name", name));
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ListViewProduct.DataSource = dt;
                        ListViewProduct.DataBind();
                    }
                }
            }
        }

        protected void btnCanceSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnProductDetail_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect("DetailPage.aspx?id=" + btn.CommandArgument.ToString());
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument.ToString());
            Product product = new Product();
            List<CustomProduct> carts = (List<CustomProduct>)Session["carts"];
            if (carts == null) carts = new List<CustomProduct>();

            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getProductById";
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        product.id = Int32.Parse(reader[0].ToString());
                        product.name = reader[1].ToString();
                        product.images = reader[2].ToString();
                        product.description = reader[3].ToString();
                        product.price = Int32.Parse(reader[4].ToString());
                        product.quantity = Int32.Parse(reader[5].ToString());
                        product.guarantee = reader[6].ToString();
                    }
                }
            }
            int count = (int)Session["cartsCount"];

            carts = CustomProduct.addAProduct(product, carts);
            count++;

            Session["cartsCount"] = count;
            Session["carts"] = carts;
            Response.Write("<script> alert('Thêm vào giỏ hàng thành công!'); window.location='http://localhost:54996/Client/HomePage.aspx';</script>");
        }

        protected void LinkButtonItem_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            int id = Convert.ToInt32(btn.CommandArgument.ToString());
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getProductByCateId";
                    cmd.Parameters.Add(new SqlParameter("@cateId", id));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ListViewProduct.DataSource = dt;
                    ListViewProduct.DataBind();
                }
            }
        }

        protected void ListViewProduct_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dtpArticles.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadData();
        }
    }
}