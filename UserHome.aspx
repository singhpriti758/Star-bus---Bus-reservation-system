<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:50px;font-size:larger">
        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Font-Bold="true" Font-Size="X-Large" Text="Your Reservations:"></asp:Label>
        <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1000px" CellPadding="5" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="Pnr" HeaderText="Pnr" SortExpression="Pnr" />
            <asp:BoundField DataField="C_name" HeaderText="C_name" SortExpression="C_name" />
            <asp:BoundField DataField="C_to" HeaderText="C_to" SortExpression="C_to" />
            <asp:BoundField DataField="C_from" HeaderText="C_from" SortExpression="C_from" />
            <asp:BoundField DataField="C_date" HeaderText="C_date" SortExpression="C_date" />
            <asp:BoundField DataField="C_time" HeaderText="C_time" SortExpression="C_time" />
            <asp:BoundField DataField="Totalseat" HeaderText="Totalseat" SortExpression="Totalseat" />
            <asp:BoundField DataField="Seatnumber" HeaderText="Seatnumber" SortExpression="Seatnumber" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="C_id" HeaderText="C_id" SortExpression="C_id" />
            <asp:BoundField DataField="bus_no" HeaderText="bus_no" SortExpression="bus_no" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myconnection %>" SelectCommand="SELECT * FROM [passengerinfo] WHERE ([C_id] = @C_id) ORDER BY [C_date], [C_time]">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="null" Name="C_id" SessionField="user" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>

