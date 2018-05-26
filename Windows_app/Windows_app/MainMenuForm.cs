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
    public partial class MainMenuForm : Form
    {
        // Для открытия и закрытия формы одновременно
        Thread thread;

        // Для б/д
        SqlDataReader reader;
        SqlCommand cmd;
        SqlConnection cnn;

        public MainMenuForm()
        {
            InitializeComponent();
        }

        // Закрытия приложения
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // Подгрузка имени
        private void MainMenuForm_Load(object sender, EventArgs e)
        {
            Nameuser nameuser = new Nameuser();
            label2.Text = Nameuser.Name;
        }

        // Переход в форму входа
        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.Close();
            thread = new Thread(OpenSignInform);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
        }

        private void OpenSignInform()
        {
            SignInForm signInForm = new SignInForm();
            Application.Run(signInForm);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=LAB215-1;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=sa;Password=12345";
            string commandText = @"Select distinct [FirstName], 
[LastName], 
[CountryCode], 
rev.[RegistrationId], 
rev.[BibNumber], 
chr.[CharityId], 
chr.[CharityName], 
chr.[CharityDescription], 
chr.[CharityLogo] 
from 
[dbo].[User] usr 
@"Select distinct [Название_услуги],
                [Цена],
                [Дата],
                []"";
            cnn = new SqlConnection(connectionString);
            cnn.Open();
            cmd = cnn.CreateCommand();
            cmd.CommandText = commandText;
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                comboBox1.Items.Add(String.Format("{0}, {1} - {2} ({3})",
                reader["FirstName"],
                reader["LastName"],
                reader["BibNumber"],
                reader["CountryCode"]));

            }
            reader.Close();
            cnn.Close();
        }
    }
}
