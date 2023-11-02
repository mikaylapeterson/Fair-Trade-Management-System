using SQLite;
namespace FairtradeCertificationManagementSystem.Models;

[Table("Product")]
public class Product
{
    [PrimaryKey, AutoIncrement]
    public int ProductID { get; set; }

    public string Name { get; set; }
}

