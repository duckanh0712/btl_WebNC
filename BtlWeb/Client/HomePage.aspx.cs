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
    public partial class Home : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadProduct();
            }
        }

        private void LoadProduct()
        {
            DataTable tblProduct = getProducts();
            RepeaterProduct.DataSource = tblProduct;
            RepeaterProduct.DataBind();
        }

        private DataTable getProducts()
        {
            string procName = "getAllProducts";
            using (SqlConnection cnn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand(procName, cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable t = new DataTable();
                        da.Fill(t);
                        return t;
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

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

        }
    }
}