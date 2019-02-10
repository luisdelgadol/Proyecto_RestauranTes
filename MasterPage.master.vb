
Imports System.Data
Imports System.Data.SqlClient

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public ds As DataSet
    Public dtbA, dtbB As DataTable
    Public strSQL As String
    Public Usuario As String

    Sub MySub()

    End Sub

    Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load
        con = New SqlConnection(CStr(Session("sessStrCon")))
        Usuario = Session("USER").ToString()



    End Sub

    Private Function GetMenuData() As DataTable
        Dim selectCommand As String = "SELECT CategoryId,ParentId,Name FROM Categories"
        Dim dad As SqlDataAdapter = New SqlDataAdapter(selectCommand, con)
        Dim dtblCategories As DataTable = New DataTable()
        dad.Fill(dtblCategories)
        Return dtblCategories
    End Function

End Class

