using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimeList : System.Web.UI.Page
{
    string conn = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != null)
            {
                //if (!Page.IsPostBack)
                //{
                //    BindGrid();
                //}
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
    protected void displayDiv(object sender, EventArgs e)
    {
        newRecordDiv.Style.Remove("display");
    }
    private void BindGrid()
    {
        try
        {

            string query = "select * from time_list;";
            using (SqlConnection con = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Gridview1.DataSource = dr;
                Gridview1.DataBind();
            }
        }
        catch (Exception ex)
        {
            // Response.Redirect("error.html");
        }
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        try
        {
            string dest = ddTo.SelectedItem.ToString();
            string rate = txtRate.Text;
            string deptTime = txtDpTime.Text;
            string arTime = txtArTime.Text;
            string busNo = txtBusNo.Text;
            string query = "insert into time_list values((select max(sno) from time_list)+1,'" + dest + "'," + rate + ",'" + deptTime + "','" + arTime + "','" + busNo + "');";
            using (SqlConnection con = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int n = cmd.ExecuteNonQuery();
                if (n > 0)
                {
                    Response.Write(n + " rows affected");
                    newRecordDiv.Style.Add("display", "none");
                    BindGrid();

                }
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
        }
    }
}