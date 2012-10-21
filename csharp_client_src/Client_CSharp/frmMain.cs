using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using ChronCore;

namespace Client_CSharp
{
	public partial class frmMain : Form
	{
		private ChronManager chronManager = new ChronManager();
        private Timer connectionTimer = new Timer();

		public frmMain()
		{
			InitializeComponent();

			connectionTimer.Interval = 500;
			connectionTimer.Tick += new EventHandler(connectionTimer_Tick);
			connectionTimer.Start();
		}

		private void connectionTimer_Tick(object sender, EventArgs e)
		{
			bool connected = ConnectToChron();
			if (connected)
			{
				connectionTimer.Stop();
				txtStatus.Text = "Connected";
			}
			else
			{
				txtStatus.Text = "Device not Found";
				txtState.Text = "Nop";
			}
		}

		private void frmMain_Load(object sender, EventArgs e)
		{
			txtStatus.Text = "Ready";
			txtState.Text = "Ready";
		}

		private void frmMain_Shown(object sender, EventArgs e)
		{
			ChronManager mgr = new ChronManager();
			System.Diagnostics.Debug.WriteLine("Hello world!");
		}

		private bool ConnectToChron()
        {
            if (chronManager.OpenDevice())
            {
                chronManager.DeviceAttached += new EventHandler(chronManager_DeviceAttached);
                chronManager.DeviceRemoved += new EventHandler(chronManager_DeviceRemoved);
				chronManager.EntryReceived += new EventHandler<ChronEventArgs>(chronManager_EntryReceived);

                System.Diagnostics.Debug.WriteLine("Chron Device found");
                return true;
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Could not find a Chron Device.");
                return false;
            }
        }

		private void chronManager_EntryReceived(object sender, ChronEventArgs e)
		{
			if (InvokeRequired)
			{   // Event can be received on a separate thread, so we need to push the message
				// back on the GUI thread before we execute.
				BeginInvoke(new Action<object, ChronEventArgs>(chronManager_EntryReceived), sender, e);
				return;
			}

			txtBoxDiagnostics.Text += e.State.Diagnostics + "\r\n";
			// System.Diagnostics.Debug.WriteLine("Chron Device removed.");
		}

        private void chronManager_DeviceRemoved(object sender, EventArgs e)
        {
            if (InvokeRequired)
            {   // Event can be received on a separate thread, so we need to push the message
                // back on the GUI thread before we execute.
                BeginInvoke(new Action<object, EventArgs>(chronManager_DeviceRemoved), sender, e);
                return;
            }

            txtStatus.Text = "Disconnected";
            System.Diagnostics.Debug.WriteLine("Chron Device removed.");
        }

        private void chronManager_DeviceAttached(object sender, EventArgs e)
        {
            if (InvokeRequired)
            {   // Event can be received on a separate thread, so we need to push the message
                // back on the GUI thread before we execute.
                BeginInvoke(new Action<object, EventArgs>(chronManager_DeviceAttached), sender, e);
                return;
            }

			txtStatus.Text = "Connected";
            System.Diagnostics.Debug.WriteLine("Chron Device attached.");
        }

		private void mnuBeginTestUnit_Click(object sender, EventArgs e)
		{
			chronManager.GetCronData();
		}

		private void mnuGetCronTime_Click(object sender, EventArgs e)
		{
			chronManager.GetCronTime();
		}

		private void writeCron01ToolStripMenuItem_Click(object sender, EventArgs e)
		{
			chronManager.WriteCronData();
		}

		private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Form formAbout = new frmAbout();
			formAbout.ShowDialog(this);
		}

		private void exitToolStripMenuItem_Click(object sender, EventArgs e)
		{
			this.Close();
		}

		private void contentsToolStripMenuItem_Click(object sender, EventArgs e)
		{
			System.Diagnostics.Process.Start("https://github.com/bangonkali/Chron");
		}

		private void newEntryToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Form formEntry = new frmEntry();
			formEntry.ShowDialog();


		}

		private void txtBoxDiagnostics_TextChanged(object sender, EventArgs e)
		{

			txtBoxDiagnostics.SelectionStart = txtBoxDiagnostics.Text.Length;
			txtBoxDiagnostics.ScrollToCaret();
		}

	}
}
