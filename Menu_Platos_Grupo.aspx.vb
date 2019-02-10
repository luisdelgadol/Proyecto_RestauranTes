Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dtb As DataTable
    Public cate, strSQL As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'Se establece la conexion
        con = New SqlConnection(CStr(Session("sessStrCon")))
        cate = Request.QueryString.GetValues("v2")(0)
        Try
            con.Open()
            'Se trae los datos necesarios de la tabla Platos
            strSQL = "SELECT IdPlato, Nombre, substring(urlImagen,2,100) "
            strSQL = strSQL & "FROM tbm_Platos "
            strSQL = strSQL & "WHERE IdPlatCat = " & Request.QueryString.GetValues("v1")(0)
            sda = New SqlDataAdapter(strSQL, con)
            dtb = New DataTable
            sda.Fill(dtb) 'Se almacenan en el Dtb
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub


    
End Class
