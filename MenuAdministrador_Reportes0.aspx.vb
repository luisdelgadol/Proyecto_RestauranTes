Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class MenuAdministrador_Reportes0
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


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.PreLoad

        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("Default.aspx")
        End If

        cargarchef()

    End Sub

    Protected Sub cargarchef()
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()

            strSQL = "select e.idPersona, p.nombres, p.Apellidos "
            strSQL = strSQL & " from tbm_Empleados as e, tbm_Personas as p"
            strSQL = strSQL & " where e.IdPersona=p.IdPersona and e.tipo='Chef'"
            sda = New SqlDataAdapter(strSQL, con)
            dtbcat = New DataTable
            sda.Fill(dtbcat)

        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try

        cboChef.Items.Clear()
        For i = 0 To dtbcat.Rows.Count - 1
            cboChef.Items.Add(New ListItem(dtbcat.Rows(i).Item(1) & " " & dtbcat.Rows(i).Item(2), dtbcat.Rows(i).Item(0)))
        Next

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click

    End Sub

    Protected Sub cboTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboTipo.SelectedIndexChanged
        If cboTipo.SelectedValue = "Diario" Then

        ElseIf cboTipo.SelectedValue = "Mensual" Then

        Else

        End If

    End Sub
End Class
