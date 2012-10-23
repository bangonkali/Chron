using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Client_CSharp
{
	public partial class frmEntry : Form
	{
		public byte[] ByteArray = new byte[21];

		public byte[] GetResult() {
			return ByteArray;
		}

		public frmEntry()
		{
			InitializeComponent();
		}

		private void frmEntry_Shown(object sender, EventArgs e)
		{
			DateTime now = DateTime.Now;

			cboDeviceID.Items.Add("*");
			cboDeviceID.SelectedIndex = 0;
			for (short x = 0; x < 8; x++)
			{
				cboDeviceID.Items.Add(x.ToString());
			}

			cboDayClassifier.Items.Add("-");
			cboDayClassifier.Items.Add("/");
			
			cboHourClassifier.Items.Add("-");
			cboHourClassifier.Items.Add("/");

			cboMinuteClassifier.Items.Add("-");
			cboMinuteClassifier.Items.Add("/");

			cboWeekDayClassifier.Items.Add("-");
			cboWeekDayClassifier.Items.Add("/");

			cboYearClassifier.Items.Add("-");
			cboYearClassifier.Items.Add("/");

			cboMonthClassifier.Items.Add("-");
			cboMonthClassifier.Items.Add("/");

			cboDayLower.Items.Add("*");
			for (short x = 0; x <= 31; x++)
			{
				cboDayLower.Items.Add(x.ToString());
				cboDayUpper.Items.Add(x.ToString());
			}

			cboMinuteLower.Items.Add("*");
			for (short x = 0; x < 60; x++)
			{
				cboMinuteLower.Items.Add(x.ToString());
				cboMinuteUpper.Items.Add(x.ToString());
			}

			now = DateTime.Now;
			cboYearLower.Items.Add("*");
			for (short x = 0; x < 10; x++)
			{
				cboYearLower.Items.Add(now.ToString("yy"));
				cboYearUpper.Items.Add(now.ToString("yy"));
				now = now.AddYears(1);
			}

			now = DateTime.Now;
			cboMonthLower.Items.Add("*");
			for (int i = 0; i < 12; i++)
			{
				cboMonthLower.Items.Add(now.ToString("MM"));
				cboMonthUpper.Items.Add(now.ToString("MM"));
				now = now.AddMonths(1);
			}

			cboHourLower.Items.Add("*");
			for (short x = 0; x < 60; x++)
			{
				cboHourLower.Items.Add(x.ToString());
				cboHourUpper.Items.Add(x.ToString());
			}

			cboWeekDayLower.Items.Add("*");
			for (short x = 0; x < 7; x++)
			{
				cboWeekDayLower.Items.Add(x);
				cboWeekDayUpper.Items.Add(x);
			}

			cboDeviceState.Items.Add("On");
			cboDeviceState.Items.Add("Off");
			cboDeviceState.SelectedIndex = 0;

		}

		private void frmEntry_Load(object sender, EventArgs e)
		{

		}

		public ChronCore.ChronEntry entry = new ChronCore.ChronEntry();

		private void btnSave_Click(object sender, EventArgs e)
		{
			bool success = false;

			try
			{
				Save();
				success = true;
			}
			catch (Exception ex)
			{
				MessageBox.Show(this, ex.Message);
				success = false;
			}

			if (success)
			{
				if (checkedcount > 0)
				{
					entry.mEntry = ByteArray;
					btnSave.DialogResult = DialogResult.OK;
					this.Hide();
				}
				else
				{
					MessageBox.Show("Must at least check one entry.");
				}

			}
		}

		int checkedcount = 0;

		private void Save()
		{
			checkedcount = 0;

			ByteArray[0] = 1;
			ByteArray[1] = fastParse(cboDeviceID.Text.ToString());
			ByteArray[2] = fastParse(cboDeviceState.Text.ToString());

			if (cboMinuteEnable.Checked)
			{
				checkedcount++;
			}

			ByteArray[3] = fastParse(cboMinuteLower.Text.ToString());
			ByteArray[4] = fastParse(cboMinuteClassifier.Text.ToString());
			ByteArray[5] = fastParse(cboMinuteUpper.Text.ToString());

			if (cboHourEnable.Checked)
			{
				checkedcount++;
			}

			ByteArray[6] = fastParse(cboHourLower.Text.ToString());
			ByteArray[7] = fastParse(cboHourClassifier.Text.ToString());
			ByteArray[8] = fastParse(cboHourUpper.Text.ToString());

			if (cboDayEnable.Checked)
			{
				checkedcount++;
			}
			ByteArray[9] = fastParse(cboDayLower.Text.ToString());
			ByteArray[10] = fastParse(cboDayClassifier.Text.ToString());
			ByteArray[11] = fastParse(cboDayUpper.Text.ToString());

			if (cboWeekDayEnable.Checked)
			{
				checkedcount++;
			}
			ByteArray[12] = fastParse(cboWeekDayLower.Text.ToString());
			ByteArray[13] = fastParse(cboWeekDayClassifier.Text.ToString());
			ByteArray[14] = fastParse(cboWeekDayUpper.Text.ToString());

			if (cboMonthEnable.Checked)
			{
				checkedcount++;
			}
			ByteArray[15] = fastParse(cboMonthLower.Text.ToString());
			ByteArray[16] = fastParse(cboMonthClassifier.Text.ToString());
			ByteArray[17] = fastParse(cboMonthUpper.Text.ToString());

			if (cboYearEnable.Checked)
			{
				checkedcount++;
			}
			ByteArray[18] = fastParse(cboYearLower.Text.ToString());
			ByteArray[19] = fastParse(cboYearClassifier.Text.ToString());
			ByteArray[20] = fastParse(cboYearUpper.Text.ToString());
		}

		public ChronCore.ChronEntry EntryResult { get { return entry; } }

		private byte fastParse(string i)
		{
			byte mybuffer = 0;

			if (i == "*")
				return 255;

			if (i == "-")
				return 254;

			if (i == "/")
				return 253;

			if (i == "On")
				return 252;

			if (i == "Off")
				return 251;

			if (i == "")
				return 250;

			if (byte.TryParse(i, out mybuffer))
			{
				return mybuffer;
			}
			else
			{
				return 250;
			}
		}
	}
}
