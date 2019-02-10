<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Platos.aspx.vb" Inherits="_Default" %>

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
         .auto-style6 {height: 563px;width: 768px;}
         .auto-style7 {width: 80px;}
         .auto-style10 {width: 100%;overflow: hidden;text-align: center;height: 799px;
         }
         .auto-style12 {width: 780px;
height: 987px;
         }
         .auto-style13 {
             overflow: hidden;
             text-align: right;
             color: #000000;
             background-color: #FFFFFF;
             width: 950px;
         }
         .auto-style14 {
             text-align: left;
        background-color: #FFFFFF;
             margin-left: 40px;
             width: 5px;
         }
     .auto-style16 {
             color: #000000;
             background-color: #FFFFFF;
             text-align: right;
             width: 950px;
         }
         .auto-style22 {
             color: #000000;
             background-color: #FFFFFF;
             text-align: right;
             height: 114px;
             width: 950px;
         }
         .auto-style24 {
             text-align: left;
             background-color: #FFFFFF;
             margin-left: 40px;
             height: 114px;
         }
         
            .modalBackground
            {
            background-color: black;
            filter: alpha(opacity=90);
            opacity:0.8;

            }

            .modalPopup
            {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
            }
         .auto-style27 {
             text-align: left;
             background-color: #FFFFFF;
             margin-left: 40px;
             width: 517px;
         }
         .auto-style29 {
             width: 80px;
             height: 28px;
         }
         .auto-style30 {
             height: 28px;
         }
         .auto-style32 {
             width: 912px;
             font-size: 13px;
             line-height: 25px;
             height: 797px;
             margin: 0 auto;
             padding: 0;
         }
         .auto-style33 {
             background-color: #FFFFFF;
             width: 950px;
         }
         .auto-style34 {
             margin-top: 20;
         }
         .auto-style35 {
             background-color: #FFFFFF;
             text-align: left;
         }
         .auto-style36 {
             text-align: left;
             background-color: #FFFFFF;
             margin-left: 40px;
         }
         .auto-style37 {
             background-color: #E95704;
         }
         .auto-style38 {
             background-color: #EE6105;
         }
         .auto-style40 {
             background-color: #FFFFFF;
             text-align: left;
             width: 71px;
         }
         .auto-style41 {
             text-align: left;
             background-color: #FFFFFF;
             margin-left: 40px;
             width: 71px;
         }
         .auto-style42 {
             text-align: left;
             background-color: #FFFFFF;
             margin-left: 40px;
             height: 114px;
             width: 71px;
         }
         .auto-style43 {
             color: #FF0000;
             border-width: 1px;
         }
         .auto-style44 {
             color: #FF0000;
             border: 1px solid #000000;
         }
         .auto-style45 {
             border-style: solid;
             border-width: 1px;
         }
     </style>

   


     </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <%If tipoint = 0 Then

                    tx_Nom.Visible = True
                    cbo_Nombre_Plato.Visible = False
                    AsyncFileUpload1.Visible = True
                ElseIf tipoint = 1 Then

                    tx_Nom.Visible = False
                    cbo_Nombre_Plato.Visible = True
                    AsyncFileUpload1.Visible = True
                Else

                    cbo_Categoria.Enabled = True
                    tx_Nom.Visible = False
                    cbo_Nombre_Plato.Visible = True
                    tx_Precio.Enabled = False
                    tx_Tiempo.Enabled = False
                    tx_Información.Enabled = False
                    btn_Imagen.Visible = False
                    AsyncFileUpload1.Visible = False
                End If%>
       
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu Administrador</h2>
                </div>
            </div>
        </div>
            

            <section id="content"><div class="ic"></div>
        <div class="auto-style32">
            <div class="auto-style10">
            <table class="auto-style12">
            <tr>
                <td class="auto-style29"></td>
                <td class="auto-style30">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style9">
                    <table class="auto-style6" style="background-position: center center; border: thick ridge #FFFFFF; background-image: url('images/degradado.png'); border-spacing: inherit; background-repeat: repeat;">
                         <tr>
                                <td class="auto-style38" colspan="4"><p style="font-size:30px;width:100%;padding-top:20px;text-align:center;color:#FFFFFF"; class="auto-style37"><% =tipo%></p></td>
                            </tr>
                        <tr>
                            <td class="auto-style13">
                                &nbsp;</td>
                            <td class="auto-style40">
                                &nbsp;</td>
                            <td class="auto-style35" colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style13">
                                <strong>Categoria:</strong></td>
                            <td class="auto-style40">
                                &nbsp;</td>
                            <td class="auto-style35" colspan="2">
                                <asp:DropDownList ID="cbo_Categoria" runat="server" Height="20px" Width="30.5%" style="font-weight: 700; " AppendDataBoundItems="True" AutoPostBack="True" CssClass="auto-style44">
                                    <asp:ListItem>-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Nombre Plato:</strong></td>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style36" colspan="2">
                                <asp:TextBox ID="tx_Nom" runat="server" Width="30%" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style43"></asp:TextBox>
                                <asp:DropDownList ID="cbo_Nombre_Plato" runat="server" Height="20px" Width="30%" style="font-weight: 700; color: #FF0000" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cbo_Nombre_Plato" ErrorMessage="Este campo es obligatorio," ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13"><strong>Tiempo Estimado:</strong></td>
                            <td class="auto-style40">
                                &nbsp;</td>
                            <td class="auto-style35" colspan="2">
                                <asp:TextBox ID="tx_Tiempo" runat="server" Width="30%" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style43"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tx_Tiempo" ErrorMessage="Este campo es obligatorio," ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Precio:</strong></td>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style36" colspan="2">
                                <asp:TextBox ID="tx_Precio" runat="server" Width="30%" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style43"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tx_Precio" ErrorMessage="Este campo es obligatorio," ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Estado:</strong></td>
                            <td class="auto-style41">
                                
                                    &nbsp;</td>
                            <td class="auto-style36" colspan="2">
                                
                                    <asp:DropDownList ID="cbo_EstReg" runat="server" Height="20px" Width="80px" style="font-weight: 700; color: #FF0000">
                                        <asp:ListItem Value="A">Activo</asp:ListItem>
                                        <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style22"><strong>Ingredientes:</strong></td>
                            <td class="auto-style42">
                                &nbsp;</td>
                            <td class="auto-style24" colspan="2">
                                <asp:TextBox ID="tx_Información" runat="server" Width="64%" BorderColor="Black" style="font-weight: 700; " Height="91px" TextMode="MultiLine" CssClass="auto-style43"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tx_Información" ErrorMessage="Este campo es obligatorio," ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Imagen:</strong></td>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style27">
                                <asp:Image ID="Image1" runat="server" width="250px" Height ="250px" CssClass="auto-style45"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" runat="server" 
                                    Height="31px" Width="401px" CssClass="auto-style34" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style33">&nbsp;</td>
                            <td class="auto-style40">
                                &nbsp;</td>
                            <td class="auto-style35" colspan="2">
                                <asp:Button ID="Button1" runat="server" Text="Guardar" Width="130px" Height="29px" />
                                <asp:Button ID="btn_Imagen" runat="server" Height="26px" Text="Agregar Imagen" Width="111px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="MenuAdministrador.aspx"><b>REGRESAR</b></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style33">&nbsp;</td>
                            <td class="auto-style40">
                                &nbsp;</td>
                            <td class="auto-style35" colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
            	
                    </div>

                


                


                 
            </div>   
            
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

