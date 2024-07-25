using Microsoft.EntityFrameworkCore;

namespace VentaEntradasWebAPI.Models
{
    public class VentaEntradasContext : DbContext
    {
        public VentaEntradasContext(DbContextOptions<VentaEntradasContext> options) : base(options)
        {

        }
        public DbSet<Evento> Eventos { get; set; }
    }
}
