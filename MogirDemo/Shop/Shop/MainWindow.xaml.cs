using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Shop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = BDC.db.Пользователи.FirstOrDefault(q => q.Логин.Equals(login.Text) && q.Пароль.Equals(password.Password));
                if (user != null)
                {
                    Window newwindow = new PageProducts();
                    this.Close();       
                    newwindow.Show();
                }
                else
                    MessageBox.Show("Неверно введен логин или пароль");
            }
            catch (Exception ex)
            {
            }
        }
    }
}
