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
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string NameClient = textBox1.Text;
            string SurnameClient = textBox2.Text; 

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

            string query = "INSERT INTO Клиенты (Имя, Фамилия) VALUES" + "('" + NameClient + "','" + SurnameClient + "')";
            //"VALUES ('Maxim', 'Bazhanov')";


            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();

            connection.Close();
        }
    }
}
