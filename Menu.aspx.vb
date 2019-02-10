Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public ds As DataSet
    Public dtbA As DataTable
    Public strSQL As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        Else
            con = New SqlConnection(CStr(Session("sessStrCon")))

            Try
                con.Open()
                strSQL = "SP_MENU '" & CStr(Session("LOGIN")) & "'"
                sda = New SqlDataAdapter(strSQL, con)
                ds = New DataSet
                dtbA = New DataTable
                sda.Fill(ds)
                dtbA = ds.Tables(0)
                For Each drMenuItem As Data.DataRow In dtbA.Rows
                    'esta condicion indica q son elementos padre.
                    If drMenuItem("id_menu_option").Equals(drMenuItem("id_parent_menu_option")) Then
                        Dim mnuMenuItem As New MenuItem
                        mnuMenuItem.Value = drMenuItem("id_menu_option").ToString
                        mnuMenuItem.Text = drMenuItem("description").ToString
                        mnuMenuItem.NavigateUrl = drMenuItem("url").ToString
                        'agregamos el Item al menu
                        Menu.Items.Add(mnuMenuItem)
                        'hacemos un llamado al metodo recursivo encargado de generar el arbol del menu.
                        AddMenuItem(mnuMenuItem, dtbA)
                    End If
                Next
                con.Close()
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
        End If

    End Sub

    Private Sub AddMenuItem(ByRef mnuMenuItem As MenuItem, ByVal dtMenuItems As Data.DataTable)
        'recorremos cada elemento del datatable para poder determinar cuales son elementos hijos
        'del menuitem dado pasado como parametro ByRef.
        For Each drMenuItem As Data.DataRow In dtMenuItems.Rows
            If drMenuItem("id_parent_menu_option").ToString.Equals(mnuMenuItem.Value) AndAlso _
            Not drMenuItem("id_menu_option").Equals(drMenuItem("id_parent_menu_option")) Then
                Dim mnuNewMenuItem As New MenuItem

                mnuNewMenuItem.Value = drMenuItem("id_menu_option").ToString
                mnuNewMenuItem.Text = drMenuItem("description").ToString
                'mnuNewMenuItem.ImageUrl = drMenuItem("Icono").ToString
                mnuNewMenuItem.NavigateUrl = drMenuItem("url").ToString
                'Agregamos el Nuevo MenuItem al MenuItem que viene de un nivel superior.
                mnuMenuItem.ChildItems.Add(mnuNewMenuItem)
                'llamada recursiva para ver si el nuevo menu item aun tiene elementos hijos.
                AddMenuItem(mnuNewMenuItem, dtMenuItems)
            End If
        Next
    End Sub

End Class
