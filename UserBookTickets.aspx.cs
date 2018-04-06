using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserBookTickets : System.Web.UI.Page
{
    string connection = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != null)
            {
                if (!Page.IsPostBack)
                {
                    MultiView1.ActiveViewIndex = 0;
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
                        ddTo.Items.Insert(0, new ListItem("select station", "0"));
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
    protected void departon_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblError.Visible = false;
        if (ddDepart.SelectedItem.Text.ToString() == "--Select--")
        {
            ddTime.Items.Clear();
        }
        else
        {
            ddTime.Items.Clear();
            string strsql = "Select distinct time from time_list where Station_name = '" + ddTo.SelectedItem.Text.ToString() + "'";
            string connection = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand(strsql, con);
                    cmd.CommandType = CommandType.Text;
                    System.DateTime jtime = new DateTime();
                    
                    con.Open();
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    // rea = cmd.ExecuteReader();
                    ddTime.Items.Add("--Select--");
                    while (dr1.Read())
                    {
                        
                        jtime = System.DateTime.Parse(dr1["Time"].ToString());
                        if (ddDepart.SelectedItem.Text.ToString() == System.DateTime.Today.ToShortDateString())
                        {
                            if (jtime > System.DateTime.Now)
                            {
                                ddTime.Items.Add(dr1["Time"].ToString());
                                //Response.Write(dr1["Time"]);
                            }
                            else
                            {
                                //Response.Write("error");
                                lblError.Text = "No buses for today";
                                lblError.Visible = true;
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
    protected void Destination_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddDepart.Items.Clear();
            ddDepart.Items.Add("---Select Date---");
            ddDepart.Items.Add(System.DateTime.Today.ToShortDateString());
            ddDepart.Items.Add(System.DateTime.Now.AddDays(1.00).ToShortDateString());
            ddDepart.Items.Add(System.DateTime.Now.AddDays(2.00).ToShortDateString());
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
            //            ddDepart.Items.Insert(0, new ListItem("select date", "0"));
            //        }

            //    }
            //}
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
        }

    }

    protected void DepartureTime_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strsql;
        if (ddTime.SelectedItem.Text.ToString() != "--Select--")
        {
            seattable.Visible = true;
            ddTime.Enabled = false;
            ddDepart.Enabled = false;
            ddTo.Enabled = false;
            ddFrom.Enabled = false;
            // display Rent 
            strsql = "Select * from Time_list where Station_name = '" + ddTo.SelectedItem.Text.ToString() + "'";
            
            try
            {
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand(strsql, con);
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    if(dr1.HasRows)
                    {
                        while(dr1.Read())
                        {
                            lblRent.Text = dr1[2].ToString();
                            litbusnumber.Text = dr1[5].ToString();
                            lblBusNumber.Text=dr1[5].ToString();
                        }
                    }
                }
                
            }
            catch (Exception ex)
            {
                Response.Redirect("error.html");
            }
            string strsql2 = "Select * from States where ((date = '" + ddDepart.SelectedItem.Text.ToString() + "') and (Time ='" + ddTime.SelectedItem.Text.ToString() + "')and (Station='" + ddTo.SelectedItem.Text.ToString() + "'))";
            try
            {
                using (SqlConnection con2 = new SqlConnection(connection))
                {
                    SqlCommand cmd2 = new SqlCommand(strsql2, con2);
                    cmd2.CommandType = CommandType.Text;
                    con2.Open();
                    
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    
                    while(dr2.Read())
                    {
                        
                        Response.Write("data");
                        for(int j=1;j<=31;j++)
                        {
                            string s = "s" + j;
                            if (dr2[s].ToString() != System.String.Empty)
                            {
                                ImageButton img = (ImageButton)pnl1.FindControl(s.ToString());
                                img.ImageUrl = "~/Images/booked_seat_img.gif";
                                img.Enabled = false;
                                
                            }
                           // pnl1.Visible = true;
                            
                        }
                    }
                    pnl1.Style.Remove("display");
                    ibnext.Visible = true;
                }
            }
            catch (Exception ex)
            {
                //Response.Redirect("error.html");
            }
        }
    }
    protected void ibnext_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string[] str = txtSeatNo.Text.Split('s');
            int len = str.Length - 1;
            littotalseat.Text = len.ToString();
            int z = len * int.Parse(lblRent.Text.ToString());
            littotalrent.Text = z.ToString();
            litrent.Text = lblRent.Text;
            Random rnd = new Random();
            Random rnd1 = new Random();

            litpnr.Text = rnd.Next(50000).ToString() + rnd1.Next(548775).ToString();
            if (len == 0)
            {

                pnl1.Style.Remove("display");

                pnl2.Style.Add("display", "none");
                btnSave.Visible = false;
                Response.Redirect("Selectseat.aspx");

            }
            else
            {
                btnSave.Visible = true;
                MultiView1.ActiveViewIndex = 1;

                ibnext.Visible = false;
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("error.html");
        }


    }
    protected void btnclick(object sender, EventArgs e)
    {
        Response.Write("clicked");
    }
    protected void seatClick(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btn = (ImageButton)sender;
            ibnext.Visible = true;
            if (btn.ImageUrl == "~/Images/selected_seat_img.gif")
            {
                seattable.Visible = true;
                btn.ImageUrl = "~/Images/available_seat_img.gif";
                if (txtSeatNo.Text.IndexOf(btn.ID.ToString() + ",") > -1)
                {
                    txtSeatNo.Text = txtSeatNo.Text.Replace(btn.ID.ToString() + ",", "");
                }
                else
                {
                    txtSeatNo.Text = txtSeatNo.Text.Replace(btn.ID.ToString(), "");
                }
            }
            else if (btn.ImageUrl == "~/Images/available_seat_img.gif")
            {
                seattable.Visible = true;
                btn.ImageUrl = "~/Images/selected_seat_img.gif";
                if (txtSeatNo.Text.Trim().Length == 0)
                {
                    txtSeatNo.Text = btn.ID.ToString();
                }
                else if (txtSeatNo.Text.Trim().EndsWith(","))
                {
                    txtSeatNo.Text = txtSeatNo.Text + btn.ID.ToString();
                }
                else
                {
                    txtSeatNo.Text = txtSeatNo.Text + "," + btn.ID.ToString();
                }
            }
        }
        catch (Exception ex)
        {
           // Response.Redirect("error.html");
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string userid=Session["user"].ToString();
        string getNameQuery = "select name from userinfo where username='" + userid + "'";
        string username = null;
        try
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                
                SqlCommand cmd = new SqlCommand(getNameQuery, con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader dr=cmd.ExecuteReader();
                if(dr.Read())
                {
                    username = dr[0].ToString();
                }
            }
        }
        catch (Exception ex)
        {
           // Response.Redirect("error.html");
        }
        
        string query = "insert into passengerinfo values('"+litpnr.Text+"','"+username+"','"+ddTo.SelectedItem.Text+"','Mumbai','"+ddDepart.SelectedItem.Text+"','"+ddTime.SelectedItem.Text+"','"+littotalseat.Text.ToString()+"','"+txtSeatNo.Text+"','"+littotalrent.Text.ToString()+"','Booked','"+Session["user"].ToString()+"','"+lblBusNumber.Text+"');";
        try
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();
                SqlCommand cmd = new SqlCommand(query, con,transaction);
                cmd.CommandType = CommandType.Text;
                
                try
                {
                    if (cmd.ExecuteNonQuery() == 0)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Booking failed');", true);
                    }
                    else
                    {
                        string selectQuery = "select station from states where date='" + ddDepart.SelectedItem.Text + "' and time='" + ddTime.SelectedItem.Text + "' and station='" + ddTo.SelectedItem.Text + "'";
                        SqlCommand cmd2 = new SqlCommand(selectQuery, con,transaction);
                        string[] forsave = txtSeatNo.Text.Split(',');
                        
                            if (cmd2.ExecuteScalar() == null)
                            {
                                string insertQuery = "INSERT into States ([Date],[Time],Station) values('" + ddDepart.SelectedItem.Text
                                      + "','" + ddTime.SelectedItem.Text
                                      + "','" + ddTo.SelectedItem.Text + "')";
                                SqlCommand cmdInsert = new SqlCommand(insertQuery, con,transaction);
                                if (cmdInsert.ExecuteNonQuery() == 0)
                                {
                                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Booking failed');", true);
                                }
                            }
                        
                        for (int j = 0; j <= forsave.Length - 1; j++)
                        {
                            if (forsave[j].ToString().Trim().Length > 0)
                            {
                                string updateQuery = "Update States set " + forsave[j].ToString() + " = 'b'  where ((Date='" + ddDepart.SelectedItem.Text.ToString()
                                   + "')and(Time='" + ddTime.Text.ToString()
                                   + "')and (Station= '" + ddTo.SelectedItem.Text.ToString()
                                   + "'))";
                                SqlCommand cmdUpdate = new SqlCommand(updateQuery, con,transaction);
                                if (cmdUpdate.ExecuteNonQuery() == 0)
                                {
                                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Booking failed');", true);
                                }
                            }
                        }
                        transaction.Commit();
                    }
                }
                catch(Exception ex)
                {
                    transaction.Rollback();
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Booking failed');", true);
                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","alert('Booking successful');window.location ='UserHome.aspx';",true);
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
        
        
        
    }
}