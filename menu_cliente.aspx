<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="menu_cliente.aspx.vb" Inherits="menu_cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
    .auto-style3
    {
        width: 100%;
            height: 483px;
        }
        .auto-style6
        {
            height: 18px;
        }
        .auto-style8
        {
            height: 12px;
        }
        .auto-style11
        {
            height: 27px;
        }
        .auto-style14
        {
            text-align: right;
            height: 20px;
            width: 573px;
        }
        .auto-style15
        {
            height: 20px;
        }
        .auto-style16
        {
            text-align: right;
            height: 18px;
            width: 573px;
        }
        .auto-style18 {
            text-align: right;
            height: 27px;
            width: 573px;
        }
        .auto-style19 {
            text-align: right;
            width: 573px;
        }
        .auto-style47 {
            border: 1px solid #A0A0A0;
            padding: 0;
            margin-left: 0px;
        }
        .auto-style48 {
            width: 100%;
            overflow: hidden;
            height: 485px;
        }
        .auto-style49 {
            text-align: right;
            height: 17px;
            width: 573px;
        }
        .auto-style50 {
            height: 17px;
        }
        .auto-style51 {
            text-align: right;
            height: 2px;
            width: 573px;
        }
        .auto-style52 {
            height: 2px;
        }
        .auto-style53 {
            margin-left: 12px;
        }
        .auto-style54 {
            border-width: 1px;
            margin-left: 8px;
        }
        .auto-style55 {
            text-align: right;
            width: 573px;
            height: 23px;
        }
        .auto-style56 {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                        <h2>Editar Perfil-<asp:Label ID="lblUsu" runat="server" Text="Label"></asp:Label></h2>
                    </div>
                </div>
                <br />
            </div>
            <section id="content"><div class="ic"></div>
            <div class="auto-style48">
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style19" aria-orientation="horizontal" aria-pressed="undefined">&nbsp;</td>
                        <td class="auto-style8">
                            <asp:Label ID="lblMensjaes" runat="server"></asp:Label>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19" aria-orientation="horizontal" aria-pressed="undefined">* Cedula</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="TxtCedula" runat="server" Height="20px" style="margin-left: 8px" Width="254px" MaxLength="10" Enabled="False"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="TxtCedula_FilteredTextBoxExtender" runat="server" FilterInterval="10" FilterType="Numbers" TargetControlID="TxtCedula" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCedula" ErrorMessage="Datos incorrectos">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19" aria-orientation="horizontal" aria-pressed="undefined">*Nombres</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="TxtNomClie" runat="server" Height="20px" style="margin-left: 8px" Width="254px"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="TxtNomClie_FilteredTextBoxExtender" runat="server" FilterType="UppercaseLetters, LowercaseLetters" TargetControlID="TxtNomClie" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNomClie" ErrorMessage="Datos incorrectos">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style55">Apellidos</td>
                        <td class="auto-style56">
                            <asp:TextBox ID="TxtApeClie" runat="server" style="margin-left: 8px" Width="253px" Height="20px"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="TxtApeClie_FilteredTextBoxExtender" runat="server" TargetControlID="TxtApeClie" FilterType="UppercaseLetters, LowercaseLetters" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtApeClie" ErrorMessage="Datos incorrectos">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14">Fecha Nacimiento</td>
                        <td class="auto-style15">
                            <asp:TextBox ID="TxtFechaNac" runat="server" style="margin-left: 8px" Width="253px" Height="20px" ></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="TxtFechaNac_CalendarExtender" runat="server" BehaviorID="TxtFechaNac_CalendarExtender" TargetControlID="TxtFechaNac" />
                            DD/MM/YYYY</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">*Correo</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TxtCorreo" runat="server" style="margin-left: 8px"  Width="253px" Height="20px" TextMode="Email"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Error: No es un correo Valido.." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TxtCorreo">*</asp:RegularExpressionValidator>
                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">Numero Celular</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtCelular" runat="server" style="margin-left: 8px"  Width="253px" Height="20px"  MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCelular" ErrorMessage="Datos incorrectos">*</asp:RequiredFieldValidator>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterInterval="12" FilterType="Numbers" TargetControlID="TxtTelf" />
                      
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">Numero Telefono</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TxtTelf" runat="server" style="margin-left: 8px" Width="253px" MaxLength="9" Height="20px" ></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="TxtTelf_FilteredTextBoxExtender" runat="server" FilterInterval="12" FilterType="Numbers" TargetControlID="TxtTelf" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">Pais</td>
                        <td class="auto-style6">
                            &nbsp;
                                    <asp:DropDownList ID="cbo_Pais" runat="server" Width="257px" style="font-weight: 700; " AppendDataBoundItems="True" AutoPostBack="False" CssClass="auto-style47" Height="20px" Enabled="False">
                                        <asp:ListItem>-</asp:ListItem>
                                    </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style51">* Ciudad</td>
                        <td class="auto-style52">
                            <asp:DropDownList ID="cbo_Ciu" runat="server" Width="257px" AppendDataBoundItems="True" CssClass="auto-style54" Height="20px"  OnSelectedIndexChanged="cbo_Ciu_SelectedIndexChanged" Enabled="True" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <%--<tr>--%>
                        <%--<td class="auto-style49">*User</td>
                        <td class="auto-style50">
                            <asp:TextBox ID="TxtUser" runat="server" style="margin-left: 8px"  Width="253px" Height="20px"></asp:TextBox>--%>
                      <%--      <ajaxToolkit:FilteredTextBoxExtender ID="TxtUser_FilteredTextBoxExtender" runat="server" validChars="UppercaseLetters, LowercaseLetters" TargetControlID="TxtUser" />
                        --%>    
                       <%-- </td>--%>
                    <%--</tr>--%>
                    <%--<tr>
                        <td class="auto-style14">*Clave</td>
                        <td class="auto-style15">
                            <asp:TextBox ID="TxtClave" runat="server" style="margin-left: 8px" Width="253px" TextMode="Password" Height="20px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtClave" ErrorMessage="Datos incorrectos">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="auto-style18"></td>
                        <td class="auto-style11">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Btn_ModiCliente" runat="server" Text="Modificar" Height="37px" Width="93px" />
                            <%--&nbsp;<asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" CssClass="auto-style53" Height="37px" Width="81px" />--%>
                        </td>
                    </tr>
                    </table>   
            </div>
            </section>
   <%-- <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
    <Items>
        <asp:MenuItem Text="Menú">
            <asp:MenuItem Text="Mi perfil" />--%>
            <%--<asp:MenuItem Text="Pedidos" />
            <asp:MenuItem Text="Create" />
            <asp:MenuItem Text="Delete" />
        </asp:MenuItem>
        <asp:MenuItem Text="HoursOfBusiness">
            <asp:MenuItem Text="Overview" />
            <asp:MenuItem Text="Edit" />
            <asp:MenuItem Text="Create" />
            <asp:MenuItem Text="Delete" />--%>
       <%-- </asp:MenuItem>
    </Items>
</asp:Menu>--%>
</asp:Content>

