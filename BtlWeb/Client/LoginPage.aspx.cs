using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BtlWeb.Client
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string selectuser = "SELECT * FROM tblUser WHERE username='" + txtUsername.Text + "' and password='" + txtPassword.Text + "'and role='" + "ADMIN" + "'";
            SqlDataAdapter data = new SqlDataAdapter(selectuser, conStr);
            DataTable dataTable = new DataTable();
            data.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                Response.Redirect("/Server/Categories.aspx");
            }
            else
            {
                using (SqlConnection sqlConn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        sqlConn.Open();
                        cmd.Connection = sqlConn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "login";
                        cmd.Parameters.Add(new SqlParameter("@username", txtUsername.Text));
                        cmd.Parameters.Add(new SqlParameter("@password", txtPassword.Text));
                        cmd.ExecuteNonQuery();
                        Response.Redirect("HomePage.aspx");
                        Session["login"] = true;
                        Session["username"] = txtUsername.Text;
                    }
                }
            }
        }
    }
}