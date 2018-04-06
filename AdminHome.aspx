<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="color:blue; font-size:x-large;font-weight:bold;margin-left:70px">
    <asp:Label ID="Label1" runat="server" Text="Hello Admin" ForeColor="Blue" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
    <br />
    <br />
    Reservations:
        <br />
        <br />
    <asp:gridview ID="Gridview1" runat="server" ShowFooter="True" 
                    AutoGenerateColumns="False" style="margin-left: 57px"
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="3" GridLines="Both" Font-Size="Medium" Width="900px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
            <asp:BoundField DataField="Pnr" HeaderText="PNR" />
                <asp:BoundField DataField="C_name" HeaderText="Customer name" />
                <asp:BoundField DataField="C_to" HeaderText="Destination" />
                <asp:BoundField DataField="C_from" HeaderText="Source" />
                <asp:BoundField DataField="C_date" HeaderText="Departure date" />
                <asp:BoundField DataField="C_time" HeaderText="Departure time" />
                <asp:BoundField DataField="totalseat" HeaderText="Total Seats" />
                <asp:BoundField DataField="Seatnumber" HeaderText="Seat numbers" />
                <asp:BoundField DataField="amount" HeaderText="Amount" />
                <asp:BoundField DataField="Status" HeaderText="Reservation Status" />
            </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
           <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
           <RowStyle BackColor="#EEEEEE" ForeColor="Black" Height="40px" />
           <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F1F1F1" />
           <SortedAscendingHeaderStyle BackColor="#0000A9" />
           <SortedDescendingCellStyle BackColor="#CAC9C9" />
           <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:gridview>
        </div>
</asp:Content>

