using Microsoft.AspNetCore.Mvc;
using System;
using System.Dynamic;
using WebApi.Service;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendedorController : ControllerBase
    {

        private readonly VendedorService _vendedorService;

        public VendedorController(VendedorService vendedorService)
        {
            _vendedorService = vendedorService;
        }

        [HttpGet(("GetAll"))]
        public ActionResult GetAll()
        {
            dynamic resposonse = new ExpandoObject();
            try
            {
                var item = _vendedorService.GetAllFacturaSinEmitir();
                if (item != null)
                {
                    resposonse.data = item;
                    resposonse.errormensaje = "";
                    resposonse.error = false;
                }
                else
                {
                    resposonse.data = null;
                    resposonse.errormensaje = "No Existe Registros";
                    resposonse.error = true;
                }
            }
            catch (Exception ex)
            {
                resposonse.data = null;
                resposonse.errormensaje = ex.Message;
                resposonse.error = true;
            }
            object datos = (object)resposonse;
            return Ok(datos);
        }
    }
}
