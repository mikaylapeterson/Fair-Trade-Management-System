namespace FairtradeCertificationManagementSystem.Views;

public partial class CalendarView : ContentPage
{
	public CalendarView()
	{
		InitializeComponent();
		BindingContext = new CalendarViewModel();
	}
}
