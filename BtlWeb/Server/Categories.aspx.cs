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
    public partial class Categories : System.Web.UI.Page
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
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "getAllCategories";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewCategory.DataSource = dt;
                    GridViewCategory.DataBind();
                }
            }
        }

        protected void GridViewCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCategory.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void GridViewCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "delete")
            {
                //GridViewRow grv = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                //int Removerat = grv.RowIndex;
                //int rowIndex = Int32.Parse(e.CommandArgument);
                int rowIndex = int.Parse(string.Format("{0}", e.CommandArgument));
                GridViewRow row = GridViewCategory.Rows[rowIndex];
                int id = Convert.ToInt32(row.Cells[0].Text);
                using (SqlConnection sqlConn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        sqlConn.Open();
                        cmd.Connection = sqlConn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "deleteCategoryById";
                        cmd.Parameters.Add(new SqlParameter("@id", id));
                        cmd.ExecuteNonQuery();
                        LoadData();
                    }
                }
                LoadData();
            }
           
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            
        }

        protected void AddCategory_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("CreateCategory.aspx");
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateCategory.aspx");
        }
    }
}