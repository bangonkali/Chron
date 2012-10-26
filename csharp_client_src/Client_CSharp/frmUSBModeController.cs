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
	public partial class frmUSBModeController : Form
	{
		public frmUSBModeController()
		{
			InitializeComponent();
		}

		private byte Checked2Byte(bool state) {
			if (state)
			{
				return (byte)1;
			}
			else
			{
				return (byte)0;
			}
		}

		private void cboDevice0_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)0, Checked2Byte(cboDevice0.Checked));
		}

		private void cboDevice1_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)1, Checked2Byte(cboDevice1.Checked));
		}

		private void cboDevice2_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)2, Checked2Byte(cboDevice2.Checked));
		}

		private void frmUSBModeController_Load(object sender, EventArgs e)
		{

		}

		private void cboDevice3_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)3, Checked2Byte(cboDevice3.Checked));
		}

		private void cboDevice7_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)7, Checked2Byte(cboDevice7.Checked));
		}

		private void cboDevice6_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)6, Checked2Byte(cboDevice6.Checked));
		}

		private void cboDevice5_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)5, Checked2Byte(cboDevice5.Checked));
		}

		private void cboDevice4_CheckedChanged(object sender, EventArgs e)
		{
			frmMain.chronManager.ChronOverride((byte)4, Checked2Byte(cboDevice4.Checked));
		}

		private void btnClose_Click(object sender, EventArgs e)
		{
			this.Hide();
		}
	}
}
