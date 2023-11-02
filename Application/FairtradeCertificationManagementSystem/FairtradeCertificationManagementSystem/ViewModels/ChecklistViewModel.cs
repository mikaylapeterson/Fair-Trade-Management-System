using System;
using System.Collections.ObjectModel;

namespace FairtradeCertificationManagementSystem;

public class ChecklistViewModel
{
	public ObservableCollection<string> MyList { get; set; }
	public ChecklistViewModel()
	{
		// my list needs to load from some form of database...
	}
}

