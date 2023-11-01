using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using XCalendar.Core.Models;

namespace FairtradeCertificationManagementSystem;

public class CalendarViewModel
{
	public Calendar<CalendarDay> MyCalendar { get; set; } = new Calendar<CalendarDay>();
	public ICommand NavigateCalendarCommand { get; set; }

    public CalendarViewModel()
	{
		NavigateCalendarCommand = new Command<int>(NavigateCalendar);
	}

	public void NavigateCalendar(int amount)
	{
		DateTime targetDateTime = MyCalendar.NavigatedDate.AddMonths(amount);
	}
}

