Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports DevExpress.Web

Partial Class MenuAdministrador_Menu_Cliente
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

    Public filename As String
    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad

        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("Default.aspx")
        End If
        If Not IsPostBack Then
            cargarCategorias()
            cargargrid()
        End If
    End Sub

    Private Sub cargarCategorias()
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdPlatCat, Nombre"
            strSQL = strSQL & " FROM tbm_Platos_Categoria"
            strSQL = strSQL & " ORDER BY Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbcat = New DataTable
            sda.Fill(dtbcat)
            cboCat.Items.Clear()
            cboCat.Items.Add(New ListItem("TODOS", -1))
            intNumTotReg = dtbcat.Rows.Count
            For i = 0 To intNumTotReg - 1
                cboCat.Items.Add(New ListItem(dtbcat.Rows(i).Item(1), dtbcat.Rows(i).Item(0)))
            Next
            dtbcat.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

    Protected Sub cargargrid()
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "select idPlato, p.Nombre as Plato, Informacion, convert(varchar,Precio), c.Nombre as Categoria, p.Estado as Estado"
            strSQL = strSQL & " FROM tbm_Platos p, tbm_Platos_Categoria c"
            strSQL = strSQL & " where p.IdPlatCat = c.IdPlatCat "
            If cboCat.SelectedIndex > 0 Then
                strSQL = strSQL & " AND  c.IdPlatcat = " & cboCat.SelectedValue
            End If
            If txtDesde.Text <> "" And txtHasta.Text <> "" Then
                strSQL = strSQL & " AND ( precio >= " & txtDesde.Text
                strSQL = strSQL & " AND precio <= " & txtHasta.Text & ")"
            End If
            strSQL = strSQL & " ORDER BY p.Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbcat = New DataTable
            sda.Fill(dtbcat)
            'GridView1.DataSource = dtbcat
            'GridView1.DataBind()


        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click

        cargargrid()

    End Sub


End Class
