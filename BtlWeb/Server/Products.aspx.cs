using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BtlWeb.Server
{
    public partial class Products : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            using (SqlConnection sqlconn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlconn.Open();
                    cmd.Connection = sqlconn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getAllProducts";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewProduct.DataSource = dt;
                    GridViewProduct.DataBind();
                }
            }
        }

        protected void AddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateProduct.aspx");
        }

        protected void GridViewProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                GridViewRow grv = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int Removerat = grv.RowIndex;
                String id = GridViewProduct.Rows[Removerat].Cells[0].Text;
                using (SqlConnection sqlConn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        sqlConn.Open();
                        cmd.Connection = sqlConn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "deleteProductById";
                        cmd.Parameters.Add(new SqlParameter("@id", id));
                        cmd.ExecuteNonQuery();
                    }
                }
                LoadData();
            }
            if (e.CommandName == "sua")
            {
                GridViewRow grv = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int Removerat = grv.RowIndex;
                String id = GridViewProduct.Rows[Removerat].Cells[0].Text;
                Response.Redirect("UpdateCategory.aspx?pId=" + id);
            }
        }

        protected void GridViewProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewProduct.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}