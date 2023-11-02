using System.Collections.Generic;
using System.Threading.Tasks;
using SQLite;
using FairtradeCertificationManagementSystem.Models;

namespace FairtradeCertificationManagementSystem.Data;

public class CertificationDatabase
{
    SQLiteAsyncConnection Database;

    public CertificationDatabase()
    {
    }

    async Task Init()
    {
        if (Database is not null)
            return;

        Database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
        var result = await Database.CreateTableAsync<Event>();
        result = await Database.CreateTableAsync<ProducerNetwork>();
        result = await Database.CreateTableAsync<Product>();
        result = await Database.CreateTableAsync<User>();
    }

    // TODO relearn how generic types work because the code duplication is not good

    public async Task<List<User>> GetItemsAsync()
    {
        await Init();
        return await Database.Table<User>().ToListAsync();
    }

    //public async Task<List<Event>> GetItemsNotDoneAsync()
    //{
    //    await Init();
    //    return await Database.Table<Event>().Where(t => t.Done).ToListAsync();

    //    // SQL queries are also possible
    //    //return await Database.QueryAsync<TodoItem>("SELECT * FROM [TodoItem] WHERE [Done] = 0");
    //}

    public async Task<User> GetItemAsync(int id)
    {
        await Init();
        return await Database.Table<User>().Where(i => i.UserID == id).FirstOrDefaultAsync();
    }

    public async Task<int> SaveItemAsync(User item)
    {
        await Init();
        if (item.UserID != 0)
        {
            return await Database.UpdateAsync(item);
        }
        else
        {
            return await Database.InsertAsync(item);
        }
    }

    public async Task<int> DeleteItemAsync(User item)
    {
        await Init();
        return await Database.DeleteAsync(item);
    }
}