Imports System.Data
Imports System.Data.SqlClient

Partial Class Menu_Individual
    Inherits System.Web.UI.Page

    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dtb As DataTable
    Public cate, strSQL As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        cate = Request.QueryString.GetValues("v2")(0)
        If Not IsPostBack Then

        End If
    End Sub

End Class
