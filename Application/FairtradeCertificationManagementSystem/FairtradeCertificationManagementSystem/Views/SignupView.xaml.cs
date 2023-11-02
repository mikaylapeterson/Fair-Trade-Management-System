namespace FairtradeCertificationManagementSystem.Views;

public partial class SignupView : ContentPage
{
	public SignupView()
	{
		InitializeComponent();
	}

    private async void Login_Button_Clicked(System.Object sender, System.EventArgs e)
    {
        await Shell.Current.GoToAsync("Login");
    }
}
