using MySql.Data.MySqlClient;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace TestFirst
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string connetionString = "Data Source=LAB215-1;Initial Catalog=DataBaseForApp;Persist Security Info=True;User ID=sa;Password=12345;TrustServerCertificate=False";
            SqlConnection connection = new SqlConnection(connetionString);


            connection.Open();
            //try
            //{
            //    cnn.Open();
            //    MessageBox.Show("Connection Open ! ");
            //    cnn.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show("Can not open connection ! ");
            //}

            string query = "INSERT INTO Клиенты (Имя, Фамилия) " +
                "VALUES ('Maxim', 'Bazhanov')";

            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();

            connection.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string textName = textBox1.Text;
            string textSurname = textBox2.Text;

            

        }

        
    }
}
