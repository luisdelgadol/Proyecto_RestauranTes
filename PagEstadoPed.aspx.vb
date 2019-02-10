Imports System.Data
Imports System.Data.SqlClient
Partial Class PagEstadoPed
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dtb, dtbcat As DataTable
    Public sda1 As SqlDataAdapter
    Public dtb1 As DataTable
    Public strSQL1 As String
    Public strSQL As String
    Public Sub Cargardatos()
        Try
            Dim x As Integer
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT tbm_Orden_Detalle.IdPlato, tbm_Platos.Nombre AS PlatoPedido, tbm_Orden_Detalle.IdOrden, tbm_Personas.Nombres  AS Cliente, tbm_Ordenes.IdCliente, tbm_Clientes.IdPersona, case  when tbm_Ordenes.Estado = 'D' then 'Despachado' when  tbm_Ordenes.Estado = 'I' then 'Ingresado' when tbm_Ordenes.Estado = 'X' then 'Anulado' end Estado FROM tbm_Platos INNER JOIN tbm_Orden_Detalle ON tbm_Platos.IdPlato = tbm_Orden_Detalle.IdPlato INNER JOIN tbm_Ordenes ON tbm_Orden_Detalle.IdOrden = tbm_Ordenes.IdOrden AND tbm_Orden_Detalle.IdOrden = tbm_Ordenes.IdOrden INNER JOIN tbm_Clientes ON tbm_Ordenes.IdCliente = tbm_Clientes.IdCliente INNER JOIN tbm_Personas ON tbm_Clientes.IdPersona = tbm_Personas.IdPersona WHERE (tbm_Ordenes.Estado &lt;&gt; 'X')"

            'strSQL = strSQL & " INNER JOIN tbm_Order_Detalle o ON t.idordendetalle=o.IdOrDet"
            'strSQL = strSQL & " INNER JOIN tbm_Platos p ON o.IdPlato=p.IdPlato"
            'strSQL = strSQL & " INNER JOIN tbm_Platos p ON o.IdPlato=p.IdPlato"
            sda = New SqlDataAdapter(strSQL, con)
            dtb = New DataTable
            sda.Fill(dtb)
            x = dtb.Rows.Count
            MsgBox(x)

        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

    Private Sub PagEstadoPed_Load(sender As Object, e As EventArgs) Handles Me.Load
        Cargardatos()
    End Sub
End Class
