using System;
using System.Collections.Generic;

namespace WebApi.Entities
{
    public class Factura
    {
        public int FacturaId { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Importe { get; set; }
        public string Cliente { get; set; }
        public string Vendedor { get; set; }


        //2do
        public string Serie { get; set; }
        public string Codigo { get; set; }
        public int VendedorId { get; set; }
        public int ClienteId { get; set; }
        public string Moneda { get; set; }

        public List<FacturaDetalle> FacturaDetalle { get; set; }

    }
}
