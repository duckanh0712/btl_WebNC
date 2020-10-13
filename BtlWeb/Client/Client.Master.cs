﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BtlWeb.Client
{
    public partial class Client : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"])
                lblUsername.Text = (String)Session["name"];
                lblCartCount.Text = ((int)Session["cartsCount"]).ToString();
        }
    }
}