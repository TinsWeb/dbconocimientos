using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.IO;
using System.Timers;

namespace CheckBackupWinService
{
    public partial class CheckBackups : ServiceBase
    {

        Timer timer = new Timer();
        private string _fechaActual = DateTime.Today.ToString("yyyy_MM_dd");

        public CheckBackups()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            AddToFile("Iniciando Servicio");

            //ad 1: handle Elapsed event
            timer.Elapsed += new ElapsedEventHandler(OnElapsedTime);

            //ad 2: set interval to 1 minute (= 60,000 milliseconds)

            timer.Interval = 60000;

            //ad 3: enabling the timer
            timer.Enabled = true;

        }

        protected override void OnStop()
        {
            AddToFile("Parando Servicio");
            timer.Enabled = false;
        }

        private void AddToFile(string contents)
        {

            //set up a filestream
            FileStream fs = new FileStream(@"c:\timerserv.txt", FileMode.OpenOrCreate, FileAccess.Write);

            //set up a streamwriter for adding text

            StreamWriter sw = new StreamWriter(fs);

            //find the end of the underlying filestream

            sw.BaseStream.Seek(0, SeekOrigin.End);

            //add the text
            sw.WriteLine(contents);
            //add the text to the underlying filestream

            sw.Flush();
            //close the writer
            sw.Close();
        }

        private void OnElapsedTime(object source, ElapsedEventArgs e)
        {
            AddToFile("Blablabla, se ejecuto el servicio");

            chequearEstado(_fechaActual, "masters.tierradelfuego.gov.ar");
        }


        
        private string _userSamba = "nchavez";
        private string _passSamba = "strato1986";

        

        private void chequearEstado(string fecha, string hostname)
        {
            Console.WriteLine(String.Format("net use \\\\10.1.9.216\\Status /user:{0} {1}", _userSamba, _passSamba));
            string _carpeta = String.Format("\\\\10.1.9.216\\Status\\{0}", _fechaActual);
            if (Directory.Exists(_carpeta))
            {

                ///TODO: Si existe la carpeta buscar el archivo dependiendo del hostName y leerlo para saber si el backup esta hecho o no
                //return "existe";

                StreamReader file = new System.IO.StreamReader(_carpeta + String.Format("\\{0}.txt", hostname));

                //AddToFile(file.ReadLine());

                foreach (char linea in file.ReadLine())
                {

                }

                
            }
            else
            {
                AddToFile("No se encontro la carpeta de backup");
            }

        }
    }
}
