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
    public partial class UpdateCategory : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadData();
        }

        private void LoadData()
        {
            string id = Request.QueryString["cateId"].ToString();
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getCategoryById";
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        name.Text = reader[1].ToString();
                    }
                }
            }
        }

        protected void updateCate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["cateId"].ToString();
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "updateCategoryById";
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    cmd.Parameters.Add(new SqlParameter("@name", name.Text));
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Categories.aspx");
                }
            }
        }
    }
}