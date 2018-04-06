using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCancelTickets : System.Web.UI.Page
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
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        //Response.Write("Cancel");
        string selectQuery = "select c_to,c_date,c_time,seatnumber from passengerinfo where pnr='" + txtpnr.Text + "' and c_id='"+Session["user"].ToString()+"'";
        string connection= WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        string[] seatNo;
        string allSeat,destination,strDate,strTime;
        try
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();
                SqlCommand cmd = new SqlCommand(selectQuery, con, transaction);
                cmd.CommandType = CommandType.Text;
                try
                {
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    if (dr1.Read())
                    {
                        destination = dr1[0].ToString();
                        strDate = dr1[1].ToString();
                        strTime = dr1[2].ToString();
                        allSeat = dr1[3].ToString();
                        seatNo = allSeat.Split(',');
                        dr1.Close();
                        for (int j = 0; j <= seatNo.Length - 1; j++)
                        {
                            if (seatNo[j].ToString().Trim().Length > 0)
                            {
                                string updateQuery = "Update States set " + seatNo[j].ToString() + " = null  where date='" + strDate + "' and time='" + strTime + "' and station='" + destination + "';";
                                SqlCommand cmdUpdate = new SqlCommand(updateQuery, con, transaction);
                                if (cmdUpdate.ExecuteNonQuery() == 0)
                                {
                                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Cancellation failed');", true);
                                }
                                else
                                {
                                    string changeStatus = "update passengerinfo set Status='Cancelled' where pnr='" + txtpnr.Text + "'";
                                    SqlCommand cmdChange = new SqlCommand(changeStatus, con, transaction);
                                    if (cmdChange.ExecuteNonQuery() == 0)
                                    {
                                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Cancellation failed');", true);
                                    }
                                    else
                                    {
                                        lblerror.ForeColor = System.Drawing.Color.Green;
                                        lblerror.Text = "Ticket Cancelled";
                                    }
                                }
                            }
                        }
                        transaction.Commit();
                    }
                    else
                    {
                        lblerror.Text = "Cancellation Failed";
                    }
                }catch(Exception ex)
                {
                    transaction.Rollback();
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Cancellation failed');", true);
                }
            }
        }
        catch (Exception ex)
        {
           // Response.Redirect("error.html");
        }
    }
}