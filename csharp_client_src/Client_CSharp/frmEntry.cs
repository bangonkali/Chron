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
		public string[] DaysOfWeek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Satruday" };
		public string[] MonthsOfYear = { "Jan", "Feb" };
		public frmEntry()
		{
			InitializeComponent();
		}

		private void frmEntry_Shown(object sender, EventArgs e)
		{
			DateTime now = DateTime.Now;

			cboDayClassifier.Items.Add("To");
			cboDayClassifier.Items.Add("Every After");
			
			cboHourClassifier.Items.Add("To");
			cboHourClassifier.Items.Add("Every After");

			cboMinuteClassifier.Items.Add("To");
			cboMinuteClassifier.Items.Add("Every After");

			cboWeekDayClassifier.Items.Add("To");
			cboWeekDayClassifier.Items.Add("Every After");

			cboYearClassifier.Items.Add("To");
			cboYearClassifier.Items.Add("Every After");

			cboMonthClassifier.Items.Add("To");
			cboMonthClassifier.Items.Add("Every After");

			cboDayLower.Items.Add("Every Day");
			for (short x = 0; x <= 31; x++)
			{
				cboDayLower.Items.Add(x.ToString());
				cboDayUpper.Items.Add(x.ToString());
			}

			cboMinuteLower.Items.Add("Every Minute");
			for (short x = 0; x < 60; x++)
			{
				cboMinuteLower.Items.Add(x.ToString());
				cboMinuteUpper.Items.Add(x.ToString());
			}

			now = DateTime.Now;
			cboYearLower.Items.Add("Every Year");
			for (short x = 0; x < 10; x++)
			{
				cboYearLower.Items.Add(now.ToString("yyyy"));
				cboYearUpper.Items.Add(now.ToString("yyyy"));
				now = now.AddYears(1);
			}

			now = DateTime.Now;
			cboMonthLower.Items.Add("Every Month");
			for (int i = 0; i < 12; i++)
			{
				cboMonthLower.Items.Add(now.ToString("MMMM"));
				cboMonthUpper.Items.Add(now.ToString("MMMM"));
				now = now.AddMonths(1);
			}

			cboHourLower.Items.Add("Every Hour");
			for (short x = 0; x < 60; x++)
			{
				cboHourLower.Items.Add(x.ToString());
				cboHourUpper.Items.Add(x.ToString());
			}

			cboWeekDayLower.Items.Add("Every Day of Week");
			for (short x = 0; x < 7; x++)
			{
				cboWeekDayLower.Items.Add(DaysOfWeek[x]);
				cboWeekDayUpper.Items.Add(DaysOfWeek[x]);
			}
		}

		private void frmEntry_Load(object sender, EventArgs e)
		{

		}
	}
}
