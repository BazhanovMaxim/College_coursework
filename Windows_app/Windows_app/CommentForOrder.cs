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
    public partial class CommentForOrder : Form
    {
        public CommentForOrder()
        {
            InitializeComponent();
        }

        // Для открытия и закрытия формы одновременно
        Thread thread;

        int Id_Comment = 1;

        // С подгрузкой страницы сразу узнаём id_комментария. Это нужно, что не заменить уже существующий комментарий.
        private void CommentForOrder_Load(object sender, EventArgs e)
        {
            // Подключение к б/д
            string connetionString = "Data Source=D-BAZHANOV;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=Bazhanov;Password=^^^^";
            SqlConnection connection = new SqlConnection(connetionString);
            string QueryItems = "SELECT  ([id_Комментария]) from[dbo].[Отзыв_клиента]";
            SqlCommand sqlCommand = new SqlCommand(QueryItems, connection);
            SqlDataReader sqlDataReader;
            try
            {
                connection.Open();
                sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {

                    Id_Comment = Convert.ToInt32(sqlDataReader["id_Комментария"]);

                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        // Добавление комментария + отправка услуги в таблицу "Реализация услуг".
        private void button1_Click(object sender, EventArgs e)
        {
            string CommentUser = textBox1.Text;

            if (CommentUser != null)
            {
                // Добавляем + 1, чтобы не было повторяющегося id комментария
                Id_Comment += 1;

                // Добавление комментария
                string connetionString = "Data Source=D-BAZHANOV;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=Bazhanov;Password=^^^^";
                SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                string QueryAddComment = "INSERT [dbo].[Отзыв_клиента] ([id_Комментария], [Описание])  VALUES" + "('" + Id_Comment + "', '" + CommentUser + "')";
                SqlCommand sqlCommand = new SqlCommand(QueryAddComment, connection);

                sqlCommand.ExecuteNonQuery();

                connection.Close();

                // Нужно для отправки id клиента в таблицу "Реалзиацию услуг"
                Id_Name id_Name = new Id_Name();
                int idUser = Id_Name.Id;

                // Нужно для отправки запроса с id_Услугой
                Id_Service id_Service = new Id_Service();
                int idService = Id_Service.Id_Srvc;


                // Отправка услуги в таблицу "Реализация услуг"
                string connetionString_2 = "Data Source=D-BAZHANOV;Initial Catalog=DataBase_coursework;Persist Security Info=True;User ID=Bazhanov;Password=^^^^";
                SqlConnection connection_2 = new SqlConnection(connetionString_2);
                connection_2.Open();
                string QueryAddComment_2 = "INSERT[dbo].[Реализация_услуги]([id_Комментария],[id_Клиента], [id_Услуги]) VALUES" + "('" +  Id_Comment + "','" + idUser + "', '" + idService + "')";
                SqlCommand sqlCommand_2 = new SqlCommand(QueryAddComment_2, connection_2);

                sqlCommand_2.ExecuteNonQuery();

                connection_2.Close();

                MessageBox.Show("Ваш запрос обработан");
            }
            else
            {
                MessageBox.Show("Пожалуйста, заполните комментарий");
            }

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

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.Close();
            thread = new Thread(OpenCommentOrder);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();

        }

        private void OpenCommentOrder()
        {
            MainMenuForm mainMenuForm = new MainMenuForm();
            Application.Run(mainMenuForm);
        }
    }
}
