using SQLite;
namespace FairtradeCertificationManagementSystem.Models;

[Table("ProducerNetwork")]
public class ProducerNetwork
{
    [PrimaryKey, AutoIncrement]
    public int ProducerNetworkID { get; set; }

    public string Name { get; set; }
}
