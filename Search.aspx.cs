using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btndisplay_Click1(object sender, EventArgs e)
    {
        string strsql = "Select * from passengerinfo where Pnr = '" + txtpnr.Text.Trim() + "'";
        string connection= WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    pnl2.Visible = true;
                    pnl1.Visible = false;
                    lblerror.Text = "";
                    litpnr.Text = dr1[0].ToString();
                    litname.Text = dr1[1].ToString();
                    litto.Text = dr1[2].ToString();
                    litfrom.Text = dr1[3].ToString();
                    litdate.Text = dr1[4].ToString();
                    littime.Text = dr1[5].ToString();
                    littotalseat.Text = dr1[6].ToString();
                    litseat.Text = dr1[7].ToString();
                    litrent.Text = dr1[8].ToString();
                    litstates.Text = dr1[9].ToString();
                }
                else
                {
                    lblerror.Text = "Plz Enter the Corret PnR Number";
                    pnl1.Visible = true;
                    pnl2.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
           // Response.Redirect("error.html");
        }
    }
}