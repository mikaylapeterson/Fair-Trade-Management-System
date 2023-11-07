using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using FairtradeCertificationManagementSystem.Models;

namespace FairtradeCertificationManagementSystem.ViewModels;
public class LoginViewModel : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;

    private User _user;

    public User user
    {
        get => _user;
        set
        {
            _user = value;
            OnPropertyChanged();
        }
    }

    public LoginViewModel()
	{
        this.user = new User();
	}

    public void verifyLogin()
    {
        // this should return a string for the display box that I originally had
        // in Login_Button_Clicked() to follow proper MVVM standards/separation of concerns
        //user.Password =
        // user and password need to be set and then verified
    }

    public void OnPropertyChanged([CallerMemberName] string name = "") =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

