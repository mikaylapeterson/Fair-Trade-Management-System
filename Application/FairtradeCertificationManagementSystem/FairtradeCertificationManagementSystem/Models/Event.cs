using SQLite;
using SQLiteNetExtensions.Attributes;

namespace FairtradeCertificationManagementSystem.Models;

[Table("Event")]
public class Event
{
    [PrimaryKey, AutoIncrement]
    public int EventID { get; set; }

    public string Name { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public bool isCompleted { get; set; }

    // Foreign key relations
    [ForeignKey(typeof(User))]
    public int UserID { get; set; }
}

