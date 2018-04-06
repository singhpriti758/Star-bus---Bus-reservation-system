<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserCancelTickets.aspx.cs" Inherits="UserCancelTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="0" cellpadding="2" border="0" style="vertical-align:top; margin:0 auto;padding-top:25px" align="center">
                                            <tbody>                                                
                                                <tr>
                                                    
                                                    <td >
                                                        <asp:TextBox ID="txtpnr" ValidationGroup="ct" CssClass="form-control input-lg" placeholder="PNR Number" runat="server" />
                                                        <asp:RequiredFieldValidator ID="rfvname" ValidationGroup="ct" runat="server" ErrorMessage="*"  ControlToValidate="txtpnr" Display="Dynamic" />
                                                    </td><td>
                                                        <asp:Button ID="btnCancel" runat="server" ValidationGroup="ct" CssClass="btn btn-warning" Text ="Cancel Ticket" onclick="btnCancel_Click1" />    
                                                        </td>
                                                </tr>
                                                
                                                    <tr>
                                                    <td align="center" colspan="2" height="25">
                                                        <asp:Label ID="lblerror" runat="server" Font-Bold="true" Font-Size="X-Large" ForeColor="Red" />
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
</asp:Content>

