<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserBookTickets.aspx.cs" Inherits="UserBookTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblStatus" style="margin-left:550px;" runat="server" Text="Book Tickets Now!!" ForeColor="Blue" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />
    <asp:Label ID="lblError" style="margin-left:550px;" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
    <br /><br />
    
    <div style="background-image:url(imagescss/img_bg_1.jpg);margin-left:50px;width:1345px">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="view1" runat="server">
    <div style="display:inline-block;margin-left:100px">
        <table style="border-spacing: 15px;border-collapse: separate;font-weight:bold;font-size:larger">
            <tr>
                <td>From:</td>
                <td> <asp:DropDownList ID="ddFrom" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Mumbai" Value="Mumbai"></asp:ListItem>
                 </asp:DropDownList></td>

            </tr>
            <tr>
        <td>To: </td>
                <td><asp:DropDownList ID="ddTo" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Destination_SelectedIndexChanged">
              
            </asp:DropDownList>

                    
                </td>

            </tr>
            <tr>
        <td>Depart On:</td>
                <td><asp:DropDownList ID="ddDepart" runat="server" CssClass="form-control" OnSelectedIndexChanged="departon_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList><br /><br />
        </td>
                    </tr>
            <tr>
                <td>Time:</td>
                <td><asp:DropDownList ID="ddTime" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DepartureTime_SelectedIndexChanged"></asp:DropDownList>
  </td>
                     </tr>
            <tr>
                <td>Seat Number:</td>
                <td>
                    <asp:TextBox ID="txtSeatNo" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Rent:</td>
                <td>
                    <asp:Label ID="lblRent" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>Bus Number :</td>
                <td>
                    <asp:Label ID="lblBusNumber" runat="server" Text=""></asp:Label>
                </td>
            </tr>
                 </table>
        
            </div>
    <div style="display:inline-block;margin-left:200px;" runat="server">
        
        <div id="pnl1" runat="server" style="display:none">
                                            <asp:Table border="0" ID="seattable" runat="server" style="border-spacing: 15px;border-collapse: separate;">
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell1" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s1" OnClick="seatClick" ValidationGroup="bt" ToolTip="Window Side" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />
                                                        1</asp:TableCell>
                                                    <asp:TableCell ID="TableCell2" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s6" OnClick="seatClick" ValidationGroup="bt" ImageUrl="~/Images/available_seat_img.gif" runat="server" />6</asp:TableCell>
                                                    <asp:TableCell ID="TableCell3" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s7" OnClick="seatClick" ValidationGroup="bt" ToolTip="Window Side" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />7</asp:TableCell>
                                                    <asp:TableCell ID="TableCell4" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s12" ImageUrl="~/Images/available_seat_img.gif" runat="server" />12</asp:TableCell>
                                                    <asp:TableCell ID="TableCell5" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s13" ImageUrl="~/Images/available_seat_img.gif" runat="server" />13</asp:TableCell>
                                                    <asp:TableCell ID="TableCell6" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s18" ImageUrl="~/Images/available_seat_img.gif" runat="server" />18</asp:TableCell>
                                                    <asp:TableCell ID="TableCell7" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ID="s19" ValidationGroup="bt" ImageUrl="~/Images/available_seat_img.gif" runat="server" />19</asp:TableCell>
                                                    <asp:TableCell ID="TableCell8" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s24" ImageUrl="~/Images/available_seat_img.gif" runat="server" />24</asp:TableCell>
                                                    <asp:TableCell ID="TableCell9" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s25" ImageUrl="~/Images/available_seat_img.gif" runat="server" />25</asp:TableCell>
                                                    <asp:TableCell ID="TableCell10" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s31" ImageUrl="~/Images/available_seat_img.gif" runat="server" />31</asp:TableCell></asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell11" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s2" ImageUrl="~/Images/available_seat_img.gif" runat="server" />2</asp:TableCell>
                                                    <asp:TableCell ID="TableCell12" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s5" ImageUrl="~/Images/available_seat_img.gif" runat="server" />5</asp:TableCell>
                                                    <asp:TableCell ID="TableCell13" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s8" ImageUrl="~/Images/available_seat_img.gif" runat="server" />8</asp:TableCell>
                                                    <asp:TableCell ID="TableCell14" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s11" ImageUrl="~/Images/available_seat_img.gif" runat="server" />11</asp:TableCell>
                                                    <asp:TableCell ID="TableCell15" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s14" ImageUrl="~/Images/available_seat_img.gif" runat="server" />14</asp:TableCell>
                                                    <asp:TableCell ID="TableCell16" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s17" ImageUrl="~/Images/available_seat_img.gif" runat="server" />17</asp:TableCell>
                                                    <asp:TableCell ID="TableCell17" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s20" ImageUrl="~/Images/available_seat_img.gif" runat="server" />20</asp:TableCell>
                                                    <asp:TableCell ID="TableCell18" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s23" ImageUrl="~/Images/available_seat_img.gif" runat="server" />23</asp:TableCell>
                                                    <asp:TableCell ID="TableCell19" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s26" ImageUrl="~/Images/available_seat_img.gif" runat="server" />26</asp:TableCell>
                                                    <asp:TableCell ID="TableCell20" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s30" ImageUrl="~/Images/available_seat_img.gif" runat="server" />30</asp:TableCell>
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
                                                        <asp:ImageButton OnClick="seatClick" ID="s29" ImageUrl="~/Images/available_seat_img.gif" runat="server" />29</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell31" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s3" ImageUrl="~/Images/available_seat_img.gif" runat="server" />3</asp:TableCell>
                                                    <asp:TableCell ID="TableCell32" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s4" ImageUrl="~/Images/available_seat_img.gif" runat="server" />4</asp:TableCell>
                                                    <asp:TableCell ID="TableCell33" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s9" ImageUrl="~/Images/available_seat_img.gif" runat="server" />9</asp:TableCell>
                                                    <asp:TableCell ID="TableCell34" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s10" ImageUrl="~/Images/available_seat_img.gif" runat="server" />10</asp:TableCell>
                                                    <asp:TableCell ID="TableCell35" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s15" ImageUrl="~/Images/available_seat_img.gif" runat="server" />15</asp:TableCell>
                                                    <asp:TableCell ID="TableCell36" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s16" ImageUrl="~/Images/available_seat_img.gif" runat="server" />16</asp:TableCell>
                                                    <asp:TableCell ID="TableCell37" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s21" ImageUrl="~/Images/available_seat_img.gif" runat="server" />21</asp:TableCell>
                                                    <asp:TableCell ID="TableCell38" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s22" ImageUrl="~/Images/available_seat_img.gif" runat="server" />22</asp:TableCell>
                                                    <asp:TableCell ID="TableCell39" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s27" ImageUrl="~/Images/available_seat_img.gif" runat="server" />27</asp:TableCell>
                                                    <asp:TableCell ID="TableCell40" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton OnClick="seatClick" ValidationGroup="bt" ID="s28" ImageUrl="~/Images/available_seat_img.gif" runat="server" />28</asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
             <asp:ImageButton ID="ibnext" ImageUrl="~/Images/btn_go.gif" runat="server" ValidationGroup="bt" OnClick="ibnext_Click" Visible="false" />
                                        </div>

      
              </div>  
                </asp:View>
            <asp:View ID="view2" runat="server">
                <div id="pnl2" runat="server" style="background-image:url(imagescss/img_bg_1.jpg);margin-left:50px;width:1200px;font-size:large;font-weight:bold;">
                                            <br />
                    <asp:Label ID="Label1" runat="server" CssClass="label label-warning" Font-Bold="true" Font-Size="Larger" Text="CUSTOMER INFORMATION"></asp:Label>
                                         <br /><br />       
                    <div class="row">
                        <div class="col-lg-4">
                            Ticket Number : <asp:Literal ID="litpnr" runat="server" />
                        </div>
                        <div class="col-lg-4">
                            Total Seat : <asp:Literal ID="littotalseat" runat="server"></asp:Literal>
                        </div>
                        <div class="col-lg-4">
                            Rent Per Seat:<asp:Literal ID="litrent" runat="server"></asp:Literal>
                        </div>

                    </div><br />
                    <div class="row">
                        <div class="col-lg-4">
                            Bus Number : <asp:Literal ID="litbusnumber" runat="server" />
                        </div>
                        <div class="col-lg-4">
                            Total Rent : <asp:Literal ID="littotalrent" runat="server" />
                        </div>
                    </div>
                    <br />
                    <asp:Label ID="Label2" runat="server" CssClass="label label-warning" Font-Bold="true" Font-Size="Larger" Text="PAYMENT INFORMATION"></asp:Label>
                    <br /><br />
                                                    <table border="0" style="font-size:large;font-weight:bold;padding:20px">
                                                        <tbody>
                                                            <tr>
                                                                <td>Select Bank</td>
                                                                <td width="5%">
                                                                        :
                                                                    </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddBank" runat="server" CssClass="form-control">
                                                                        <asp:ListItem Text="State Bank Of India"></asp:ListItem>
                                                                        <asp:ListItem Text="ICICI Bank"></asp:ListItem>
                                                                        <asp:ListItem Text="Indian Bank"></asp:ListItem>
                                                                        <asp:ListItem Text="Kotak Mahindra Bank"></asp:ListItem>
                                                                        <asp:ListItem Text="HDFC Bank"></asp:ListItem>
                                                                        <asp:ListItem Text="Axis Bank"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddBank" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td>Select Your Card Type</td>
                                                                <td width="5%">
                                                                        :
                                                                    </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddCardType" runat="server" CssClass="form-control">
                                                                        <asp:ListItem Text="Visa"></asp:ListItem>
                                                                        <asp:ListItem Text="Rupay"></asp:ListItem>
                                                                        <asp:ListItem Text="Maestro"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddCardType" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td>Card Holders' Name</td>
                                                                <td width="5%">
                                                                        :
                                                                    </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCardHolderName" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtCardHolderName" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtCardHolderName" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" ErrorMessage="Invalid name"></asp:RegularExpressionValidator>    
                                                                </td>
                                                                <td>Card Number</td>
                                                                <td width="5%">
                                                                        :
                                                                    </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCardNo" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCardNo" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>    
                                                                </td>
                                                                </tr>
                                                            
                                                            <tr>
                                                                <td>CVV</td>
                                                                <td width="5%">
                                                                        :
                                                                    </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCVV" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCVV" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ControlToValidate="txtCVV" ValidationExpression="^[0-9]{3,4}$" ErrorMessage="Invalid CVV"></asp:RegularExpressionValidator>    
                                                                </td>
                                                                </tr>
                                                            <tr>
                                                                <td>
                <asp:Button ID="btnSave" CssClass="btn btn-warning btn-block" Text="GO" Font-Bold="true" style="margin-left:400px" runat="server" OnClick="btnSave_Click" Visible="False" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                    <br />
                                                    
                                         
        </div>
            </asp:View>
            </asp:MultiView>        
        </div>
</asp:Content>

