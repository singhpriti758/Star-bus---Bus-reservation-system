﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"].ToString() == null)
            {
                Response.Redirect("index.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.html");
        }
    }
}