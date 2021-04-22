using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.Repository;

namespace WebApi.UnitOfWork.Core.Repository
{
    public class FacturaRepository : Repository, IFacturaRepository
    {
        public FacturaRepository(IDbTransaction transaction) : base(transaction) { }

        public IEnumerable<Factura> GetAllFacturasEmitidas()
        {
            var result = Connection.Query<Factura>("sp_lista_facturas_emitidas", commandType: CommandType.StoredProcedure, transaction: Transaction).AsList();
            return result;
        }


        //private void UpdateHeader(Invoice model, SqlConnection context)
        //{

        //    var query = "update  invoices set clientId=@clientId, Iva=@Iva, SubTotal=@SubTotal, Total=@Total where id=@id";
        //    var command = new SqlCommand(query, context);
        //    command.Parameters.AddWithValue("@ClientId", model.ClientId);
        //    command.Parameters.AddWithValue("@Iva", model.Iva);
        //    command.Parameters.AddWithValue("@Subtotal", model.Subtotal);
        //    command.Parameters.AddWithValue("@Total", model.Total);
        //    command.Parameters.AddWithValue("@id", model.Id);
        //    command.ExecuteNonQuery();
        //}


        private DataTable ListToDetalle(List<FacturaDetalle> detalles)
        {
            var table = new DataTable();

            //table.Columns.Add("DetalleFacturaId", typeof(int));
            table.Columns.Add("FacturaId", typeof(int));
            table.Columns.Add("ProductoId", typeof(int));
            table.Columns.Add("Cantidad", typeof(int));
            table.Columns.Add("PrecioUnitario", typeof(decimal));

            int count = 0;
            foreach (var item in detalles)
            {
                var row = table.NewRow();
                //row["DetalleFacturaId"] = ++count;
                row["FacturaId"] = 0;
                row["ProductoId"] = item.ProductoId;
                row["Cantidad"] = item.Cantidad;
                row["PrecioUnitario"] = item.PrecioUnitario;
                table.Rows.Add(row);

            }


            return table;
        }


        public string Create(Factura factura)
        {

            var connection = Connection.ConnectionString;



            using (var context = new SqlConnection(connection))
            {
                context.Open();
                var commad = new SqlCommand("proc_insertar_factura", context);

                commad.CommandType = CommandType.StoredProcedure;


                commad.Parameters.AddWithValue("@Codigo", factura.Codigo);
                commad.Parameters.AddWithValue("@Serie", factura.Serie);

                commad.Parameters.AddWithValue("@VendedorId", factura.VendedorId);
                commad.Parameters.AddWithValue("@ClienteId", factura.ClienteId);
                commad.Parameters.AddWithValue("@Fecha", factura.Fecha);
                commad.Parameters.AddWithValue("@Moneda", factura.Moneda);


                var parameter = commad.CreateParameter();
                parameter.TypeName = "dbo.DetalleFacturaTableTypeA";
                parameter.Value = ListToDetalle(factura.FacturaDetalle);
                parameter.ParameterName = "@detalle";
                commad.Parameters.Add(parameter);

                commad.ExecuteNonQuery();

            }

            return "Ok";

        }

    }
}
