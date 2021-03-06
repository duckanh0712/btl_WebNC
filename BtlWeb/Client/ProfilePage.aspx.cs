﻿using System;
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
    public partial class ProfilePage : System.Web.UI.Page
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
            string userId = (string)Session["currentUserId"];
            using (SqlConnection sqlConn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    sqlConn.Open();
                    cmd.Connection = sqlConn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "getUserById";
                    cmd.Parameters.Add(new SqlParameter("@id", userId));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
        }
    }
}