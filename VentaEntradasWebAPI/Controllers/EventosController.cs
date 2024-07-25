using Microsoft.AspNetCore.Mvc;

[Route("api/[controller]")]
[ApiController]
public class EventosController : ControllerBase
{
    private readonly EventoRepository _eventoRepository;

    public EventosController(EventoRepository eventoRepository)
    {
        _eventoRepository = eventoRepository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Evento>>> ObtenerTodosLosEventos()
    {
        var eventos = await _eventoRepository.ObtenerTodosLosEventos();
        return Ok(eventos);
    }

    //[HttpGet("{id}")]
    //public async Task<ActionResult<Evento>> ObtenerEventoPorId(int id)
    //{
    //    var evento = await _eventoRepository.ObtenerEventoPorId(id);

    //    if (evento == null)
    //    {
    //        return NotFound();
    //    }

    //    return Ok(evento);
    //}


    [HttpGet("{id}")]
    public async Task<IActionResult> ObtenerEventoPorId(int id)
    {
        var (evento, codigo, mensaje) = await _eventoRepository.ObtenerEventoPorId(id);

        if (codigo == 0)
        {
            // La consulta fue exitosa
            return Ok(evento);
        }
        else
        {
            // Maneja el error utilizando el mensaje
            return NotFound(new { Codigo = codigo, Mensaje = mensaje });
        }
    }

    [HttpPost]
    public async Task<ActionResult> InsertarEvento(Evento evento)
    {
        var codigo = await _eventoRepository.InsertarEvento(evento);

        if (codigo.Codigo != 0)
        {
            return BadRequest(new { Codigo = codigo.Codigo, Mensaje = codigo.Mensaje });
        }

        return Ok(new { Codigo = codigo.Codigo, Mensaje = codigo.Mensaje });
    }

    [HttpPut("{id}")]
    public async Task<ActionResult> ActualizarEvento(int id, Evento evento)
    {
        if (id != evento.Evento_Id)
        {
            return BadRequest();
        }

        var result = await _eventoRepository.ActualizarEvento(evento);

        if (result.Codigo != 0)
        {
            return BadRequest(new { Codigo = result.Codigo, Mensaje = result.Mensaje });
        }

        return Ok(new { Codigo = result.Codigo, Mensaje = result.Mensaje });
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult> EliminarEvento(int id)
    {
        var codigo = await _eventoRepository.EliminarEvento(id);

        if (codigo.Codigo != 0)
        {
            return BadRequest(new { Codigo = codigo.Codigo, Mensaje = codigo.Mensaje });
        }

        return Ok(new { Codigo = codigo.Codigo, Mensaje = codigo.Mensaje });
    }
}
