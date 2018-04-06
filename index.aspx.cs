using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string user = txtUsername.Text;
        string query = "select password from UserInfo where username=@user;";
        string connection= WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@user", user);
                con.Open();
                SqlDataReader dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    Session["user"] = user;
                    if (dr1[0].ToString() == txtPassword.Text)
                    {
                        if (user == "admin")
                        {
                            Response.Redirect("AdminHome.aspx");
                        }
                        else
                        {
                            Response.Redirect("UserHome.aspx");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid Username or Password');", true);
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid Username or Password');", true);
                }
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
            //Response.Write(ex.Message);
        }
    }
}