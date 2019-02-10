<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Menu_Individual.aspx.vb" Inherits="Menu_Individual" %>

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
        .centered {text-align:center}
        
        .auto-style1 {
            width: 66%;
        }
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
            <div class="row-bot-bg">
                <div class="main2">
                    <h2>&nbsp;Menu de <%=cate%></h2>                   
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
            <div class="main2">
                <div class="wrapper">
                    <table>
                        <tr>
                            <td style="width:40%; border:solid">
                                <asp:Image ID="Image1" runat="server" style="width:300px; height:300px"/>

                            </td>
                            <td style="border-style: solid; border-color: inherit; border-width: medium;" class="auto-style1">              
                                <asp:TextBox ID="tx_Precio" runat="server" Width="100%" BorderColor="#FF3300" style="font-weight: 700; color: #FF0000" ></asp:TextBox>
                                <asp:TextBox ID="tx_Información" runat="server" Width="100%" BorderColor="#FF3300" style="font-weight: 700; color: #FF0000" Height="268px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
    </div>

</asp:Content>



