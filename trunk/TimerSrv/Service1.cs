using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.IO;
// we need this to write to the file 
using System.Timers;
//we need this to create the timer.

namespace TimerSrv
{
    public partial class TimerSrv : ServiceBase
    {
        //Initialize the timer
        Timer timer = new Timer();

        public TimerSrv()
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
        }
    }
}
