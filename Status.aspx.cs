using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Status : System.Web.UI.Page
{
    string connection = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
            if (!Page.IsPostBack)
            {
                try
                {
                    string query = "select distinct station_name from time_list;";
                    using (SqlConnection con = new SqlConnection(connection))
                    {
                        SqlCommand cmd = new SqlCommand(query, con);
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            ddTo.DataSource = dr;
                            ddTo.DataTextField = "station_name";
                            ddTo.DataValueField = "station_name";
                            ddTo.DataBind();
                        }
                        ddTo.Items.Insert(0, new ListItem("---Select station---", "0"));
                    }
                }
                catch (Exception ex)
                {
                    Response.Redirect("error.html");
                }
            }
       
    }
    protected void Destination_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddDepart.Items.Clear();
            ddDepart.Items.Add("---Select Date---");
            ddDepart.Items.Add(System.DateTime.Today.ToShortDateString());
            ddDepart.Items.Add(System.DateTime.Now.AddDays(1.00).ToShortDateString());
            ddDepart.Items.Add(System.DateTime.Now.AddDays(2.00).ToShortDateString());
            pnl1.Visible = false;
            //if (ddTo.SelectedIndex > 0)
            //{
            //    string query = "select distinct date from states where station='" + ddTo.SelectedItem.ToString() + "';";
            //    using (SqlConnection con = new SqlConnection(connection))
            //    {
            //        SqlCommand cmd = new SqlCommand(query, con);
            //        con.Open();
            //        SqlDataReader dr = cmd.ExecuteReader();
            //        if (dr.HasRows)
            //        {
            //            ddDepart.DataSource = dr;
            //            ddDepart.DataTextField = "date";
            //            ddDepart.DataValueField = "date";
            //            ddDepart.DataBind();
            //            ddDepart.Items.Insert(0, new ListItem("---Select date---", "0"));
            //        }

            //    }
            //}
            ddTime.Items.Clear();
            logoIndicator.Style.Add("display", "none");
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
        }
    }
    protected void departon_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddDepart.SelectedItem.Text.ToString() == "--Select--")
        {
            ddTime.Items.Clear();
            pnl1.Visible = false;
            logoIndicator.Style.Add("display", "none");
        }
        else
        {
            ddTime.Items.Clear();
            pnl1.Visible = false;
            string strsql = "Select * from Time_list where Station_name = '" + ddTo.SelectedItem.Text.ToString() + "'";
            //my code
            string connection= WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand(strsql, con);
                    cmd.CommandType = CommandType.Text;
                    System.DateTime jtime = new DateTime();
                    con.Open();
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    ddTime.Items.Add("--Select--");
                    while (dr1.Read())
                    {
                        jtime = System.DateTime.Parse(dr1["Time"].ToString());
                        if (ddDepart.SelectedItem.Text.ToString() == System.DateTime.Today.ToShortDateString())
                        {
                            if (jtime > System.DateTime.Now)
                            {
                                ddTime.Items.Add(dr1["Time"].ToString());

                            }
                        }
                        else
                        {
                            ddTime.Items.Add(dr1["Time"].ToString());
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                //Response.Redirect("error.html");
            }
        }
    }
    protected void DepartureTime_SelectedIndexChanged(object sender, EventArgs e)
    {

        string strsql;
        if (ddTime.SelectedItem.Text.ToString() != "--Select--")
        {
            seattable.Visible = true;
            ddFrom.Enabled = false;

        }
        pnl1.Visible = true;
        logoIndicator.Style.Remove("display");
        for (int j = 1; j <= 31; j++)
        {
            string s = "s" + j;

            Image img = (Image)pnl1.FindControl(s.ToString());
            img.ImageUrl = "~/Images/available_seat_img.gif";
        }
        strsql = "Select * from States where ((date = '" + ddDepart.SelectedItem.Text.ToString() + "') and (Time ='" + ddTime.SelectedItem.Text.ToString() + "')and (Station='" + ddTo.SelectedItem.Text.ToString() + "'))";
         string connection= WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
         try
         {
             using (SqlConnection con = new SqlConnection(connection))
             {
                 SqlCommand cmd = new SqlCommand(strsql, con);
                 cmd.CommandType = CommandType.Text;
                 con.Open();
                 SqlDataReader dr1 = cmd.ExecuteReader();
                 while (dr1.Read())
                 {
                     for (int j = 1; j <= 31; j++)
                     {
                         string s = "s" + j;
                         if (dr1[s].ToString() != System.String.Empty)
                         {
                             Image img = (Image)pnl1.FindControl(s.ToString());
                             img.ImageUrl = "~/Images/booked_seat_img.gif";
                             img.Enabled = false;

                         }

                     }
                 }
                 con.Close();
             }
         }
         catch (Exception ex)
         {
            // Response.Redirect("error.html");
         }
    }
}