using Microsoft.AspNetCore.Mvc;
using System;
using System.Dynamic;
using WebApi.Service;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly ProductoService _productoService;

        public ProductoController(ProductoService productoService)
        {
            _productoService = productoService;
        }

        [HttpGet(("GetAll"))]
        public ActionResult GetAll()
        {
            dynamic resposonse = new ExpandoObject();
            try
            {
                var item = _productoService.GetAll();
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
