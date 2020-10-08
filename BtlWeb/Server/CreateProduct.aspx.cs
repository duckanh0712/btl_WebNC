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
    public partial class CreateProduct : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadData();
        }

        private void LoadData()
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
                    DropDownListCate.DataSource = dt;
                    DropDownListCate.DataBind();
                    DropDownListCate.DataTextField = "name";
                    DropDownListCate.DataValueField = "id";
                    DropDownListCate.DataBind();
                }
            }
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
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
                    cmd.CommandText = "addProduct";
                    cmd.Parameters.Add(new SqlParameter("@name", Name.Text));
                    cmd.Parameters.Add(new SqlParameter("@price", Price.Text));
                    cmd.Parameters.Add(new SqlParameter("@quantity", Quantity.Text));
                    cmd.Parameters.Add(new SqlParameter("@description", Description.Text));
                    cmd.Parameters.Add(new SqlParameter("@guarantee", DropDownListGuarantee.SelectedItem.Value));
                    cmd.Parameters.Add(new SqlParameter("@images", FileUploadImages.FileName));
                    cmd.Parameters.Add(new SqlParameter("@cateId", DropDownListCate.SelectedItem.Value));
                    cmd.Parameters.Add(new SqlParameter("@userId", 1));
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Products.aspx");
                }
            }
        }
    }
}