using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Windows_app
{
    public partial class SignInForm : Form
    {
        Thread thread;

        public SignInForm()
        {
            InitializeComponent();
        }

        // Закрытие приложения
        private void pictureBox2_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        // Переход на форму регистрации
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            thread = new Thread(OpenSingUp);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
        }

        private void OpenSingUp()
        {
            SignUpForm SignUpForm = new SignUpForm();
            Application.Run(SignUpForm);
        }

        // Вход пользователя
        private void button1_Click(object sender, EventArgs e)
        {
            // Класс Nameuser для обращения в дальнейшем к пользователю. Гл переменная
            Nameuser nameuser = new Nameuser();
            
            // Подключение к б/д
            string connetionString = "Data Source=LAB215-1;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=sa;Password=12345";
            SqlConnection connection = new SqlConnection(connetionString);

            connection.Open();

            string NameUser = textBox1.Text;
            string EmailUser = textBox2.Text;
            string PasswordUser = textBox3.Text;

            string query = "Select * from Клиент Where Имя = '" + NameUser + "' and Почта = '" + EmailUser + "' and Пароль = '" + PasswordUser + "'";

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connection);

            // Нужно для проверки логина и пароля
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count == 1)
            {
                Nameuser.Name = textBox1.Text;
                this.Close();
                thread = new Thread(OpenMainMenu);
                thread.SetApartmentState(ApartmentState.STA);
                thread.Start();
            }

            else
            {
                MessageBox.Show("Неверный логин или пароль");
            }

            connection.Close();
        }

        private void OpenMainMenu()
        {
            MainMenuForm mainMenuForm = new MainMenuForm();
            Application.Run(mainMenuForm);
        }
    }
}