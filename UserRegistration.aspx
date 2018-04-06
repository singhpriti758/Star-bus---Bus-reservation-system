<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="css/bootstrap.css"/>
    <style>
        .form-control {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    border-bottom: 2px solid red;
}
        .dropbtn {
    background-color: #34CECE;
    color: white;
    padding: 8px;
    border: none;
    cursor: pointer;
    height:40px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="margin-left: 50px;;width:1300px">
                <asp:Label ID="Label1" style="margin-left:400px" Font-Size="XX-Large" CssClass="label label-info" runat="server" Text="----Registration----"></asp:Label>
            
        <br /><br />
        <table class="container">
            <tr class="row">
                <td>
                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Full Name" ToolTip="Full Name" runat="server" /><asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtName" runat="server" />
               <asp:RegularExpressionValidator ID="regexname" Display="Dynamic" runat="server" ControlToValidate="txtName" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" ErrorMessage="Invalid name"></asp:RegularExpressionValidator>    
                     </td>
                <td>
                     <asp:TextBox ID="txtUsername" CssClass="form-control" placeholder="Username" ToolTip="Username" runat="server" /><asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername" runat="server" />
                
                     </td>
            </tr>
            <tr class="row">
                <td>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" ToolTip="Password" runat="server" TextMode="Password" /><asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$" runat="server" ForeColor="Red" ErrorMessage="Password must be at least 8 characters long. 1 uppercase, 1 lowercase and 1 number" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                     </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" placeholder="Re-enter Password" ToolTip="Re-enter Password" CssClass="form-control" runat="server" TextMode="Password" /><asp:CompareValidator SetFocusOnError="true" ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirmPassword" runat="server" />
                </td>
            </tr>
            <tr class="row">
                <td>
                     <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email Address" ToolTip="Email Address" runat="server" /><asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="txtEmail" runat="server" />
                <asp:RegularExpressionValidator SetFocusOnError="true" runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                </td>
                <td>
                     <asp:TextBox ID="txtAddress" placeholder="Address" CssClass="form-control" ToolTip="Address" runat="server" TextMode="MultiLine" />
                </td>
            </tr>
            <tr class="row">
                <td>
                    <asp:TextBox ID="txtMobile" placeholder="Mobile Number" ToolTip="Mobile Number" CssClass="form-control" runat="server" TextMode="Number" MaxLength="10" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="txtMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Incorrect mobile number format" ControlToValidate="txtMobile" ValidationExpression="^([0]|\+91)?[789]\d{9}$"></asp:RegularExpressionValidator>
                     </td>
            </tr>
            <tr class="row">
                <td>
                     <asp:DropDownList ID="ddSecQ" CssClass="dropbtn" runat="server">
            <asp:ListItem Text="What is your birth month?"></asp:ListItem>
            <asp:ListItem Text="Who is your favorite actor?"></asp:ListItem>
            <asp:ListItem Text="Who is your favorite singer?"></asp:ListItem>
        </asp:DropDownList>  
                </td>
                <td>
                    <asp:TextBox ID="txtSecA" CssClass="form-control" placeholder="Security Answer" ToolTip="Security Answer" runat="server" /><asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSecA" runat="server" />
                </td>
            </tr>
            
                    
                
        </table> 
        <asp:Button Text="Submit" CssClass="btn btn-info btn-block"  runat="server" OnClick="RegisterUser" /><br />
        <asp:Label ID="lblError" ForeColor="Red" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

