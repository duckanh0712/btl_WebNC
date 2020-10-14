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
    public partial class UpdateProduct : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadData();
        }

        private void LoadData()
        {
            string id = Request.QueryString["pId"].ToString();
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "getAllCategories";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DropDownListCate.DataSource = dt;
                    DropDownListCate.DataBind();
                    DropDownListCate.DataTextField = "name";
                    DropDownListCate.DataValueField = "id";
                    DropDownListCate.DataBind();
                    cmd.CommandText = "getProductById";
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Name.Text = reader[1].ToString();
                        Description.Text = reader[3].ToString();
                        Price.Text = reader[4].ToString();
                        Quantity.Text = reader[5].ToString();
                    }
                }
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            string userId = (string)Session["currentUserId"];
            string id = Request.QueryString["pId"].ToString();
            if (FileUploadImages.HasFile)
            {
                FileUploadImages.SaveAs(Server.MapPath("/Public/images/" + FileUploadImages.FileName));
            }
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "updateProduct";
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    cmd.Parameters.Add(new SqlParameter("@name", Name.Text));
                    cmd.Parameters.Add(new SqlParameter("@price", Price.Text));
                    cmd.Parameters.Add(new SqlParameter("@quantity", Quantity.Text));
                    cmd.Parameters.Add(new SqlParameter("@description", Description.Text));
                    cmd.Parameters.Add(new SqlParameter("@guarantee", DropDownListGuarantee.SelectedItem.Value));
                    cmd.Parameters.Add(new SqlParameter("@images", FileUploadImages.FileName));
                    cmd.Parameters.Add(new SqlParameter("@cateId", DropDownListCate.SelectedItem.Value));
                    cmd.Parameters.Add(new SqlParameter("@userId", userId));
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Products.aspx");
                }
            }
        }
    }
}