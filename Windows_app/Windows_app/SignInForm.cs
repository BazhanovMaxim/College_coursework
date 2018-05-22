using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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

        private void pictureBox2_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

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
    }
}
