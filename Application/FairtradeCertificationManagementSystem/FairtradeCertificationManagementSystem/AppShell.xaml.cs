﻿namespace FairtradeCertificationManagementSystem;

public partial class AppShell : Shell
{
	public AppShell()
	{
		InitializeComponent();
		Routing.RegisterRoute("login", typeof(Login));
	}
}

