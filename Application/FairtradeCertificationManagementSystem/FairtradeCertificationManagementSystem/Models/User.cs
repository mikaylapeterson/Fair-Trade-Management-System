using SQLite;
using SQLiteNetExtensions.Attributes;

namespace FairtradeCertificationManagementSystem.Models;

[Table("User")]
public class User
{
    [PrimaryKey, AutoIncrement]
    public int UserID { get; set; }

    public string Username { get; set; }

    public string Password { get; set; } // TODO this really should use hashing...

    // Foreign key connections
    [OneToOne]
    public Product Product { get; set; }

    [OneToOne]
    public ProducerNetwork ProducerNetwork { get; set; }

    [OneToMany]
    public List<Event> Events { get; set; }
}