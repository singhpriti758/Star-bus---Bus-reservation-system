<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet"/>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css"/>
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css"/>
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css"/>
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css"/>

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css"/>

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css"/>

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="css/owl.theme.default.min.css"/>

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css"/>

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
     <style>
table {
    border-collapse: collapse;

}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
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
   <!-- <div style="margin-left:300px;margin-right:50px;">
        <asp:Image ID="imgBus" runat="server" style="display:inline-block;" ImageUrl="~/Images/bus.jpg" Height="250px" Width="550px" />
        <table style="display:inline-block;margin-top:0px;margin-right:50px;" align="right">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblLogin" runat="server" Text="Login" Font-Size="X-Large" ForeColor="Green"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Username
                </td>
                <td>
                    :</asp:TextBox><asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    :
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="linkForgotPassword" NavigateUrl="ForgotPassword.aspx" runat="server">Forgot Password?</asp:HyperLink>
                </td>
                <td>
                  
                </td>
            </tr>
            
        </table>
    </div>
    <div style="display:inline-block;margin-left:50px;margin-right:50px;">
    <table style="display:inline-block; margin-left:100px;">
  <tr>
    <td style="background-color: #4CAF50;color: white;font-weight:bold" colspan="2">Call for bus tickets and home-delivery service</td>
  </tr>
  <tr>
    <td>National toll no.</td>
    <td>:(1860) 654-1111</td>
  </tr>
  <tr>
    <td>Ahmedabad</td>
    <td>:(079) 653-1452</td>
  </tr>
  <tr>
    <td>Bangalore</td>
    <td>:(654) 765-653</td>
  </tr>
  <tr>
    <td>Delhi</td>
    <td>:(011) 435-1234</td>
</tr>
        <tr>
    <td>Mumbai</td>
    <td>:(012) 653-6789</td>
</tr>
</table>
        <table style="display:inline-block;margin-left:200px">
  <tr>
    <td style="background-color: #4CAF50;color: white;font-weight:bold" colspan="2">Starbus Advantages</td>
  </tr>
  <tr>
    <td>Home delivery service of bus tickets @ Rs.25 in major cities</td>
  </tr>
  <tr>
    <td>Book bus tickets online with over 300 bus travel operators</td>
  </tr>
  <tr>
    <td>Book bus tickets online for over 4000+ routes across india</td>
  </tr>
  <tr>
    <td>Return bus tickets reservation</td>
</tr>
</table>
        </div>-->
		
	
	
	<div id="page">

	
	<!-- <div class="page-inner"> 
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="index.html">Traveler <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li><a href="destination.html">Destination</a></li>
						<li class="has-dropdown">
							<a href="#">Travel</a>
							<ul class="dropdown">
								<li><a href="#">Europe</a></li>
								<li><a href="#">Asia</a></li>
								<li><a href="#">America</a></li>
								<li><a href="#">Canada</a></li>
							</ul>
						</li>
						<li><a href="pricing.html">Pricing</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>	
				</div>
			</div>
			
		</div>
	</nav>-->
	
	<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/img_bg_2.jpg);margin-left:50px;width:1340px;height:600px">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					<br />

					<div class="row">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<h1>Welcome To Star Bus. Planing Trip To Anywhere in The India?</h1>	
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<h3>Login</h3>
											<form action="#">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="txtUsername">Username</label>
														<asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator SetFocusOnError="true" ValidationGroup="login" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername" runat="server" />
													</div>
												</div>
											
												<div class="row form-group">
													<div class="col-md-12">
														<label for="txtPassword">Password</label>
														<asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator SetFocusOnError="true" ValidationGroup="login" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" />
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														 <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-block" ValidationGroup="login" Text="Login" />
													</div>
												</div>
											</form>	
										</div>

										
									</div>
								</div>
							</div>
						</div>
					</div>
							
					
				</div>
			</div>
		</div>
	</header>




	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	
	<!-- Datepicker -->
	<script src="js/bootstrap-datepicker.min.js"></script>
	

	<!-- Main -->
	<script src="js/main.js"></script>

</asp:Content>

