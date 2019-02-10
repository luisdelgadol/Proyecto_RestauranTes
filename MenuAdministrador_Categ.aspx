<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Categ.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
        .auto-style6 {height: 527px;width: 768px; height: 25px}
        .auto-style7 {width: 80px;}
        .auto-style14 {
            text-align: left;
            background-color: #FFFFFF;
            margin-left: 80px;
        }
        .auto-style17 {
            background-color: #FFFFFF;
            text-align: left;
            vertical-align: central;
            height: 25px;
        }
        .auto-style18 {
            width: 214px;
            background-color: #FFFFFF;
            height: 25px;
        }
        .auto-style20 {
            width: 214px;
            color: #0000FF;
            background-color: #FFFFFF;
            text-align: right;;
            height: 25px;
        }
        .auto-style21 {
            width: 682px;
        }
        .auto-style22 {
            color: #FF0000;
            border-width: 1px;
        }
    </style>
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu Administrador</h2>
                </div>
            </div>
        </div>
        
        <section id="content">                         
            <table class="main2">
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style21">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style21">
                        <table class="auto-style6" style="background-position: center center; border: thick ridge #FFFFFF; background-image: url('images/degradado.png'); border-spacing: inherit; background-repeat: repeat;">
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style17"><%=tipo%></td>
                            </tr>
                            <tr>
                                <td class="auto-style20">&nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_Nom" runat="server" Width="30%" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style22"></asp:TextBox>
                                    <asp:DropDownList ID="cbCategoria" runat="server" Height="20px" Width="80px" style="font-weight: 700; color: #FF0000" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tx_Nom" ErrorMessage="Este campo es obligatorio," ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                     <!--   <tr>
                            <td class="auto-style16"><strong>Ingredientes principales:</strong></td>
                            <td class="auto-style20"></td>
                            <td class="auto-style14" colspan="2">
                                <asp:TextBox ID="tx_Ingrediente" runat="server" Width="64%" BorderColor="#FF3300" style="font-weight: 700; color: #FF0000" Height="91px" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tx_Ingrediente" ErrorMessage="Este campo es obligatorio," ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>-->
                        <tr>
                            <td class="auto-style20">&nbsp;</td>
                            <td class="auto-style14">
                                
                                    <asp:DropDownList ID="cbo_EstReg" runat="server" Height="20px" Width="80px" style="font-weight: 700; color: #FF0000">
                                        <asp:ListItem Value="A">Activo</asp:ListItem>
                                        <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                
                            </td>
                        </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style17">
                                    <asp:Button ID="Button1" runat="server" Text="Guardar" Width="130px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="Menu.aspx"><b>REGRESAR</b></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
            </table>
        </section>
    </div>
    
    <script type="text/javascript"> Cufon.now(); </script>
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
    </script>
</asp:Content>

