using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

using ChronCore;

namespace Client_CSharp
{
	public partial class frmMain : Form
	{
		private frmUSBModeController mOverrideControl = new frmUSBModeController();
		private string previousfilename = "";
		public static ChronManager chronManager = new ChronManager();
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

			lstEntries.View = View.Details;
			lstEntries.GridLines = true;
			lstEntries.FullRowSelect = true;

			lstEntries.Columns.Add("Device");
			lstEntries.Columns.Add("ID");
			lstEntries.Columns.Add("State");
			lstEntries.Columns.Add("Minute");
			lstEntries.Columns.Add("Hour");
			lstEntries.Columns.Add("Day");
			lstEntries.Columns.Add("Week Day");
			lstEntries.Columns.Add("Month");
			lstEntries.Columns.Add("Year");

			
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

			if (e.State.Overidden)
			{
				//mOverrideControl.cboDevice0.Checked = Byte2Bit(e.State.GetData()[0]);
				//mOverrideControl.cboDevice1.Checked = Byte2Bit(e.State.GetData()[1]);
				//mOverrideControl.cboDevice2.Checked = Byte2Bit(e.State.GetData()[2]);
				//mOverrideControl.cboDevice3.Checked = Byte2Bit(e.State.GetData()[3]);
				//mOverrideControl.cboDevice4.Checked = Byte2Bit(e.State.GetData()[4]);
				//mOverrideControl.cboDevice5.Checked = Byte2Bit(e.State.GetData()[5]);
				//mOverrideControl.cboDevice6.Checked = Byte2Bit(e.State.GetData()[6]);
				//mOverrideControl.cboDevice7.Checked = Byte2Bit(e.State.GetData()[7]);

			}

			txtBoxDiagnostics.Text += e.State.Diagnostics + "\r\n";
			// System.Diagnostics.Debug.WriteLine("Chron Device removed.");
		}

		private bool Byte2Bit(byte i)
		{
			if (i == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
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

		private void mnuGetCronTime_Click(object sender, EventArgs e)
		{
			chronManager.GetCronTime();
		}

		private void writeCron01ToolStripMenuItem_Click(object sender, EventArgs e)
		{
			chronManager.WriteCronData(items);

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


		ChronEntries items = new ChronEntries();
		private void newEntryToolStripMenuItem_Click(object sender, EventArgs e)
		{
			ChronCore.ChronEntry result = new ChronCore.ChronEntry();
			frmEntry formEntry = new frmEntry();
			formEntry.ShowDialog(this);
			{
				result = formEntry.EntryResult;
				addEntryToListView(result);
				items.entries.Add(result);
			}
		}

		private void updateListView()
		{
			lstEntries.Items.Clear();
			int j = items.entries.Count;
			for (int k = 0; k < j; k++)
			{
				addEntryToListView(items.entries[k]);
			}
		}

		private void addEntryToListView(ChronEntry result)
		{
			ListViewItem item = new ListViewItem(new[]{
					result.mID.ToString(),
					byte2str(result.mEntry[1]),
					byte2str(result.mEntry[2]),
					byte2str(result.mEntry[3]) + byte2str(result.mEntry[4]) + byte2str(result.mEntry[5]),
					byte2str(result.mEntry[6]) + byte2str(result.mEntry[7]) + byte2str(result.mEntry[8]),
					byte2str(result.mEntry[9]) + byte2str(result.mEntry[10]) + byte2str(result.mEntry[11]),
					byte2str(result.mEntry[12]) + byte2str(result.mEntry[13]) + byte2str(result.mEntry[14]),
					byte2str(result.mEntry[15]) + byte2str(result.mEntry[16]) + byte2str(result.mEntry[17]),
					byte2str(result.mEntry[18]) + byte2str(result.mEntry[19]) + byte2str(result.mEntry[20])
				});
			item.Tag = result.mID;
			lstEntries.Items.Add(item);
		}

		private void txtBoxDiagnostics_TextChanged(object sender, EventArgs e)
		{
		}

		private string byte2str(byte i) 
		{
			switch (i)
			{
				case 255: return "*";
				case 254: return "-";
				case 253: return "/";
				case 252: return "On";
				case 251: return "Off";
				case 250: return "";
				default: return i.ToString();
			}
		}

		private void enableEntryToolStripMenuItem_Click(object sender, EventArgs e)
		{

		}

		private void saveprocedure(string path)
		{
			try
			{
				using (Stream stream = File.Open(path, FileMode.Create))
				{
					BinaryFormatter bin = new BinaryFormatter();
					bin.Serialize(stream, items);
				}
			}
			catch (IOException g)
			{
				MessageBox.Show(g.Message);
			}
		}

		private void saveSequence()
		{
			if (previousfilename.Length > 0)
			{
				saveprocedure(previousfilename);
			}
			else
			{
				SaveFileDialog s = new SaveFileDialog();
				s.DefaultExt = ".joh";
				s.Filter = "Chron Files (.joh)|*.joh";

				if (DialogResult.OK == s.ShowDialog())
				{
					saveprocedure(s.FileName);
					previousfilename = s.FileName;
				}
			}
		}

		private void saveToolStripMenuItem_Click(object sender, EventArgs e)
		{
			saveSequence();
		}

		private void open()
		{

			OpenFileDialog o = new OpenFileDialog();
			o.DefaultExt = ".joh";
			o.Filter = "Chron Files (.joh)|*.joh";
			if (DialogResult.OK == o.ShowDialog())
			{
				try
				{
					using (Stream stream = File.Open(o.FileName, FileMode.Open))
					{
						previousfilename = o.FileName;

						BinaryFormatter bin = new BinaryFormatter();

						items.entries.Clear();
						items = (ChronEntries)bin.Deserialize(stream);
						updateListView();
					}
				}
				catch (IOException g)
				{
					MessageBox.Show(g.Message);
				}
			}
		}

		private void openToolStripMenuItem_Click(object sender, EventArgs e)
		{
			open();
		}

		private void deleteEntryToolStripMenuItem_Click(object sender, EventArgs e)
		{
			int bufferid = 0, index;
			for (int x = 0; x < lstEntries.SelectedItems.Count; x++)
			{
				bufferid = (int)lstEntries.SelectedItems[x].Tag;
				index = lstEntries.SelectedIndices[x];
				lstEntries.Items.RemoveAt(index);
			}
			for (int y = 0; y < items.entries.Count; y++)
			{
				if (items.entries[y].mID == bufferid)
				{
					items.entries.RemoveAt(y);
				}
			}
		}

		private void newDocu()
		{

			DialogResult d = MessageBox.Show(this, "You will lose all unsaved changes! Do you want to save first?", "Notification", MessageBoxButtons.YesNoCancel);
			if (d == DialogResult.Yes)
			{
				saveSequence();
				items.entries.Clear();
				lstEntries.Items.Clear();
			}
			else if (d == DialogResult.No)
			{
				items.entries.Clear();
				lstEntries.Items.Clear();
			}
		}

		private void newToolStripMenuItem_Click(object sender, EventArgs e)
		{
            newDocu();
		}

		private void toolStripMenuItem2_Click(object sender, EventArgs e)
		{
			txtBoxDiagnostics.Text = "";
		}

		private void helpToolStripButton_Click(object sender, EventArgs e)
		{
			System.Diagnostics.Process.Start("https://github.com/bangonkali/Chron");
		}

		private void newToolStripButton_Click(object sender, EventArgs e)
		{
			newDocu();
		}

		private void openToolStripButton_Click(object sender, EventArgs e)
		{
			open();
		}

		private void saveToolStripButton_Click(object sender, EventArgs e)
		{
			saveSequence();
		}

		private void saveAsToolStripMenuItem_Click(object sender, EventArgs e)
		{
			saveprocedure(previousfilename);
		}

		private void readToolStripMenuItem_Click(object sender, EventArgs e)
		{
			chronManager.GetCronData();
		}

		private void dummiesToolStripMenuItem_Click(object sender, EventArgs e)
		{
			int entrycount = 0;
			byte m = (byte)(DateTime.Now.Minute + 2);

			for (int w = 0; w < 6; w++)
			{
				if (entrycount == 95) break;
				for (int i = 0; i < 8; i++)
				{
					if (entrycount == 95) break;
					ChronEntry df = new ChronEntry();
					df.mEntry[0] = (byte)1;
					df.mEntry[1] = (byte)i;
					df.mEntry[2] = (byte)252;
					df.mEntry[3] = (byte)(m + w);
					df.mEntry[4] = (byte)250; // emptysk
					df.mEntry[5] = (byte)250; // empty
					df.mEntry[6] = (byte)(DateTime.Now.Hour);
					df.mEntry[7] = (byte)250; // empty
					df.mEntry[8] = (byte)250; // empty
					df.mEntry[9] = (byte)(DateTime.Now.Day);
					df.mEntry[10] = (byte)250; // empty
					df.mEntry[11] = (byte)250; // empty
					df.mEntry[12] = (byte)(DateTime.Now.DayOfWeek + 1); // this bug took hours to fix
					df.mEntry[13] = (byte)250; // empty
					df.mEntry[14] = (byte)250; // empty
					df.mEntry[15] = (byte)(DateTime.Now.Month);
					df.mEntry[16] = (byte)250; // empty
					df.mEntry[17] = (byte)250; // empty
					df.mEntry[18] = (byte)(DateTime.Now.Year - 2000);
					df.mEntry[19] = (byte)250; // empty
					df.mEntry[20] = (byte)250; // empty

					addEntryToListView(df);
					items.entries.Add(df);
					entrycount++;

					if (entrycount == 95) break;
					df = new ChronEntry();
					df.mEntry[0] = (byte)1;
					df.mEntry[1] = (byte)i;
					df.mEntry[2] = (byte)251; // off
					df.mEntry[3] = (byte)(m + 1 + w);
					df.mEntry[4] = (byte)250; // emptysk
					df.mEntry[5] = (byte)250; // empty
					df.mEntry[6] = (byte)(DateTime.Now.Hour);
					df.mEntry[7] = (byte)250; // empty
					df.mEntry[8] = (byte)250; // empty
					df.mEntry[9] = (byte)(DateTime.Now.Day);
					df.mEntry[10] = (byte)250; // empty
					df.mEntry[11] = (byte)250; // empty
					df.mEntry[12] = (byte)(DateTime.Now.DayOfWeek + 1); // this bug took hours to fix
					df.mEntry[13] = (byte)250; // empty
					df.mEntry[14] = (byte)250; // empty
					df.mEntry[15] = (byte)(DateTime.Now.Month);
					df.mEntry[16] = (byte)250; // empty
					df.mEntry[17] = (byte)250; // empty
					df.mEntry[18] = (byte)(DateTime.Now.Year - 2000);
					df.mEntry[19] = (byte)250; // empty
					df.mEntry[20] = (byte)250; // empty				 

					addEntryToListView(df);
					items.entries.Add(df);
					entrycount++;
				}
				
				m++;
			}
		}

		private void txtBoxDiagnostics_TextChanged_1(object sender, EventArgs e)
		{
			txtBoxDiagnostics.SelectionStart = txtBoxDiagnostics.Text.Length;
			txtBoxDiagnostics.ScrollToCaret();
		}

		private void uSBOverrideToolStripMenuItem_Click(object sender, EventArgs e)
		{
			mOverrideControl.ShowDialog(this);
		}
	}
}
