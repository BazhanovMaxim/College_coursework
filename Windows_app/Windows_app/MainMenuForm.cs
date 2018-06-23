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

        public MainMenuForm()
        {
            InitializeComponent();
        }

        // Закрытия приложения
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // Подгрузка имя клиента и названия услуг в combobox
        private void MainMenuForm_Load(object sender, EventArgs e)
        {
            Id_Name id_Name = new Id_Name();
            label2.Text = Id_Name.Name;

            // Подключение к б/д
            string connetionString = "Data Source=D-BAZHANOV;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=Bazhanov;Password=^^^^";
            SqlConnection connection = new SqlConnection(connetionString);
            string QueryItems = "SELECT Название_услуги from [dbo].[Услуга]";
            SqlCommand sqlCommand = new SqlCommand(QueryItems, connection);
            SqlDataReader sqlDataReader;
            try
            {
                connection.Open();
                sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    comboBox1.Items.Add(sqlDataReader["Название_услуги"].ToString());
                }
                connection.Close();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

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


        // Кнопка по выбору услуги
        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.Text != String.Empty)
            {

                this.Close();

                thread = new Thread(OpenCommentDialog);
                thread.SetApartmentState(ApartmentState.STA);
                thread.Start();

            }
            else MessageBox.Show("Выберете услугу");
        }

        private void OpenCommentDialog()
        {
            CommentForOrder commentForOrder = new CommentForOrder();
            Application.Run(commentForOrder);
        }

        // При нажатии на одну из тем, высвечиваются дополнительные хар-ки.
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
             * Берём глобальную переменную id_Услуга для финального запроса в таблицу "Реализация_услуг".
             */
            Id_Service id_Service = new Id_Service();

            // Подключение к б/д
            string connetionString = "Data Source=D-BAZHANOV;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=Bazhanov;Password=^^^^";
            SqlConnection connection = new SqlConnection(connetionString);
            string QueryItems = "SELECT * from [dbo].[Услуга]";
            SqlCommand sqlCommand = new SqlCommand(QueryItems, connection);
            SqlDataReader sqlDataReader;
            try
            {
                connection.Open();
                sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    Id_Service.Id_Srvc = (int)sqlDataReader["id_Услуги"];
                    string NameService = (string)sqlDataReader["Название_услуги"].ToString();
                    string PayService = (string)sqlDataReader["Цена"].ToString();
                    string DateService = (string)sqlDataReader["Дата"].ToString();
                    Service.Text = NameService;
                    Pay_service.Text = PayService;
                    textBox3.Text = DateService;
                }

                connection.Close();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
