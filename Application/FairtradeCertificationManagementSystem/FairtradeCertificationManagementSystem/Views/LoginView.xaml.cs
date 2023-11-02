namespace FairtradeCertificationManagementSystem.Views;

public partial class LoginView : ContentPage
{
	public LoginView()
	{
		InitializeComponent();
	}

    private async void Register_Button_Clicked(System.Object sender, System.EventArgs e)
    {
		await Shell.Current.GoToAsync("Signup");
    }

    private async void Login_Button_Clicked(System.Object sender, System.EventArgs e)
    {
        await Shell.Current.GoToAsync("Calendar");
    }
}
