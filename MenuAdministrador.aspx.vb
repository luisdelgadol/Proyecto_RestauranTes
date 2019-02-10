
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class _Default
    Inherits System.Web.UI.Page

    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public ds As DataSet
    Public dtbA, dtbB As DataTable
    Public strSQL As String
    Public Usuario As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'VALIDAR INICIO DE SESION

        If Not Me.IsPostBack Then
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Dim dtusu As DataTable = ObtenerUsuario()
            lblUsuario.Text = dtusu.Rows(0)(0).ToString()
            Usuario = Session("USER").ToString()
            Dim dt As DataTable = GetData(0)
            PopulateMenu(dt, 0, Nothing)
        End If
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        End If


        'PopulateMenu()

    End Sub
    Public Function ObtenerUsuario() As DataTable
        Dim Usuario As String = Session("USER").ToString()
        Dim query As String = "select r.description from tbm_Personas as p inner join tbm_Rol as r on p.id_rol = r.idRol where p.IdPersona = @Usuario "
        'Dim constr As String = con

        Using conn As SqlConnection = New SqlConnection(con.ConnectionString)
            Dim dt As DataTable = New DataTable()

            Using cmd As SqlCommand = New SqlCommand(query)

                Using sda As SqlDataAdapter = New SqlDataAdapter()
                    cmd.Parameters.AddWithValue("@Usuario", Usuario)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = conn
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using
            Return dt
        End Using

    End Function
    'Private Sub PopulateMenu()
    '    Dim menuData As DataTable = GetMenuData()
    '    AddTopMenuItems(menuData)
    'End Sub
    'Private Function GetMenuData() As DataTable
    '    Dim selectCommand As String = "select opciones.*, categorias.categoria as nom_cat from [dbo].[tbm_Personas] personas inner join [dbo].[tbm_Permisos_opciones] pOpciones on personas.id_rol = pOpciones.id_rol inner join [dbo].[tbm_Opciones] opciones on pOpciones.id_opcion = opciones.id_opcion inner join [dbo].[tbm_Categorias] categorias on opciones.categoria = categorias.id_categoria where personas.IdPersona = '" + Usuario + "'"
    '    Dim dad As SqlDataAdapter = New SqlDataAdapter(selectCommand, con)
    '    Dim dtblCategories As DataTable = New DataTable()
    '    dad.Fill(dtblCategories)
    '    Return dtblCategories
    'End Function
    'Metodo que carga el menu dependiendo del usuario que ingrese desde la base de datos
    Private Sub AddTopMenuItems(ByVal menuData As DataTable)
        Dim view As DataView = New DataView(menuData)
        'view.RowFilter = "id_opcion IS NULL"

        For Each row As DataRowView In view
            Dim newMenuItem As MenuItem = New MenuItem(row("nom_cat").ToString(), row("categoria").ToString())
            Menu1.Items.Add(newMenuItem)
            AddChildMenuItems(menuData, newMenuItem)
        Next
    End Sub
    'Metodo que carga el submenu de cada pestana en el caso del administrado
    Private Sub AddChildMenuItems(ByVal menuData As DataTable, ByVal parentMenuItem As MenuItem)
        Dim view As DataView = New DataView(menuData)
        view.RowFilter = "categoria=" & parentMenuItem.Value

        For Each row As DataRowView In view
            Dim newMenuItem As MenuItem = New MenuItem(row("descripcion").ToString(), row("id_opcion").ToString())
            parentMenuItem.ChildItems.Add(newMenuItem)
            AddChildMenuItems(menuData, newMenuItem)
        Next
    End Sub

    'Private Function GetData(parentMenuId As Integer) As DataTable
    '    Dim selectCommand As String = "select personas.IdPersona, pOpciones.* from [dbo].[tbm_Personas] personas inner join [dbo].[tbm_Menus] pOpciones on personas.id_rol = pOpciones.id_rol where personas.IdPersona = '" + Usuario + "'"
    '    Dim dad As SqlDataAdapter = New SqlDataAdapter(selectCommand, con)
    '    Dim dtblCategories As DataTable = New DataTable()
    '    dad.Fill(dtblCategories)
    '    Return dtblCategories
    'End Function
    'Metodo que se usa para obtener la informacion desde la base de datos para cargar el perfil correspondiente
    Private Function GetData(ByVal parentMenuId As Integer) As DataTable
        Dim query As String = "select personas.IdPersona, pOpciones.* from [dbo].[tbm_Personas] personas inner join [dbo].[tbm_Menus] pOpciones on personas.id_rol = pOpciones.id_rol where personas.IdPersona = @Usuario and ParentMenuId = @ParentMenuId"
        'Dim constr As String = con

        Using conn As SqlConnection = New SqlConnection(con.ConnectionString)
            Dim dt As DataTable = New DataTable()

            Using cmd As SqlCommand = New SqlCommand(query)

                Using sda As SqlDataAdapter = New SqlDataAdapter()
                    cmd.Parameters.AddWithValue("@Usuario", Usuario)
                    cmd.Parameters.AddWithValue("@ParentMenuId", parentMenuId)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = conn
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using

            Return dt
        End Using
    End Function


    Private Sub PopulateMenu(dt As DataTable, parentMenuId As Integer, parentMenuItem As MenuItem)
        Dim currentPage As String = Path.GetFileName(Request.Url.AbsolutePath)
        For Each row As DataRow In dt.Rows
            Dim menuItem As New MenuItem() With {
             .Value = row("MenuId").ToString(),
             .Text = row("Titulo").ToString(),
              .NavigateUrl = row("Pagina").ToString(),
             .Selected = row("Pagina").ToString().EndsWith(currentPage, StringComparison.CurrentCultureIgnoreCase)
            }
            If parentMenuId = 0 Then
                Menu1.Items.Add(menuItem)
                Dim dtChild As DataTable = Me.GetData(Integer.Parse(menuItem.Value))
                PopulateMenu(dtChild, Integer.Parse(menuItem.Value), menuItem)
            Else
                parentMenuItem.ChildItems.Add(menuItem)
            End If
        Next
    End Sub

End Class
