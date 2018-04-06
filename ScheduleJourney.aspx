<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ScheduleJourney.aspx.cs" Inherits="ScheduleJourney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style="font-size:larger;font-weight:bold">
   <div class="row">
       <div class="col-lg-3">
                    Select Destination Station:
               </div>
       <div class="col-lg-8">
                    <asp:DropDownList ID="ddTo" CssClass="dropbtn form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Destination_SelectedIndexChanged">
                <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
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
            </asp:DropDownList>
           </div>
           <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="ddTo" InitialValue="0"></asp:RequiredFieldValidator>
              </div>
       </div><br />
         <div class="row">
       <div class="col-lg-3">
         Departure Time:
           </div>
             <div class="col-lg-8">
                <asp:DropDownList ID="ddDeptTime" CssClass="form-control" runat="server"></asp:DropDownList>
                 </div>
             <div class="col-lg-1">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="ddDeptTime"></asp:RequiredFieldValidator>
           </div>
             </div><br />
        <div class="row">
       <div class="col-lg-3">
           Date:
           </div>
            <div class="col-lg-8">
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            <div class="col-lg-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
           </div>
            </div><br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-lg btn-block" OnClick="btnSubmit_Click" />
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green" Font-Size="X-Large"></asp:Label>
        </div>
</asp:Content>

