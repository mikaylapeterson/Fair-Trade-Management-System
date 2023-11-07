using System.Collections.ObjectModel;
using FairtradeCertificationManagementSystem.Data;
using FairtradeCertificationManagementSystem.Models;

namespace FairtradeCertificationManagementSystem.Views;

[QueryProperty("Item", "Item")]
public partial class LoginView : ContentPage
{
    CertificationDatabase Database;
    public ObservableCollection<User> Users { get; set; }

	public LoginView(CertificationDatabase certificationDatabase)
	{
		InitializeComponent();
        Database = certificationDatabase;
	}

    private async void Register_Button_Clicked(System.Object sender, System.EventArgs e)
    {
		await Shell.Current.GoToAsync("Signup");
    }

    private async void Login_Button_Clicked(System.Object sender, System.EventArgs e)
    {
        // these are always null... this means the databinding is WRONG
        //bool isNameEmpty = string.IsNullOrWhiteSpace(UserItem.Username);
        //bool isPasswordEmpty = string.IsNullOrWhiteSpace(UserItem.Password);

        //// TODO This can arguably be consolidated to just fill in two strings
        //if (UserItem == null || (isNameEmpty && isPasswordEmpty))
        //{
        //    await DisplayAlert("Username and Password Required", "Please enter your username and password.", "Ok");
        //    return;
        //}
        //else if (isNameEmpty)
        //{
        //    await DisplayAlert("Username Required", "Please enter your username.", "Ok");
        //    return;
        //}
        //else if (isPasswordEmpty)
        //{
        //    await DisplayAlert("Password Required", "Please enter your password.", "Ok");
        //    return;
        //}

        // TODO need to actually verify the login information
        // this should be business logic moved to a ViewModel


        //await Database.SaveItemAsync(UserItem); // this should also get moved to a ViewModel
        await Shell.Current.GoToAsync("Calendar");
        return;
    }
}
