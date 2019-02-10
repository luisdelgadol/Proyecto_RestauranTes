<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MenuMesero.aspx.vb" Inherits="_Default"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
        .auto-style6 {height: 25px;}
        .auto-style11 {height: 25px;width: 426px;}
        .auto-style14 {text-align: left;}
        .auto-style15 {width: 242px;
            font-weight: 700;
        }
        .auto-style16 {width: 304px;}
        .auto-style18 {width: 450px;}
        .auto-style20 {
            width: 137px;
            color: #000000;
        }
        .auto-style21 {height: 25px;width: 304px;
            color: #000000;
        }
        .auto-style22 {
            text-align: right;
            font-weight: bold;
            color: #000000;
            background-color: #F56D07;
        }
        .auto-style23 {
            text-align: right;
            background-color: #F56D07;
        }
        .auto-style24 {
            border: 3px inset #000000;
            background-color: #FFFFFF;
        }
        .auto-style25 {
            border: 3px outset #000000;
            background-color: #FFFFFF;
        }
        .auto-style26 {
            border-left-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
        }
        .auto-style27 {
            text-align: right;
            font-weight: bold;
            width: 85%;
            color: #000000;
            background-color: #F56D07;
        }
        .auto-style28 {
            background-color: #F56D07;
        }
        .auto-style29 {
            height: 25px;
            width: 471px;
        }
        .auto-style30 {
            width: 471px;
        }
        .auto-style31 {
            color: #000000;
        }
        .auto-style32 {
            border-color: #000000;
            border-width: 1px;
        }
        .auto-style33 {
            width: 364px;
        }
        .auto-style34 {
            width: 242px;
            font-weight: 700;
            color: #000000;
        }
     </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
            <div class="row-bot-bg">
                <div class="main">
                	<h2>&nbsp;Menu Mesero</h2>
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
        <div class="main">
            <div class="wrapper">
                <table style="width:100%;color: #0000FF;" class="auto-style24">
                    <tr>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style20"><strong>CLIENTE: </strong> </td>
                        <td class="auto-style14">
                            <%-- NUEVO --%>
                            <asp:TextBox ID="tx_Cliente" onkeypress="return soloLetras(event);" runat="server" BorderColor="Black" style="font-weight: 700; color: #FF0000" Height="16px" Width="313px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style20"><strong>MESA:</strong></td>
                        <td class="auto-style14">
                            <asp:DropDownList ID="cbo_mesa" runat="server" Height="18px" Width="107px" style="font-weight: 700; color: #FF0000">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style20"><strong>FECHA:</strong></td>
                        <td class="auto-style14">
                            <asp:TextBox ID="tx_calen" runat="server" Height="16px" Width="127px" BorderColor="Black" style="font-weight: 700; color: #FF0000"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="tx_calen_CalendarExtender" runat="server" BehaviorID="tx_calen_CalendarExtender" TargetControlID="tx_calen" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style20"><strong>MESERO:</strong></td>
                        <td class="auto-style14">
                            <asp:TextBox ID="tx_CodighoMesero" runat="server" Enabled="False" Height="16px" Width="31px" BorderColor="Black" style="font-weight: 700; color: #FF0000"></asp:TextBox>
                            <asp:TextBox ID="tx_NombreMesero" runat="server" Enabled="False" Height="16px" Width="272px" BorderColor="Black" style="font-weight: 700; color: #FF0000"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="width:100%;color: #0000FF;" class="auto-style25">
                    <tr>
                        <td class="auto-style29">&nbsp;</td>
                        <td class="auto-style21"><strong>Nombre de platos y bebidas</strong></td>
                        <td class="auto-style34">Cantidad</td>
                        <td class="auto-style11">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style30">
                            &nbsp;</td>
                        <td class="auto-style16">
                            <asp:DropDownList ID="cbo_PlaBeb" runat="server" Width="214px" Height="21px" style="font-weight: 700; " AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem>---</asp:ListItem>
                            </asp:DropDownList>
                        &nbsp;<span class="auto-style31"><br />
                            <strong>Precio:&nbsp; $</strong></span>
                            <asp:TextBox ID="tx_Precio" runat="server" BorderColor="Black" style="font-weight: 700; " Height="16px" Width="141px" Enabled="False" CssClass="auto-style32" ></asp:TextBox>
                            <asp:TextBox ID="tx_Tiempo" runat="server" BorderColor="Black" style="font-weight: 700; " Height="16px" Width="24px" Visible="False" CssClass="auto-style32" ></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <span class="auto-style31">
                            <%-- NUEVO --%>
                            </span>
                            <asp:TextBox ID="tx_can" onkeypress="return justNumbers(event);" runat="server" Height="16px" Width="97px" style="text-align: center; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tx_can" ErrorMessage="* Campo vacio" Font-Bold="True" Font-Names="Calibri" ForeColor="Red" CssClass="auto-style31"></asp:RequiredFieldValidator>
                            <br class="auto-style31" />
                            <asp:Button ID="bot_Agre" runat="server" Text="AGREGAR" />
                        </td>
                        <td class="auto-style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style30">
                            &nbsp;</td>
                        <td class="auto-style16">
                            <span class="auto-style31"></td>
                        <td class="auto-style15">
                            </span></td>
                        <td class="auto-style18">
                                    &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style6" colspan="4">
                            
                            <asp:UpdatePanel ID="UpdatePnl2" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%">
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                        </td>
                    </tr>
                </table>
                <table style="width:100%;color: #0000FF;background-color: #CCFFFF;" class="auto-style26">
                    <tr>
                        <td class="auto-style27">
                                    SUBTOTAL:</td>
                        <td class="auto-style23">
                            <asp:TextBox ID="tx_subtotal" runat="server" Enabled="False" Height="16px" Width="184px" BorderColor="#FF3300" style="font-weight: 700; color: #FF0000"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">                                   

                            IVA:</td>
                        <td class="auto-style23">

                            <asp:TextBox ID="tx_iva" runat="server" Enabled="False" Height="16px" Width="184px" BorderColor="#FF3300" style="font-weight: 700; color: #FF0000"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">

                            TOTAL:</td>
                        <td class="auto-style23">

                            <asp:TextBox ID="tx_total" runat="server" Enabled="False" Height="16px" Width="184px" BorderColor="#FF3300" style="font-weight: 700; color: #FF0000"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">

                            &nbsp;</td>
                        <td class="auto-style23">

                                    <asp:Button ID="btnEnvio" runat="server" Text="Enviar Pedido" Width="119px" Height="28px" />

                        </td>
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

