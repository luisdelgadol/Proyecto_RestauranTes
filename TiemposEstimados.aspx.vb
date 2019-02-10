Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Globalization

Partial Class TiemposEstimados
    Inherits System.Web.UI.Page

    Public con As SqlConnection
    Public sda, sdab As SqlDataAdapter
    Public dtb, dtborden, dtbtrans, dtba, dtbins, dtbinsb, dtbp, dtbtt As DataTable
    Public strSQL As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        cargargrid()
    End Sub

    Public Sub cargargrid()
        con = New SqlConnection(CStr(Session("sessStrCon")))
        Try
            con.Open()
            strSQL = "SELECT T.horaarranque as Comienza, T.horafinal as Acaba, T.Estado as Estado, IdChef as Chef"
            strSQL = strSQL & "FROM tbm_Transicion "
            strSQL = strSQL & "WHERE Estado = 'C' and Idchef <> 0"
            sda = New SqlDataAdapter(strSQL, con)
            dtb = New DataTable
            sda.Fill(dtb) 'Se almacenan en el Dtb

            GridView1.DataSource = dtb
            GridView1.DataBind()

            dtb.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub
End Class
