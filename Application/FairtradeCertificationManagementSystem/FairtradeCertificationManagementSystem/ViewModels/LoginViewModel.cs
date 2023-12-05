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
            OnPropertyChanged("User");
        }
    }

    private string _userName;

    public string UserName
    {
        get => _userName;
        set
        {
            if (_userName != value)
            {
                _userName = value;
                OnPropertyChanged("UserName");
            }
        }
    }

    private string _password;

    public string Password
    {
        get => _password;
        set
        {
            if (_password != value)
            {
                _password = value;
                OnPropertyChanged("Password");
            }
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
        if (string.IsNullOrEmpty(UserName))
        {
            
        }
        if (string.IsNullOrEmpty(Password))
        {

        }
        // user and password need to be set and then verified
    }

    public void OnPropertyChanged([CallerMemberName] string name = "") =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

