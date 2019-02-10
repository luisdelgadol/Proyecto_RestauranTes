<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Menu_Platos_Grupo.aspx.vb" Inherits="_Default" %>

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
        .auto-style1 {width: 100%;}
        .auto-style2 {height: 25px;}
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu de Cocina</h2>                   
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
                
        <div class="main">
            <div class="wrapper">
                    <%
                        Response.Write("<table class='auto-style1' >")
                        Dim tot, cont As Integer
                        Dim codif, codifB As String
                        tot = dtb.Rows.Count
                        cont = 1
                        codif = ""
                        codifB = ""
                        For i = 0 To tot - 1
                            If cont = 1 Then
                                codif = codif & "<td class='centered' width='2%' >&nbsp;</td>"
                                codifB = codifB & "<td class='centered' width='2%' '>&nbsp;</td>"
                            End If
                            codif = codif & "<td class='centered' width='32%' ><img alt='" & dtb.Rows(i).Item(1) & "' src='" & dtb.Rows(i).Item(2) & "' width='300' height='300'></td>"
                            codifB = codifB & "<td class='centered' width='32%' Style='Font-size: large'>" & dtb.Rows(i).Item(1) & "</a></td>"
                            If cont = 3 Then
                                codif = codif & "<td class='centered' width='2%' >&nbsp;</td>"
                                codifB = codifB & "<td class='centered' width='2%' >&nbsp;</td>"
                            End If
                            If cont < 3 And i < tot - 1 Then
                                cont = cont + 1
                            Else
                                codif = "<tr>" & codif & "</tr>"
                                codifB = "<tr>" & codifB & "</tr>"
                                Response.Write(codif)
                                Response.Write(codifB)
                                codif = ""
                                codifB = ""
                                cont = 1
                            End If
                        Next
                        Response.Write("</table>")
                        con.Close()
                        %>
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

