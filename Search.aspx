<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="css/bootstrap.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center">
        <tr align="left">
            <td align="left" class="style1" >
               <strong> <asp:Label ID="lblheat" runat="server" CssClass="label label-info" Text="Search Tickets" Font-Size= "X-Large" ></asp:Label>
                    </strong>
           <br /> </td>
        </tr>
    </table>
    <br /><br />
    <table style="width: 100%; height: 200px;">
        <!-- Main Table start -->
        <tr>
            <td>
                <!-- Left Table Start
               
                            <table cellspacing="0" cellpadding="2" border="0" style="vertical-align:top; margin:0 auto;padding-top:25px" align="center">
                                            <tbody>                                                
                                                <tr>
                                                    <td colspan="2" height="25">
                                                        <strong>Enter The PNR number:</strong>
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    
                                                    <td >
                                                        
                                                    </td><td>
                                                           
                                                        </td>
                                                </tr>
                                                
                                                    <tr>
                                                    <td align="center" colspan="2" height="25">
                                                       
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    -->
                <div class="container">
                <div class="col-lg-7">
                    <div class="input-group">
      <span class="input-group-addon">PNR Number</span>
                         <asp:TextBox ID="txtpnr" CssClass="form-control" runat="server" />
                   
    
    </div>
                    </div>
                    <div class="col-lg-1">
                        <asp:RequiredFieldValidator ID="rfvname" ForeColor="Red" runat="server" ErrorMessage="*"  ControlToValidate="txtpnr" Display="Dynamic" />
                    </div>
                    <div class="col-lg-4">
                     <asp:Button ID="btnshow" runat="server" Text ="Display" CssClass="btn btn-success" onclick="btndisplay_Click1" />
                    </div>
                    </div>
                <br />
                <div class="container row alert-danger" style="margin-left:180px;width:500px">
                    
                     <asp:Label ID="lblerror"  runat="server" ForeColor="Red" />
                </div>
                             <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; height: 254px;">
                    <tbody>
                        <tr>
                            <!--Center Side Start -->
                            <td>            
                            </td>
                            <!--Center Side End -->
                            <!--Right Side open -->
                            <td valign="middle" align="center">
                            <asp:Panel ID="pnl1" runat="server">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="logo">
                                                <!-- logo here-->
                                                <img alt="bus" src="Images/volvo-bus-final.gif" />
                                                <!-- end of logo-->
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel  ID="pnl2" runat="server" CssClass="panel panel-primary" Visible="False" Width="1200px">
                                            <div id="Div1" class="panel-heading">Details</div>
                                                                             
                                                <div class="panel-body">
                                                    <%--<table cellspacing="4" cellpadding="4" border="0" style="border:2px solid gray;padding:20px; ">
                                                        <tbody  align="left"  >
                                                            <tr >
                                                                <td height="25">
                                                                    <strong>PNR Number </strong> 
                                                                </td>
                                                                <td class="style3">
                                                                    :
                                                                </td>
                                                                <td>
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="25">
                                                                    <strong>Name</strong>
                                                                </td>
                                                                <td class="style3">
                                                                    :
                                                                </td>
                                                                <td class="style2">
                                                                    
                                                                </td>
                                                               
                                                            </tr>
                                                            <tr>
                                                                <td height="25">
                                                                    <strong>From </strong>
                                                                </td>
                                                                <td class="style3">
                                                                    :
                                                                </td>
                                                                <td class="style2">
                                                                 
                                                                </td>
                                                                <td>
                                                                    <strong> To </strong> </td>
                                                                <td>:</td>
                                                                <td>
                                                                </tr> 
                                                                <tr>
                                                                    <td align="left" height="25">
                                                                        <strong>Date </strong>
                                                                    </td>
                                                                    <td align="left" class="style3">
                                                                        :
                                                                    </td>
                                                                    <td align="left" class="style2">
                                                                       
                                                                    </td>
                                                                    <td>
                                                                        <strong>Time</strong></td>
                                                                    <td>:</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" height="25">
                                                                        <strong> Seat Number </strong>
                                                                    </td>
                                                                    <td align="left" class="style3">
                                                                        :
                                                                    </td>
                                                                    <td align="left" class="style2">
                                                                       
                                                                    </td>
                                                                    <td>
                                                                        <strong>Total Seat</strong> </td>
                                                                    <td>:</td>
                                                                    <td>   </td>
                                                                </tr>
                                                                <tr><td align="left" height="25">
                                                                    <strong>Status</strong></td>
                                                                <td>:</td>
                                                                <td class="redtext"></td></tr>
                                                                <tr>
                                                                    <td class="redtext" height="25">
                                                                        <strong>Total Rent</strong>
                                                                    </td>
                                                                    <td class="style3">
                                                                        :
                                                                    </td >
                                                                    <td colspan="4" class="redText">
                                                                        <strong>Rs.
                                                                        
                                                                    </strong></td>
                                                                </tr>
                                                                
                                                        </tbody>
                        </table>--%>


                                <div class="container" style="font-weight:bold;padding:20px;font-size:large">
                                    <div class="row">
                                        <div class="col-lg-6">
                                        PNR : <asp:Literal ID="litpnr" runat="server" />
                                            </div>
                                        <div class="col-lg-6">
                                            Name : <asp:Literal ID="litname" runat="server" />
                                        </div>
                                    </div>
                                     <div class="row">
                                         <div class="col-lg-6">
                                             From : <asp:Literal ID="litfrom" runat="server" />  
                                         </div>
                                         <div class="col-lg-6">
                                             To : <asp:Literal ID="litto" runat="server" />
                                         </div>
                                    </div>
                                     <div class="row">
                                          <div class="col-lg-6">
                                              Date :  <asp:Literal ID="litdate" runat="server"></asp:Literal>
                                          </div>
                                         <div class="col-lg-6">
                                             Departure Time : <asp:Literal ID="littime" runat="server" />
                                         </div>
                                    </div>
                                     <div class="row">
                                         <div class="col-lg-6">
                                             Seat Numbers :  <asp:Literal ID="litseat" runat="server"></asp:Literal>
                                         </div>
                                         <div class="col-lg-6">
                                             Total Seats : <asp:Literal ID="littotalseat" runat="server" /> 
                                         </div>
                                    </div>
                                     <div class="row">
                                         <div class="col-lg-6">
                                             Status : <asp:Literal ID="litstates" runat="server" />
                                         </div>
                                         <div class="col-lg-6">
                                             Total Cost : <asp:Literal ID="litrent" runat="server" />
                                         </div>
                                    </div>

                                </div>
                        </div></asp:Panel>
                            </td>
                            <!--Right Side End -->
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

