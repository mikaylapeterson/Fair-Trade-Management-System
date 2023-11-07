using CommunityToolkit.Maui;
using FairtradeCertificationManagementSystem.Data;
using FairtradeCertificationManagementSystem.Views;
using Microsoft.Extensions.Logging;

namespace FairtradeCertificationManagementSystem;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
            .UseMauiCommunityToolkit()
            .ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			});

		builder.Services.AddSingleton<LoginView>();

		builder.Services.AddSingleton<CertificationDatabase>();

#if DEBUG
		builder.Logging.AddDebug();
#endif

		return builder.Build();
	}
}

