Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class MenuAdministrador_Menu_Cliente_Detalle
    Inherits System.Web.UI.Page

    Public titulo As String
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbcat As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public tipoint As Integer       '0:INGRESO, 1:MODIFICACION, 2:ELIMINACION
    Public tipo As String           'TITULO DE LA PAGINA GENERADA POR EL tipoint
    Public idch As Integer
    Public intidper As Integer      'GUARDA ID PERSONA PARA MODIFICACIONES Y ELIMINACIONES
    Public categoria As String
    Public plato As String
    Public filename As String
    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        categoria = Request.QueryString.GetValues("cat")(0)
        plato = Request.QueryString.GetValues("pla")(0)
        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub

   

    


End Class
