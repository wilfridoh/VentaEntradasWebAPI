namespace VentaEntradasWebAPI.Models
{
    public class Usuario
    {
        public int Usuario_Id { get; set; }
        public string Usuario_Nombre { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public DateTime Fecha_Creacion { get; set; }
        public DateTime Fecha_Modificacion { get; set; }
    }
}
