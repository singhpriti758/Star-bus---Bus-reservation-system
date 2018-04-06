using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    string connection = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"].ToString() == null)
            {
                Response.Redirect("index.aspx");
            }

        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("SessionExpired.html");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Visible = false;
            string uid = Session["user"].ToString();
            string oldPwd = txtOldPwd.Text;
            using (SqlConnection con = new SqlConnection(connection))
            {
                string selectQuery = "select password from userinfo where username='" + uid + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(selectQuery, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr[0].ToString() == oldPwd)
                    {
                        dr.Close();
                        string updateQuery = "update userinfo set password='" + txtNewPassword.Text + "' where username='" + uid + "'";
                        SqlCommand cmd2 = new SqlCommand(updateQuery, con);
                        int n = cmd2.ExecuteNonQuery();
                        if (n > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password changed successfully!! Please login again.');window.location ='Logout.aspx';", true);
                        }
                    }
                    else
                    {
                        lblError.Text = "Incorrect Old Password";
                        lblError.Visible = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.html");
        }
    }

}