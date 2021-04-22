using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.ViewModel
{
    public class FacturaViewModel
    {
        public int FacturaId { get; set; }
        public string Serie { get; set; }
        public string Codigo { get; set; }
        public int VendedorId { get; set; }
        public int ClienteId { get; set; }
        public DateTime Fecha { get; set; } = DateTime.Now;
        public string Moneda { get; set; }
        public List<FacturaDetalle> FacturaDetalle { get; set; }
    }
}
