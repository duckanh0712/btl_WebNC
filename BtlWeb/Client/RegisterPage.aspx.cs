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
    public partial class RegisterPage : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["myCnnStr"] + "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string gender = listGender.SelectedValue.ToString();
            string dob = dateDob.Value;
            string userRole = "USER";
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "register";
                    cmd.Parameters.Add(new SqlParameter("@name", txtFullName.Text));
                    cmd.Parameters.Add(new SqlParameter("@address", txtAddress.Text));
                    cmd.Parameters.Add(new SqlParameter("@dateOfBirth", dob));
                    cmd.Parameters.Add(new SqlParameter("@phone", txtPhoneNumber.Text));
                    cmd.Parameters.Add(new SqlParameter("@email", txtEmail.Text));
                    cmd.Parameters.Add(new SqlParameter("@gender", gender));
                    cmd.Parameters.Add(new SqlParameter("@username", txtUsername.Text));
                    cmd.Parameters.Add(new SqlParameter("@password", txtPassword.Text));
                    cmd.Parameters.Add(new SqlParameter("@role", userRole));
                    int ReturnCode = (int)cmd.ExecuteScalar();
                    if (ReturnCode == -1)
                    {
                        errUsername.Text = "Tài khoản đã tồn tại!";
                    }
                    else {
                        Response.Write("Đăng ký thành công");
                        Response.Redirect("LoginPage.aspx");
                    }
                }
            }
        }
    }
}