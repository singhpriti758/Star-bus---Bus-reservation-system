using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ScheduleJourney : System.Web.UI.Page
{
    string conn = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                txtDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.html");
        }
    }
    protected void Destination_SelectedIndexChanged(object sender, EventArgs e)
    {
        try { 
        string stname = ddTo.SelectedItem.ToString();
        string query = "select distinct time from time_list where station_name='" + stname + "'";
        using (SqlConnection con = new SqlConnection(conn))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                ddDeptTime.DataSource = dr;
                ddDeptTime.DataTextField = "time";
                ddDeptTime.DataValueField = "time";
                ddDeptTime.DataBind();
            }
            ddDeptTime.Items.Insert(0, new ListItem("Select time", "0"));
        } 
        }
        catch (Exception ex)
        {
           // Response.Redirect("error.html");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime strDate = DateTime.Parse(txtDate.Text);
            string date = strDate.Date.ToShortDateString();
            string time = ddDeptTime.SelectedItem.ToString();
            string station = ddTo.SelectedItem.ToString();
            string query = "insert into states(date,time,station) values('" + date + "','" + time + "','" + station + "');";
            using (SqlConnection con = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int n = cmd.ExecuteNonQuery();
                if (n > 0)
                {
                    lblMessage.Text = "Journey is scheduled successfully!!!";
                }
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
        }
    }
}