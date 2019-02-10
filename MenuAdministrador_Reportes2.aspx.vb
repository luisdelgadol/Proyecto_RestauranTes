
Partial Class MenuAdministrador_Reportes2
    Inherits System.Web.UI.Page


    Public Sub cargarDatos()

        Dim strCon As String
        strCon = ""
        If cbopersona.SelectedIndex > 0 Then
            strCon += "idRol={0}"

        End If
        SqlDataSource2.FilterExpression = IIf(strCon.Equals(""), Nothing, strCon)
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        cargarDatos()
    End Sub
End Class
