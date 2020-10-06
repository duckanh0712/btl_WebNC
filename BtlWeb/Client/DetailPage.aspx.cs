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
    public partial class DetailPage : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                LoadProduct();
            }
        }

        private void LoadProduct()
        {
            string id = Request.QueryString["id"].ToString();
            using (SqlConnection sqlconn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlconn.Open();
                    cmd.Connection = sqlconn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "getProduceById";
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    RepeaterProductById.DataSource = dt;
                    RepeaterProductById.DataBind();
                }
            }
        }

        protected void btnAddToCarts_Click(object sender, EventArgs e)
        {

        }
    }
}