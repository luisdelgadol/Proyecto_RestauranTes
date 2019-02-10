<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Menu.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>RestauranTES.com</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"/> 
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script> 
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.equalheights.js" type="text/javascript"></script> 
    <style type="text/css">
         .auto-style6 {height: 527px;width: 758px;}
         .auto-style7 {width: 80px;}
         .auto-style10 {width: 100%;overflow: hidden;text-align: center;}
         .auto-style12 {width: 912px;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu</h2>
                </div>
            </div>
        </div>
        <section id="content"><div class="ic"></div>
        <div class="main">
            <div class="auto-style10">
            	<asp:Menu ID="Menu" runat="server" BackColor="White" DynamicHorizontalOffset="2" Font-Names="Broadway" Font-Size="Large" ForeColor="#F87305" Height="40px" Orientation="Horizontal" StaticSubMenuIndent="10px" Width="100%">
                    <DynamicHoverStyle BackColor="Red" ForeColor="Red" BorderColor="#EA5A04" Font-Names="Broadway" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#B5C7DE" />
                    <DynamicSelectedStyle BackColor="Aqua" />
                       
                    
                    
                    <StaticHoverStyle BackColor="Black" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="30px" VerticalPadding="5px" />
                    <StaticMenuStyle HorizontalPadding="40px" VerticalPadding="10px" />
                    <StaticSelectedStyle BackColor="#507CD1" />
                </asp:Menu>

                <div>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>                
            </div>
        </div>   
        </section>
    </div>
    
   <%-- <script type="text/javascript"> Cufon.now(); </script>
    <script type="text/javascript">
        $(window).load(function () {
            $('.slider')._TMS({
                duration: 1000,
                easing: 'easeOutQuint',
                preset: 'slideDown',
                slideshow: 7000,
                banners: false,
                pauseOnHover: true,
                pagination: true,
                pagNums: false
            });
        });
    </script>--%>
</asp:Content>

