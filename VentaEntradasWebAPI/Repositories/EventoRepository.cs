using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

public class EventoRepository
{
    private readonly IConfiguration _configuration;
    private readonly string _connectionString;

    public EventoRepository(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("DefaultConnection");
    }

    public async Task<IEnumerable<Evento>> ObtenerTodosLosEventos()
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            var query = "EXEC SP_ObtenerTodosLosEventos";
            return await connection.QueryAsync<Evento>(query);
        }
    }

    //public async Task<Evento> ObtenerEventoPorId(int eventoId)
    //{
    //    using (var connection = new SqlConnection(_connectionString))
    //    {
    //        var query = "EXEC AP_ObtenerEventoPorId @Evento_Id";
    //        return await connection.QuerySingleOrDefaultAsync<Evento>(query, new { Evento_Id = eventoId });
    //    }
    //}

    public async Task<(Evento, int, string)> ObtenerEventoPorId(int eventoId)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            var query = "EXEC AP_ObtenerEventoPorId @Evento_Id, @Codigo OUTPUT, @Mensaje OUTPUT";
            var parameters = new DynamicParameters();
            parameters.Add("Evento_Id", eventoId);
            parameters.Add("Codigo", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Mensaje", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

            var evento = await connection.QuerySingleOrDefaultAsync<Evento>(query, parameters);
            var codigo = parameters.Get<int>("Codigo");
            var mensaje = parameters.Get<string>("Mensaje");

            return (evento, codigo, mensaje);
        }
    }


    public async Task<StoredProcedureResult> InsertarEvento(Evento evento)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            var query = "EXEC SP_InsertaEvento @TipoEvento_Id, @Usuario_Id, @FechaEvento, @LugarEvento, @Descripcion, @Precio, @Estado, @Codigo OUTPUT, @Mensaje OUTPUT";
            var parameters = new DynamicParameters();
            parameters.Add("TipoEvento_Id", evento.TipoEvento_Id);
            parameters.Add("Usuario_Id", evento.Usuario_Id);
            parameters.Add("FechaEvento", evento.FechaEvento);
            parameters.Add("LugarEvento", evento.LugarEvento);
            parameters.Add("Descripcion", evento.Descripcion);
            parameters.Add("Precio", evento.Precio);
            parameters.Add("Estado", evento.Estado);
            parameters.Add("Codigo", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Mensaje", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

            await connection.ExecuteAsync(query, parameters);

            var result = new StoredProcedureResult
            {
                Codigo = parameters.Get<int>("Codigo"),
                Mensaje = parameters.Get<string>("Mensaje")
            };

            return result;
        }
    }

    public async Task<StoredProcedureResult> ActualizarEvento(Evento evento)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            var query = "EXEC SP_ActualizarEvento @Evento_Id, @TipoEvento_Id, @Usuario_Id, @FechaEvento, @LugarEvento, @Descripcion, @Precio, @Estado, @Codigo OUTPUT, @Mensaje OUTPUT";
            var parameters = new DynamicParameters();
            parameters.Add("Evento_Id", evento.Evento_Id);
            parameters.Add("TipoEvento_Id", evento.TipoEvento_Id);
            parameters.Add("Usuario_Id", evento.Usuario_Id);
            parameters.Add("FechaEvento", evento.FechaEvento);
            parameters.Add("LugarEvento", evento.LugarEvento);
            parameters.Add("Descripcion", evento.Descripcion);
            parameters.Add("Precio", evento.Precio);
            parameters.Add("Estado", evento.Estado);
            parameters.Add("Codigo", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Mensaje", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

            await connection.ExecuteAsync(query, parameters);

            var result = new StoredProcedureResult
            {
                Codigo = parameters.Get<int>("Codigo"),
                Mensaje = parameters.Get<string>("Mensaje")
            };

            return result;
        }
    }


    public async Task<StoredProcedureResult> EliminarEvento(int eventoId)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            var query = "EXEC SP_EliminarEvento @Evento_Id, @Codigo OUTPUT, @Mensaje OUTPUT";
            var parameters = new DynamicParameters();
            parameters.Add("Evento_Id", eventoId);
            parameters.Add("Codigo", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Mensaje", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

            await connection.ExecuteAsync(query, parameters);

            var result = new StoredProcedureResult
            {
                Codigo = parameters.Get<int>("Codigo"),
                Mensaje = parameters.Get<string>("Mensaje")
            };

            return result;
        }
    }
}
