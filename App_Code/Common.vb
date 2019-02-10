Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Common

    
    Public Shared Function consultaParametro(parNemonico As String, StringConexion As String) As String
        Dim con As SqlConnection
        Dim sda As SqlDataAdapter
        Dim strSQL As String         'TEXTO DE SENTENCIAS SQL
        Dim dtbpla As DataTable
        Dim retorno As String = "", i As Integer
        Try
            con = New SqlConnection(StringConexion)
            con.Open()
            strSQL = "SELECT valor"
            strSQL = strSQL & " FROM tbm_Parametro"

            strSQL = strSQL & " WHERE nemonico = '" & parNemonico & "'"
            sda = New SqlDataAdapter(strSQL, con)
            dtbpla = New DataTable
            sda.Fill(dtbpla)

            retorno = dtbpla.Rows(i).Item(0)
            dtbpla.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
        Return retorno
    End Function
End Class
