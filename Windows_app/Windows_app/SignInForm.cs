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
            
            
            // Подключение к б/д
            string connetionString = "Data Source=D-BAZHANOV;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=Bazhanov;Password=^^^^";
            SqlConnection connection = new SqlConnection(connetionString);

            connection.Open();

            string EmailUser = textBox2.Text;
            string PasswordUser = textBox3.Text;


            // Запрос на вход пользователя
            string query = "Select * from Клиент Where Почта = '" + EmailUser + "' and Пароль = '" + PasswordUser + "'";

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connection);

            // Нужно для проверки логина и пароля
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count == 1)
            {
                // Класс Nameuser для обращения в дальнейшем к пользователю. Гл переменная
                Id_Name id_Name = new Id_Name();

                // Запрос на получение имени пользователя
                SqlCommand sqlCommand_IdName = new SqlCommand("SELECT id_Клиента, Имя FROM[dbo].[Клиент] WHERE Почта = '" + EmailUser + "'", connection);

                SqlDataReader sqlDataReader = sqlCommand_IdName.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Id_Name.Id = Convert.ToInt32(sqlDataReader["id_Клиента"]);
                    Id_Name.Name = sqlDataReader["Имя"].ToString();
                }

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