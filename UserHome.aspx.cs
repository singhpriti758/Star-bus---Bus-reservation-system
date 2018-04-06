using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("SessionExpired.html");
        }
    }
}