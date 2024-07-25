public class Evento
{
    public int Evento_Id { get; set; }
    public int TipoEvento_Id { get; set; }
    public string TipoEvento_Nombre { get; set; }
    public int Usuario_Id { get; set; }
    public string Usuario_Nombre { get; set; }
    public DateTime FechaEvento { get; set; }
    public string LugarEvento { get; set; }
    public string Descripcion { get; set; }
    public decimal Precio { get; set; }
    public string Estado { get; set; }
    public DateTime? Fecha_Creacion { get; set; }
    public DateTime? Fecha_Modificacion { get; set; }
}
