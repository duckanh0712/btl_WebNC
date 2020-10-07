using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BtlWeb
{
    public partial class CreateCategory : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_btn_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(conStr);
            conn.Open();
            using (SqlCommand cm = new SqlCommand())
            {
                string sname = name_Cat.Text;
               
                if (conn != null)
                {
                    cm.Connection = conn;
                    cm.CommandText = "CreateCategory";
                    cm.CommandType = System.Data.CommandType.StoredProcedure;
                    cm.Parameters.Add(new SqlParameter("@name", sname));

                    int data = cm.ExecuteNonQuery();
                    if (data > 0)
                    {
                        Response.Write("<script> alert('Thêm thành công');</script>");
                        Response.Redirect("Categories.aspx");
                    }
                }
            }
        }
    }
}