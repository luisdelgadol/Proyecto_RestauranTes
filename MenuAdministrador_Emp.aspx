<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Emp.aspx.vb" Inherits="_Default" %>

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
        .auto-style6 {height: 527px;width: 768px;}
        .auto-style7 {width: 80px;}
        .auto-style13 {overflow: hidden;text-align: right;color: #0000FF;background-color: #FFFFFF;
        }
        .auto-style14 {
            text-align: left;
            background-color: #FFFFFF;
            margin-left: 80px;
        }
        .auto-style15 {
            overflow: hidden;
            text-align: right;
            color: #0033CC;
            background-color: #FFFFFF;
        }
        .auto-style16 {
            color: #0000FF;
            background-color: #FFFFFF;
            text-align: right;
        }
        .auto-style24 {
            color: #0000FF;
            background-color: #FFFFFF;
            text-align: right;
            height: 38px;
        }
        .auto-style26 {
            background-color: #FFFFFF;
            text-align: left;
            vertical-align: central;
            height: 38px;
        }
        .auto-style27 {
            color: #0000FF;
            background-color: #FFFFFF;
            text-align: center;
            height: 38px;
        }
        .auto-style28 {
            overflow: hidden;
            text-align: right;
            color: #0033CC;
            background-color: #FFFFFF;
            width: 330px;
        }
        .auto-style29 {
            color: #000000;
            background-color: #FFFFFF;
            text-align: right;
            width: 330px;
        }
        .auto-style30 {
            overflow: hidden;
            text-align: right;
            color: #000000;
            background-color: #FFFFFF;
            width: 330px;
        }
        .auto-style31 {
            color: #0000FF;
            background-color: #FFFFFF;
            text-align: right;
            height: 38px;
            width: 330px;
        }
        .auto-style32 {
            color: #0000FF;
            background-color: #FFFFFF;
            text-align: right;
            height: 26px;
        }
        .auto-style33 {
            color: #000000;
            background-color: #FFFFFF;
            text-align: right;
            width: 330px;
            height: 26px;
        }
        .auto-style34 {
            text-align: left;
            background-color: #FFFFFF;
            margin-left: 80px;
            height: 26px;
        }
        .auto-style35 {
            border-width: 1px;
            border-color: #EE6304;
        }
        .auto-style36 {
            color: #000000;
            background-color: #FFFFFF;
            text-align: right;
            height: 38px;
            width: 330px;
        }
        .auto-style37 {
            color: #000000;
        }
        .auto-style38 {
            background-color: #FFFFFF;
            text-align: left;
            vertical-align: central;
        }
        .auto-style39 {
            background-color: #FFFFFF;
            text-align: left;
            vertical-align: central;
            width: 16px;
        }
        .auto-style40 {
            text-align: left;
            background-color: #FFFFFF;
            margin-left: 80px;
            width: 16px;
        }
        .auto-style41 {
            text-align: left;
            background-color: #FFFFFF;
            margin-left: 80px;
            height: 26px;
            width: 16px;
        }
        .auto-style42 {
            background-color: #FFFFFF;
            text-align: left;
            vertical-align: central;
            height: 38px;
            width: 16px;
        }
        .auto-style43 {
            background-color: #EC5C06;
        }
        .auto-style44 {
            background-color: #EC5C05;
        }
        .auto-style45 {
            border-width: 1px;
        }
        .auto-style47 {
            border: 1px solid #000000;
            padding: 0;
        }
        .auto-style48 {
            border: 1px solid #000000;
        }
    </style>
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%If tipoint = 0 Then
            tx_Apell.Visible = True
            cbo_Id.Visible = False
            txt_CI.Enabled = True

        ElseIf tipoint = 1 Then
            tx_Apell.Visible = True
            cbo_Id.Visible = True
            RequiredFieldValidator5.Visible = False
            txt_CI.Visible = False
        Else
            tx_Apell.Visible = False
            cbo_Id.Visible = True
            tx_Nom.Enabled = False
            tx_Email.Enabled = False
            tx_Num1.Enabled = False
            tx_Num2.Enabled = False
            tx_FechIngr.Enabled = False
            tx_FechNac.Enabled = False
            cbo_Ciu.Enabled = False
            cbo_Pais.Enabled = False
            cbo_TipUsurio.Enabled = False
            cbo_EstReg.Enabled = False
            RequiredFieldValidator5.Visible = False
            txt_CI.Visible = False
        End If%>
       
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
                    <td class="auto-style9">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <table class="auto-style6" style="background-position: center center; border: thick ridge #FFFFFF; border-spacing: inherit; background-repeat: repeat;">
                            <tr>
                                <td class="auto-style44" colspan="4"><p style="font-size:30px;width:100%;padding-top:20px;text-align:center;color:#FFFFFF"; class="auto-style43"><% =tipo%></p></td>
                            </tr>
                            <tr>
                                <td class="auto-style15">
                                  
                                
                                </td>
                                <td class="auto-style28">
                                    &nbsp;</td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">
                                    &nbsp;</td>
                                <td class="auto-style30">
                                    <strong>NumeroCI:</strong>
                                </td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:DropDownList ID="cbo_Id" runat="server" Height="20px" Width="140px" style="font-weight: 700; " AutoPostBack="True" CssClass="auto-style48">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txt_CI" runat="server" CssClass="auto-style35" MaxLength="10" Width="140px" BorderColor="Black"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_CI" ErrorMessage="*" ForeColor="#FF3300" ValidationExpression="\d{10}" CssClass="auto-style37"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    &nbsp;</td>
                                <td class="auto-style29">
                                    <strong>Nombres:</strong>
                                </td>
                                <td class="auto-style40">
                                    &nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_Nom" onkeypress="return soloLetras(event);" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tx_Nom" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td class="auto-style30">
                                    <strong>Apellidos:</strong>
                                </td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:TextBox ID="tx_Apell" onkeypress="return soloLetras(event);" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tx_Apell" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    &nbsp;</td>
                                <td class="auto-style29">
                                    <strong>E_mail:</strong>
                                </td>
                                <td class="auto-style40">
                                    &nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_Email" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tx_Email" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tx_Email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="auto-style37"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    &nbsp;</td>
                                <td class="auto-style29">
                                    <strong>Usuario:</strong>
                                </td>
                                <td class="auto-style40">
                                    &nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_User" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tx_Email" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>                                 
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    &nbsp;</td>
                                <td class="auto-style29">
                                    <strong>Contraseña:</strong>
                                </td>
                                <td class="auto-style40">
                                    &nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_Con" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tx_Email" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>                                 
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    &nbsp;</td>
                                <td class="auto-style29">
                                    <strong>Confirmar Contraseña:</strong>
                                </td>
                                <td class="auto-style40">
                                    &nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_ConfCon" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tx_Email" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>                                 
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tx_Con" ControlToValidate="tx_ConfCon" ErrorMessage="Debe ser igual a la contraseña ingresada" ForeColor="#FF3300" CssClass="auto-style37"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style29"><strong>Numero Convencional:</strong></td>
                                <td class="auto-style40">
                                    &nbsp;</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="tx_Num1" onkeypress="return justNumbers(event);" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tx_Num1" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32"></td>
                                <td class="auto-style33"><strong>Numero Celular:</strong></td>
                                <td class="auto-style41">
                                    &nbsp;</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="tx_Num2" onkeypress="return justNumbers(event);" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style29"><strong>Fecha de nacimiento:</strong></td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:TextBox ID="tx_FechNac" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="tx_FechNac_CalendarExtender" runat="server" TargetControlID="tx_FechNac" Format="dd-MM-yyyy"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tx_FechNac" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37" Width="138px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style29"><strong>Estado de registro:</strong></td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:DropDownList ID="cbo_EstReg" runat="server" Height="20px" Width="140px" style="font-weight: 700; " CssClass="auto-style48">
                                        <asp:ListItem Value="A">Activo</asp:ListItem>
                                        <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style29"><strong>Fecha de ingreso:</strong></td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:TextBox ID="tx_FechIngr" runat="server" Width="138px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style45"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="tx_FechIngr_CalendarExtender" runat="server" TargetControlID="tx_FechIngr" Format="dd-MM-yyyy" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tx_FechIngr" ErrorMessage="*" ForeColor="#FF3300" CssClass="auto-style37"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style29"><strong>Pais:</strong></td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:DropDownList ID="cbo_Pais" runat="server" Height="20px" Width="140px" style="font-weight: 700; " AppendDataBoundItems="True" AutoPostBack="True" CssClass="auto-style47">
                                        <asp:ListItem>-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style29"><strong>Cuidad:</strong></td>
                                <td class="auto-style39">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    <asp:DropDownList ID="cbo_Ciu" runat="server" Height="20px" Width="140px" style="font-weight: 700; color: #FF0000" AppendDataBoundItems="True" CssClass="auto-style47">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style36"><strong>Tipo de Usuario:</strong></td>
                                <td class="auto-style42">
                                    &nbsp;</td>
                                <td class="auto-style26">
                                    <asp:DropDownList ID="cbo_TipUsurio" runat="server" Height="20px" Width="140px" ForeColor="#FF3300" style="font-weight: 700; " CssClass="auto-style47">
                                        <asp:ListItem>Administrador</asp:ListItem>
                                        <asp:ListItem>Chef</asp:ListItem>
                                        <asp:ListItem>Mesero</asp:ListItem>
                                        <asp:ListItem>Cliente</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style27" colspan="3">
                                    <asp:Button ID="Button1" runat="server" Text="Guardar" Width="130px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="MenuAdministrador.aspx"><b>REGRESAR</b></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style31">&nbsp;</td>
                                <td class="auto-style42">
                                    &nbsp;</td>
                                <td class="auto-style26">
                                    &nbsp;</td>
                            </tr>
                            </table>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
            </table>
        </section>         
    </div>
    </asp:UpdatePanel>
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