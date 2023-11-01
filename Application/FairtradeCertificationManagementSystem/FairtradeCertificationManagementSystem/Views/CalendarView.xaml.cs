namespace FairtradeCertificationManagementSystem;

public partial class Calendar : ContentPage
{
	public Calendar()
	{
		InitializeComponent();
		BindingContext = new CalendarViewModel();
	}
}
