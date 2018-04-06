using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome : System.Web.UI.Page
{
    string conn = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != null)
            {
                if (!Page.IsPostBack)
                {
                    string query = "select * from passengerinfo;";
                    using (SqlConnection con = new SqlConnection(conn))
                    {
                        SqlCommand cmd = new SqlCommand(query, con);
                        con.Open();
                        Gridview1.DataSource = cmd.ExecuteReader();
                        Gridview1.DataBind();
                    }
                }
            }
            else
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