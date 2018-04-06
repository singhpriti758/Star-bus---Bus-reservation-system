using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegisterUser(object sender, EventArgs e)
    {
        lblError.Visible = false;
        int userId = 0;
        string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        try {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string str = "insert into userinfo values(@Name,@Username,@Password,@Mobile,@Email,@Email,@SecQ,@SecA);";
                using (SqlCommand cmd = new SqlCommand(str))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@SecQ", ddSecQ.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@SecA", txtSecA.Text);
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                        break;

                    default:
                        // message = "Registration successful.\\nUsername: " + txtUsername.Text;
                        Response.Redirect("index.aspx");
                        break;
                }
            }
            
        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                lblError.Text = "This username already exists. Please try another username";
                lblError.Visible = true;
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
        }
    }

}