<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image:url(imagescss/img_bg_2.jpg);margin-left:50px;width:1345px;background-repeat:no-repeat">
        <br />
        <div class="container" style="margin-left:300px">
            <asp:Label ID="Label1" runat="server" Text="Change Password" Font-Bold="true" Font-Size="X-Large" ForeColor="White"></asp:Label><br /><br />
        <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
      <span class="input-group-addon">Current Password</span>
                         <asp:TextBox ID="txtOldPwd" TextMode="Password" ValidationGroup="cp" CssClass="form-control" runat="server" />
                   
    
    </div>
                    </div>
                    <div class="col-lg-1">
                        <asp:RequiredFieldValidator ID="rfvname" ValidationGroup="cp" ForeColor="White" runat="server" ErrorMessage="*"  ControlToValidate="txtOldPwd" Display="Dynamic" />
                    </div>
                    
                    </div>
        <br />
        <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
      <span class="input-group-addon">New Password</span>
                         <asp:TextBox ID="txtNewPassword" TextMode="Password" ValidationGroup="cp" CssClass="form-control" runat="server" />
                   
    
    </div>
                    </div>
                    <div class="col-lg-1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="cp" ForeColor="White" runat="server" ErrorMessage="*"  ControlToValidate="txtNewPassword" Display="Dynamic" />
                    </div>
                    
                    </div>
            <br />
             <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
      <span class="input-group-addon">Confirm New Password</span>
                         <asp:TextBox ID="txtCNewPwd" TextMode="Password" ValidationGroup="cp" CssClass="form-control" runat="server" />
                   
    
    </div>
                    </div>
                    <div class="col-lg-1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="cp" ForeColor="White" runat="server" ErrorMessage="*"  ControlToValidate="txtCNewPwd" Display="Dynamic" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="cp" ErrorMessage="Password mismatch" ForeColor="White" ControlToValidate="txtCNewPwd" ControlToCompare="txtNewPassword" Display="Dynamic"></asp:CompareValidator>
                         </div>
                    
                    </div>
            <br />
            <div class="row col-lg-6">
                <asp:Button ID="btnSubmit" runat="server" Text="Change Password" ValidationGroup="cp" CssClass="btn btn-success btn-block" OnClick="btnSubmit_Click" />
            </div>
            <br />
            <asp:Label ID="lblError" runat="server" Text="" ForeColor="White" Visible="false"></asp:Label>
            <br /><br />
            </div>
    </div>
</asp:Content>

