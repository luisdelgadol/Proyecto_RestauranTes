Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Partial Class Contactenos
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbbusA, dtbbusB, dtbbusC, dtbape, dtbins, dtbpla, dtbcat As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public intCodPer As Integer

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim intNumFilIns As Integer = 0

        con = New SqlConnection(CStr(Session("sessStrCon")))
        con.Open()
        strSQL = "SELECT MAX(iDcOMENTARIO) FROM tbm_comentarios"
        sda = New SqlDataAdapter(strSQL, con)
        dtbins = New DataTable
        sda.Fill(dtbins)
        intCodPer = dtbins.Rows(0).Item(0) + 1
        dtbins.Clear()

        strSQL = "INSERT INTO tbm_comentarios(IdComentario, Nombre, Correo, Comentario, Fecha, Estado)"
        strSQL = strSQL & " VALUES("
        strSQL = strSQL & intCodPer
        strSQL = strSQL & ", '" & TextBox2.Text & "'"
        strSQL = strSQL & ", '" & TextBox1.Text & "'"
        strSQL = strSQL & ", '" & TextBox3.Text & "'"
        strSQL = strSQL & ", '" & Today.ToString("yyyy-MM-dd") & "'"
        strSQL = strSQL & ", 'N'"
        strSQL = strSQL & ")"

        sda.InsertCommand = New SqlCommand(strSQL, con)
        intNumFilIns = sda.InsertCommand.ExecuteNonQuery()

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
