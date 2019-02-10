<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador.aspx.vb" Inherits="_Default" %>

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
         .auto-style10 {width: 100%;overflow: hidden;text-align: center;}
         .menu{
             padding-right:10px;
         }
         </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu-<asp:Label ID="lblUsuario" runat="server" Text="Label" ></asp:Label></h2>
                </div>
            </div>
        </div>
        <section id="content"><div class="ic"></div>
        <div class="main">
            <div class="auto-style10">
            	  <%--     /INICIO CAMBIOS REALIZADOS EN EL MENU DE ADMINISTRADOR*/--%>
            	  <strong>
            	 <asp:Menu


        id="Menu1"


        StaticMenuItemStyle-CssClass="menuItem"


        DynamicMenuItemStyle-CssClass="menuItem"


        Runat="server" />

                  </strong>
            <%--     /FIN CAMBIOS REALIZADOS EN EL MENU DE ADMINISTRADOR*/--%>

                <div>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>  
                <br /> 
                <br />
                    <br />
                    <br />             
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

