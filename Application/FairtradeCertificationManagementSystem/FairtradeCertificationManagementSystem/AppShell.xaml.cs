namespace FairtradeCertificationManagementSystem;

public partial class AppShell : Shell
{
	public AppShell()
	{
		InitializeComponent();

		Routing.RegisterRoute("Login", typeof(Views.LoginView));
		Routing.RegisterRoute("Signup", typeof(Views.SignupView));
		Routing.RegisterRoute("Checklist", typeof(Views.ChecklistView));
		Routing.RegisterRoute("Calendar", typeof(Views.CalendarView));
	}
}

