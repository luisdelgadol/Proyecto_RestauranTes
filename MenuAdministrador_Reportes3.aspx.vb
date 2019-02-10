
Partial Class MenuAdministrador_Reportes2
    Inherits System.Web.UI.Page

    Public strSQL As String
    Public Sub cargarDatos()

        Dim strCon As String
        strCon = ""
        If cbocat.SelectedIndex > 0 Then
            strCon += "IdPlatCat={0}"

        End If
        SqlDataSource2.FilterExpression = IIf(strCon.Equals(""), Nothing, strCon)
        strSQL = "SELECT tbm_Platos.IdPlatCat, tbm_Platos.IdPlato, tbm_Platos_Categoria.Nombre, tbm_Platos.Nombre AS Expr1, tbm_Platos.Estado FROM tbm_Platos_Categoria INNER JOIN tbm_Platos ON tbm_Platos_Categoria.IdPlatCat = tbm_Platos.IdPlatCat"
        strSQL = strSQL & " WHERE 1=1"


        If rbtactivo.Checked = True Then
            strSQL = strSQL & " AND tbm_Platos.Estado='A'"
        ElseIf rbtinactivo.Checked = True Then
            strSQL = strSQL & " AND tbm_Platos.Estado='I'"
        End If
        strSQL = strSQL & " ORDER BY tbm_Platos.IdPlato"

        SqlDataSource2.SelectCommand = strSQL
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        cargarDatos()
    End Sub


End Class
