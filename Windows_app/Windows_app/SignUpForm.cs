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
    public partial class SignUpForm : Form
    {

        Thread thread;

        public SignUpForm()
        {
            InitializeComponent();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string connetionString = "Data Source=LAB215-1;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=sa;Password=12345";
            SqlConnection connection = new SqlConnection(connetionString);

            connection.Open();

            string NameUser = textBox1.Text;
            string EmailUser = textBox2.Text;
            string PasswordUser = textBox3.Text;

            string query = "INSERT INTO Клиент (Имя, Почта, Пароль) VALUES" + "('" + NameUser + "','" + EmailUser + "','" + PasswordUser + "')";

            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();

            connection.Close();

            this.Close();
            thread = new Thread(OpenSignIn);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
        }

        private void OpenSignIn()
        {
            SignInForm SignInForm = new SignInForm();
            Application.Run(SignInForm);
        }
    }
}
