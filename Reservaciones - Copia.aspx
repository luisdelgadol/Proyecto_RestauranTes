<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Reservaciones.aspx.vb" Inherits="_Default"  %>

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
        .auto-style6 {height: 25px;
            background-color: #FFFFFF;
        }
        .auto-style11 {height: 25px;width: 426px;
            background-color: #FFFFFF;
        }
        .auto-style14 {
            text-align: left;
            background-color: #FFFFFF;
        }
        .auto-style15 {width: 638px;
            font-weight: 700;
            background-color: #FFFFFF;
        }
        .auto-style18 {
            width: 450px;
            background-color: #FFFFFF;
        }
        .auto-style20 {
            width: 471px;
            color: #000000;
            text-align: right;
            background-color: #FFFFFF;
        }
        .auto-style22 {
            text-align: right;
            font-weight: bold;
            color: #000000;
            width: 7%;
            background-color: #F46F06;
        }
        .auto-style23 {
            text-align: left;
            background-color: #F46F06;
        }
        .auto-style24 {
            color: #000000;
        }
        .auto-style25 {
            width: 638px;
            font-weight: 700;
            color: #000000;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style26 {
            width: 100%;
            border-style: outset;
            margin-left: 0;
            background-color: #F2F2F2;
        }
        .auto-style27 {
            border-style: outset;
        }
        .auto-style28 {
            width: 638px;
            font-weight: 700;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style31 {
            color: #000000;
            width: 7%;
            background-color: #F46F06;
        }
        .auto-style32 {
            height: 25px;
            width: 667px;
            color: #000000;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style33 {
            width: 667px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style34 {
            width: 667px;
            background-color: #FFFFFF;
        }
        .auto-style35 {
            height: 25px;
            width: 447px;
            color: #000000;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style36 {
            width: 447px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style37 {
            width: 447px;
            background-color: #FFFFFF;
        }
        .auto-style38 {
            border-width: 1px;
        }
        .auto-style39 {
            color: #C56617;
            border: 1px solid #000000;
        }
        .auto-style40 {
            color: #C56617;
            border-width: 1px;
        }
     </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
            <div class="row-bot-bg">
                <div class="main">
                	<h2>&nbsp;Reservaciones</h2>
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
        <div class="main">
            <div class="wrapper">
                <table style="color: #0000FF;" class="auto-style26">
                    <tr>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style14">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style20"><strong>CLIENTE: </strong> </td>
                        <td class="auto-style14">
                            <asp:TextBox ID="tx_Cliente" onkeypress="return soloLetras(event);" runat="server" BorderColor="Black" style="font-weight: 700; " Height="16px" Width="313px" CssClass="auto-style39" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20"><strong>MESA:</strong></td>
                        <td class="auto-style14">
                            <asp:DropDownList ID="cbo_mesa" runat="server" Height="18px" Width="107px" style="font-weight: 700; color: #C56617">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20"><strong>FECHA:</strong></td>
                        <td class="auto-style14">
                            <asp:TextBox ID="tx_calen" runat="server" Height="16px" Width="127px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style39"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="tx_calen_CalendarExtender" runat="server" BehaviorID="tx_calen_CalendarExtender" TargetControlID="tx_calen" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20"><strong>MESERO:</strong></td>
                        <td class="auto-style14">
                            <asp:TextBox ID="tx_CodighoMesero" runat="server" Enabled="False" Height="16px" Width="31px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style39"></asp:TextBox>
                            <asp:TextBox ID="tx_NombreMesero" runat="server" Enabled="False" Height="16px" Width="272px" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style39"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style14">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <table style="width:100%;color: #0000FF;background-color: #FFB600;" class="auto-style27">
                    <tr>
                        <td class="auto-style35">&nbsp;</td>
                        <td class="auto-style32"><strong>Nombre de platos y bebidas</strong></td>
                        <td class="auto-style25">Cantidad</td>
                        <td class="auto-style11">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style36">
                            &nbsp;</td>
                        <td class="auto-style33">
                            <asp:DropDownList ID="cbo_PlaBeb" runat="server" Width="214px" Height="21px" style="font-weight: 700; " AppendDataBoundItems="True" AutoPostBack="True" CssClass="auto-style38">
                                <asp:ListItem>---</asp:ListItem>
                            </asp:DropDownList>
                        &nbsp;<span class="auto-style24"><br />
                            <strong>Precio:&nbsp; $</strong></span>
                            <asp:TextBox ID="tx_Precio" runat="server" BorderColor="Black" style="font-weight: 700; " Height="16px" Width="141px" Enabled="False" BorderStyle="Solid" CssClass="auto-style38" ></asp:TextBox>
                            <asp:TextBox ID="tx_Tiempo" runat="server" BorderColor="Black" style="font-weight: 700; " Height="16px" Width="24px" Visible="False" CssClass="auto-style38" ></asp:TextBox>
                        </td>
                        <td class="auto-style28">
                            <asp:TextBox ID="tx_can" onkeypress="return justNumbers(event);" runat="server" Height="16px" Width="97px" style="text-align: center; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tx_can" ErrorMessage="* Campo vacio" Font-Bold="True" Font-Names="Calibri" ForeColor="Red" CssClass="auto-style24"></asp:RequiredFieldValidator>
                            <br class="auto-style24" />
                            <asp:Button ID="bot_Agre" runat="server" Text="AGREGAR" />
                        </td>
                        <td class="auto-style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style37">
                            &nbsp;</td>
                        <td class="auto-style34">
                            &nbsp;</td>
                        <td class="auto-style15">
                            &nbsp;</td>
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
                <table style="width:100%;color: #0000FF;background-color: #FFB600;" class="auto-style27">
                    <tr>
                        <td class="auto-style22">
                                    SUBTOTAL:</td>
                        <td class="auto-style23">
                            <asp:TextBox ID="tx_subtotal" runat="server" Enabled="False" Height="16px" Width="184px" BorderColor="#FF3300" style="font-weight: 700; " CssClass="auto-style40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">                                   

                            IVA:</td>
                        <td class="auto-style23">

                            <asp:TextBox ID="tx_iva" runat="server" Enabled="False" Height="16px" Width="184px" BorderColor="#FF3300" style="font-weight: 700; " CssClass="auto-style40"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">

                            TOTAL:</td>
                        <td class="auto-style23">

                            <asp:TextBox ID="tx_total" runat="server" Enabled="False" Height="16px" Width="184px" BorderColor="#FF3300" style="font-weight: 700; " CssClass="auto-style40"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31">

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

