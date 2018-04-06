<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TimeList.aspx.cs" Inherits="TimeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="css/bootstrap.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div style="margin-left:50px">
    <asp:Label ID="Label1" runat="server" Text="Time List Details:" ForeColor="Blue" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
        <br /><br />
       
        <div>
    <asp:gridview ID="Gridview1" runat="server" ShowFooter="True" 
                    AutoGenerateColumns="False"
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="3" Font-Size="Medium" Width="900px" DataKeyNames="Sno" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Sno" HeaderText="Sno" ReadOnly="True" SortExpression="Sno" />
                <asp:BoundField DataField="Station_name" HeaderText="Station_name" SortExpression="Station_name" />
                <asp:BoundField DataField="Rate_per_seat" HeaderText="Rate_per_seat" SortExpression="Rate_per_seat" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Arrival_time" HeaderText="Arrival_time" SortExpression="Arrival_time" />
                <asp:BoundField DataField="Bus_number" HeaderText="Bus_number" SortExpression="Bus_number" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Time_list] WHERE [Sno] = @Sno" InsertCommand="INSERT INTO [Time_list] ([Sno], [Station_name], [Rate_per_seat], [Time], [Arrival_time], [Bus_number]) VALUES (@Sno, @Station_name, @Rate_per_seat, @Time, @Arrival_time, @Bus_number)" SelectCommand="SELECT * FROM [Time_list] ORDER BY [Station_name]" UpdateCommand="UPDATE [Time_list] SET [Station_name] = @Station_name, [Rate_per_seat] = @Rate_per_seat, [Time] = @Time, [Arrival_time] = @Arrival_time, [Bus_number] = @Bus_number WHERE [Sno] = @Sno">
                <DeleteParameters>
                    <asp:Parameter Name="Sno" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Sno" Type="Int32" />
                    <asp:Parameter Name="Station_name" Type="String" />
                    <asp:Parameter Name="Rate_per_seat" Type="Int32" />
                    <asp:Parameter Name="Time" Type="String" />
                    <asp:Parameter Name="Arrival_time" Type="String" />
                    <asp:Parameter Name="Bus_number" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Station_name" Type="String" />
                    <asp:Parameter Name="Rate_per_seat" Type="Int32" />
                    <asp:Parameter Name="Time" Type="String" />
                    <asp:Parameter Name="Arrival_time" Type="String" />
                    <asp:Parameter Name="Bus_number" Type="String" />
                    <asp:Parameter Name="Sno" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </div>
        <div><br /><br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
    <asp:Button ID="btnNew" runat="server" Text="New" OnClick="displayDiv" CssClass="btn btn-success btn-lg" /><br /><br />
    <div id="newRecordDiv" runat="server" style="display:none">
        <table style="padding:30px;font-size:larger;font-weight:bold">
            <tr>
                <td>
                    Select Destination Station:
                </td>
                <td>
                    <asp:DropDownList ID="ddTo" CssClass="dropbtn form-control" runat="server">
                <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                <asp:ListItem Text="Ajmer" Value="Ajmer"></asp:ListItem>
                <asp:ListItem Text="Alwar" Value="Alwar"></asp:ListItem>
                <asp:ListItem Text="Bhilwara" Value="Bhilwara"></asp:ListItem>
                <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
                <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                <asp:ListItem Text="Hanumangarh" Value="Hanumangarh"></asp:ListItem>
                <asp:ListItem Text="Jaipur" Value="Jaipur"></asp:ListItem>
                <asp:ListItem Text="Jodhpur" Value="Jodhpur"></asp:ListItem>
                <asp:ListItem Text="Kota" Value="Kota"></asp:ListItem>
            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ValidationGroup="nr" runat="server" ErrorMessage="*" ControlToValidate="ddTo" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Rate per seat(Rs):
                </td>
                <td>
                    <asp:TextBox ID="txtRate" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ValidationGroup="nr" runat="server" ErrorMessage="*" ControlToValidate="txtRate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Departure time:
                </td>
                <td>
                    <asp:TextBox ID="txtDpTime" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="nr" runat="server" ErrorMessage="*" ControlToValidate="txtDpTime"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Arrival Time:
                </td>
                <td>
                    <asp:TextBox ID="txtArTime" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="nr" runat="server" ErrorMessage="*" ControlToValidate="txtArTime"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Bus number:
                </td>
                <td>
                    <asp:TextBox ID="txtBusNo" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ValidationGroup="nr" runat="server" ErrorMessage="*" ControlToValidate="txtBusNo"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-lg" ValidationGroup="nr" OnClick="btnSubmit_OnClick" />
    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
            </div>
            </div>
       
</asp:Content>

