Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dtb, dtbcat As DataTable
    Public sda1 As SqlDataAdapter
    Public dtb1 As DataTable
    Public strSQL1 As String
    Public strSQL As String

    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad

        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("Default.aspx")
        Else

        End If
    End Sub

    Protected Sub cargargrid()
        Try
            Dim x As Integer
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT "
            strSQL = strSQL & " FROM tbm_transicion t"
            'strSQL = strSQL & " INNER JOIN tbm_Order_Detalle o ON t.idordendetalle=o.IdOrDet"
            'strSQL = strSQL & " INNER JOIN tbm_Platos p ON o.IdPlato=p.IdPlato"
            'strSQL = strSQL & " INNER JOIN tbm_Platos p ON o.IdPlato=p.IdPlato"
            strSQL = strSQL & " WHERE estado = 'C'"
            sda = New SqlDataAdapter(strSQL, con)
            dtb = New DataTable
            sda.Fill(dtb)
            x = dtb.Rows.Count
            MsgBox(x)

        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

End Class
