<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MenuCocina.aspx.vb" Inherits="_Default" %>

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

   


     </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
            <div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu Chef</h2>
                </div>
            </div>  </div>
        </div>
        <section id="content"><div class="ic"></div>
            <table class="auto-style2">
                <tr>
                    <td>
                        <p>
       <%--<%-- <%
           <%-- Dim intNumTotReg As Integer, i As Integer
            intNumTotReg = dtb.Rows.Count
            If intNumTotReg = 0 Then
                Response.Write("<BR>No se encontró ningún registro.")
            Else
                Response.Write("<table border='1'>")
                Response.Write("<tr>")
                Response.Write("<td><b>Código</b></td>")
                Response.Write("<td><b>Tiempo</b></td>")
                Response.Write("<td><b>Hora/Arranque</b></td>")
                Response.Write("<td><b>Hora/Final</b></td>")
                Response.Write("<td><b>Estado</b></td>")
                Response.Write("<td><b>Id/Chef</b></td>")
                Response.Write("<td><b>Hora</b></td>")
                Response.Write("</tr>")
                For i = 0 To intNumTotReg - 1
                    Response.Write("<tr>")
                    Response.Write("<td>" & dtb.Rows(i).Item("idordendetalle") & "</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("tiempo") & "</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("horaarranque") & "</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("horafinal") & "</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("estado") & "</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("idchef") & "</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("horarealfin") & "</td>")
                    Response.Write("</tr>")
                Next
                Response.Write("</table>")
            End If
            con.Close()
    %>--%>--
    </p>
                    </td>
                </tr>
            </table>
            <style type="text/css">
    .CenteredGrid { width:640px; margin-left:auto; margin-right:auto; }
                .auto-style2 {
                    width: 100%;
                }
    </style>

                </asp:Content>

