<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Status.aspx.cs" Inherits="Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="css/bootstrap.css"/>

    <style>
        .dropbtn {
    background-color: #34CECE;
    color: white;
    padding: 8px;
    border: none;
    cursor: pointer;
    height:40px;
    width:200px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="row">
    <asp:Label ID="lblStatus" style="margin-left:550px;" runat="server" CssClass="label label-info" Text="Check Status Now!!" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    </div><br /><br /><br />
    <div style="display:inline-block;margin-left:100px">
        <table style="border-spacing: 15px;border-collapse: separate; font-size:larger;font-weight:bold">
            <tr>
                <td>From:</td>
                <td> <asp:DropDownList ID="ddFrom" runat="server" CssClass="dropbtn">
                        <asp:ListItem Text="Mumbai" Value="Mumbai"></asp:ListItem>
                 </asp:DropDownList></td>

            </tr>
            <tr>
        <td>To: </td>
                <td><asp:DropDownList ID="ddTo" CssClass="dropbtn btn-info" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Destination_SelectedIndexChanged">
                <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                <asp:ListItem Text="Ajmer" Value="Ajmer"></asp:ListItem>
                <asp:ListItem Text="Alwar" Value="Alwar"></asp:ListItem>
                <asp:ListItem Text="Bhilwara" Value="Bhilwara"></asp:ListItem>
                <asp:ListItem Text="Bombay" Value="Bombay"></asp:ListItem>
                <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
                <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                <asp:ListItem Text="Hanumangarh" Value="Hanumangarh"></asp:ListItem>
                <asp:ListItem Text="Jaipur" Value="Jaipur"></asp:ListItem>
                <asp:ListItem Text="Jodhpur" Value="Jodhpur"></asp:ListItem>
                <asp:ListItem Text="Kota" Value="Kota"></asp:ListItem>
            </asp:DropDownList></td>

            </tr>
            <tr>
        <td>Depart On:</td>
                <td><asp:DropDownList ID="ddDepart" runat="server" CssClass="dropbtn" OnSelectedIndexChanged="departon_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList><br /><br />
        </td>
                    </tr>
            <tr>
                <td>Time:</td>
                <td><asp:DropDownList ID="ddTime" runat="server" CssClass="dropbtn" AutoPostBack="True" OnSelectedIndexChanged="DepartureTime_SelectedIndexChanged"></asp:DropDownList>
  </td>
                     </tr>
                 </table>
            </div>
    <div style="display:inline-block;margin-left:200px;">
        <asp:Panel ID="pnl1" runat="server" Visible="false">
                                            <asp:Table border="0" ID="seattable" runat="server" style="border-spacing: 15px;border-collapse: separate;">
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell1" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s1" ToolTip="Window Side" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />
                                                        1</asp:TableCell>
                                                    <asp:TableCell ID="TableCell2" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s6" ImageUrl="~/Images/available_seat_img.gif" runat="server" />6</asp:TableCell>
                                                    <asp:TableCell ID="TableCell3" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s7" ToolTip="Window Side" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />7</asp:TableCell>
                                                    <asp:TableCell ID="TableCell4" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s12" ImageUrl="~/Images/available_seat_img.gif" runat="server" />12</asp:TableCell>
                                                    <asp:TableCell ID="TableCell5" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s13" ImageUrl="~/Images/available_seat_img.gif" runat="server" />13</asp:TableCell>
                                                    <asp:TableCell ID="TableCell6" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s18" ImageUrl="~/Images/available_seat_img.gif" runat="server" />18</asp:TableCell>
                                                    <asp:TableCell ID="TableCell7" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s19" ImageUrl="~/Images/available_seat_img.gif" runat="server" />19</asp:TableCell>
                                                    <asp:TableCell ID="TableCell8" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s24" ImageUrl="~/Images/available_seat_img.gif" runat="server" />24</asp:TableCell>
                                                    <asp:TableCell ID="TableCell9" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s25" ImageUrl="~/Images/available_seat_img.gif" runat="server" />25</asp:TableCell>
                                                    <asp:TableCell ID="TableCell10" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s31" ImageUrl="~/Images/available_seat_img.gif" runat="server" />31</asp:TableCell></asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell11" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s2" ImageUrl="~/Images/available_seat_img.gif" runat="server" />2</asp:TableCell>
                                                    <asp:TableCell ID="TableCell12" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s5" ImageUrl="~/Images/available_seat_img.gif" runat="server" />5</asp:TableCell>
                                                    <asp:TableCell ID="TableCell13" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s8" ImageUrl="~/Images/available_seat_img.gif" runat="server" />8</asp:TableCell>
                                                    <asp:TableCell ID="TableCell14" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s11" ImageUrl="~/Images/available_seat_img.gif" runat="server" />11</asp:TableCell>
                                                    <asp:TableCell ID="TableCell15" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s14" ImageUrl="~/Images/available_seat_img.gif" runat="server" />14</asp:TableCell>
                                                    <asp:TableCell ID="TableCell16" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s17" ImageUrl="~/Images/available_seat_img.gif" runat="server" />17</asp:TableCell>
                                                    <asp:TableCell ID="TableCell17" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s20" ImageUrl="~/Images/available_seat_img.gif" runat="server" />20</asp:TableCell>
                                                    <asp:TableCell ID="TableCell18" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s23" ImageUrl="~/Images/available_seat_img.gif" runat="server" />23</asp:TableCell>
                                                    <asp:TableCell ID="TableCell19" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s26" ImageUrl="~/Images/available_seat_img.gif" runat="server" />26</asp:TableCell>
                                                    <asp:TableCell ID="TableCell20" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s30" ImageUrl="~/Images/available_seat_img.gif" runat="server" />30</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell21" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell22" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell23" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell24" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell25" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell26" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell27" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell28" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell29" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell30" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s29" ImageUrl="~/Images/available_seat_img.gif" runat="server" />29</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell31" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s3" ImageUrl="~/Images/available_seat_img.gif" runat="server" />3</asp:TableCell>
                                                    <asp:TableCell ID="TableCell32" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s4" ImageUrl="~/Images/available_seat_img.gif" runat="server" />4</asp:TableCell>
                                                    <asp:TableCell ID="TableCell33" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s9" ImageUrl="~/Images/available_seat_img.gif" runat="server" />9</asp:TableCell>
                                                    <asp:TableCell ID="TableCell34" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s10" ImageUrl="~/Images/available_seat_img.gif" runat="server" />10</asp:TableCell>
                                                    <asp:TableCell ID="TableCell35" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s15" ImageUrl="~/Images/available_seat_img.gif" runat="server" />15</asp:TableCell>
                                                    <asp:TableCell ID="TableCell36" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s16" ImageUrl="~/Images/available_seat_img.gif" runat="server" />16</asp:TableCell>
                                                    <asp:TableCell ID="TableCell37" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s21" ImageUrl="~/Images/available_seat_img.gif" runat="server" />21</asp:TableCell>
                                                    <asp:TableCell ID="TableCell38" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s22" ImageUrl="~/Images/available_seat_img.gif" runat="server" />22</asp:TableCell>
                                                    <asp:TableCell ID="TableCell39" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s27" ImageUrl="~/Images/available_seat_img.gif" runat="server" />27</asp:TableCell>
                                                    <asp:TableCell ID="TableCell40" class="seatCell" valign="middle" runat="server">
                                                        <asp:Image ID="s28" ImageUrl="~/Images/available_seat_img.gif" runat="server" />28</asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </asp:Panel>
        <table id="logoIndicator" runat="server" style="display:none">
                                        <tr><td>&nbsp;</td></tr>
                                            <tr align="center"><td style="width:125px"></td>
                                                <td>
                                                    <asp:Image ID="imgbo" ImageUrl="~/Images/booked_seat_img.gif" runat="server" 
                                                        Height="23px" Width="31px"/>
                                                    </td><td style="font-size:medium;color:Navy">
                                                    <asp:Literal ID ="litbooked" Text = "Booked Seats" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="imgav2" ImageUrl="~/Images/available_seat_img.gif" runat="server" 
                                                        Height="23px" Width="31px" />
                                                    </td><td style="font-size:medium;color:Navy">
                                                    <asp:Literal ID ="Literal1" Text = "Available Seats" runat="server" />
                                                </td>
                                                
                                            </tr>
                                        </table>
    </div>
</asp:Content>

