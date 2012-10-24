namespace Client_CSharp
{
	partial class frmEntry
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			this.btnSave = new System.Windows.Forms.Button();
			this.lblMinute = new System.Windows.Forms.Label();
			this.cboMinuteLower = new System.Windows.Forms.ComboBox();
			this.cboMinuteClassifier = new System.Windows.Forms.ComboBox();
			this.cboMinuteUpper = new System.Windows.Forms.ComboBox();
			this.cboHourUpper = new System.Windows.Forms.ComboBox();
			this.cboHourClassifier = new System.Windows.Forms.ComboBox();
			this.cboHourLower = new System.Windows.Forms.ComboBox();
			this.lblHour = new System.Windows.Forms.Label();
			this.cboDayUpper = new System.Windows.Forms.ComboBox();
			this.cboDayClassifier = new System.Windows.Forms.ComboBox();
			this.cboDayLower = new System.Windows.Forms.ComboBox();
			this.lblDay = new System.Windows.Forms.Label();
			this.cboWeekDayUpper = new System.Windows.Forms.ComboBox();
			this.cboWeekDayClassifier = new System.Windows.Forms.ComboBox();
			this.cboWeekDayLower = new System.Windows.Forms.ComboBox();
			this.lblWeekDay = new System.Windows.Forms.Label();
			this.cboMonthUpper = new System.Windows.Forms.ComboBox();
			this.cboMonthClassifier = new System.Windows.Forms.ComboBox();
			this.cboMonthLower = new System.Windows.Forms.ComboBox();
			this.lblMonth = new System.Windows.Forms.Label();
			this.cboYearUpper = new System.Windows.Forms.ComboBox();
			this.cboYearClassifier = new System.Windows.Forms.ComboBox();
			this.cboYearLower = new System.Windows.Forms.ComboBox();
			this.lblYear = new System.Windows.Forms.Label();
			this.lblDeviceID = new System.Windows.Forms.Label();
			this.cboDeviceID = new System.Windows.Forms.ComboBox();
			this.cboDeviceState = new System.Windows.Forms.ComboBox();
			this.lblDeviceState = new System.Windows.Forms.Label();
			this.btnClose = new System.Windows.Forms.Button();
			this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
			this.SuspendLayout();
			// 
			// btnSave
			// 
			this.btnSave.Location = new System.Drawing.Point(338, 242);
			this.btnSave.Name = "btnSave";
			this.btnSave.Size = new System.Drawing.Size(75, 23);
			this.btnSave.TabIndex = 0;
			this.btnSave.Text = "&Save";
			this.btnSave.UseVisualStyleBackColor = true;
			this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
			// 
			// lblMinute
			// 
			this.lblMinute.AutoSize = true;
			this.lblMinute.Location = new System.Drawing.Point(26, 69);
			this.lblMinute.Name = "lblMinute";
			this.lblMinute.Size = new System.Drawing.Size(39, 13);
			this.lblMinute.TabIndex = 1;
			this.lblMinute.Text = "&Minute";
			// 
			// cboMinuteLower
			// 
			this.cboMinuteLower.FormattingEnabled = true;
			this.cboMinuteLower.Location = new System.Drawing.Point(102, 66);
			this.cboMinuteLower.Name = "cboMinuteLower";
			this.cboMinuteLower.Size = new System.Drawing.Size(129, 21);
			this.cboMinuteLower.TabIndex = 2;
			this.cboMinuteLower.Text = "*";
			// 
			// cboMinuteClassifier
			// 
			this.cboMinuteClassifier.FormattingEnabled = true;
			this.cboMinuteClassifier.Location = new System.Drawing.Point(237, 66);
			this.cboMinuteClassifier.Name = "cboMinuteClassifier";
			this.cboMinuteClassifier.Size = new System.Drawing.Size(41, 21);
			this.cboMinuteClassifier.TabIndex = 5;
			// 
			// cboMinuteUpper
			// 
			this.cboMinuteUpper.FormattingEnabled = true;
			this.cboMinuteUpper.Location = new System.Drawing.Point(284, 66);
			this.cboMinuteUpper.Name = "cboMinuteUpper";
			this.cboMinuteUpper.Size = new System.Drawing.Size(129, 21);
			this.cboMinuteUpper.TabIndex = 6;
			// 
			// cboHourUpper
			// 
			this.cboHourUpper.FormattingEnabled = true;
			this.cboHourUpper.Location = new System.Drawing.Point(284, 93);
			this.cboHourUpper.Name = "cboHourUpper";
			this.cboHourUpper.Size = new System.Drawing.Size(129, 21);
			this.cboHourUpper.TabIndex = 11;
			// 
			// cboHourClassifier
			// 
			this.cboHourClassifier.FormattingEnabled = true;
			this.cboHourClassifier.Location = new System.Drawing.Point(237, 93);
			this.cboHourClassifier.Name = "cboHourClassifier";
			this.cboHourClassifier.Size = new System.Drawing.Size(41, 21);
			this.cboHourClassifier.TabIndex = 10;
			// 
			// cboHourLower
			// 
			this.cboHourLower.FormattingEnabled = true;
			this.cboHourLower.Location = new System.Drawing.Point(102, 93);
			this.cboHourLower.Name = "cboHourLower";
			this.cboHourLower.Size = new System.Drawing.Size(129, 21);
			this.cboHourLower.TabIndex = 9;
			this.cboHourLower.Text = "*";
			// 
			// lblHour
			// 
			this.lblHour.AutoSize = true;
			this.lblHour.Location = new System.Drawing.Point(26, 96);
			this.lblHour.Name = "lblHour";
			this.lblHour.Size = new System.Drawing.Size(30, 13);
			this.lblHour.TabIndex = 8;
			this.lblHour.Text = "Hour";
			// 
			// cboDayUpper
			// 
			this.cboDayUpper.FormattingEnabled = true;
			this.cboDayUpper.Location = new System.Drawing.Point(284, 120);
			this.cboDayUpper.Name = "cboDayUpper";
			this.cboDayUpper.Size = new System.Drawing.Size(129, 21);
			this.cboDayUpper.TabIndex = 16;
			// 
			// cboDayClassifier
			// 
			this.cboDayClassifier.FormattingEnabled = true;
			this.cboDayClassifier.Location = new System.Drawing.Point(237, 120);
			this.cboDayClassifier.Name = "cboDayClassifier";
			this.cboDayClassifier.Size = new System.Drawing.Size(41, 21);
			this.cboDayClassifier.TabIndex = 15;
			// 
			// cboDayLower
			// 
			this.cboDayLower.FormattingEnabled = true;
			this.cboDayLower.Location = new System.Drawing.Point(102, 120);
			this.cboDayLower.Name = "cboDayLower";
			this.cboDayLower.Size = new System.Drawing.Size(129, 21);
			this.cboDayLower.TabIndex = 14;
			this.cboDayLower.Text = "*";
			// 
			// lblDay
			// 
			this.lblDay.AutoSize = true;
			this.lblDay.Location = new System.Drawing.Point(26, 123);
			this.lblDay.Name = "lblDay";
			this.lblDay.Size = new System.Drawing.Size(26, 13);
			this.lblDay.TabIndex = 13;
			this.lblDay.Text = "Day";
			// 
			// cboWeekDayUpper
			// 
			this.cboWeekDayUpper.FormattingEnabled = true;
			this.cboWeekDayUpper.Location = new System.Drawing.Point(284, 147);
			this.cboWeekDayUpper.Name = "cboWeekDayUpper";
			this.cboWeekDayUpper.Size = new System.Drawing.Size(129, 21);
			this.cboWeekDayUpper.TabIndex = 21;
			// 
			// cboWeekDayClassifier
			// 
			this.cboWeekDayClassifier.FormattingEnabled = true;
			this.cboWeekDayClassifier.Location = new System.Drawing.Point(237, 147);
			this.cboWeekDayClassifier.Name = "cboWeekDayClassifier";
			this.cboWeekDayClassifier.Size = new System.Drawing.Size(41, 21);
			this.cboWeekDayClassifier.TabIndex = 20;
			// 
			// cboWeekDayLower
			// 
			this.cboWeekDayLower.FormattingEnabled = true;
			this.cboWeekDayLower.Location = new System.Drawing.Point(102, 147);
			this.cboWeekDayLower.Name = "cboWeekDayLower";
			this.cboWeekDayLower.Size = new System.Drawing.Size(129, 21);
			this.cboWeekDayLower.TabIndex = 19;
			this.cboWeekDayLower.Text = "*";
			// 
			// lblWeekDay
			// 
			this.lblWeekDay.AutoSize = true;
			this.lblWeekDay.Location = new System.Drawing.Point(26, 150);
			this.lblWeekDay.Name = "lblWeekDay";
			this.lblWeekDay.Size = new System.Drawing.Size(58, 13);
			this.lblWeekDay.TabIndex = 18;
			this.lblWeekDay.Text = "Week Day";
			// 
			// cboMonthUpper
			// 
			this.cboMonthUpper.FormattingEnabled = true;
			this.cboMonthUpper.Location = new System.Drawing.Point(284, 174);
			this.cboMonthUpper.Name = "cboMonthUpper";
			this.cboMonthUpper.Size = new System.Drawing.Size(129, 21);
			this.cboMonthUpper.TabIndex = 26;
			// 
			// cboMonthClassifier
			// 
			this.cboMonthClassifier.FormattingEnabled = true;
			this.cboMonthClassifier.Location = new System.Drawing.Point(237, 174);
			this.cboMonthClassifier.Name = "cboMonthClassifier";
			this.cboMonthClassifier.Size = new System.Drawing.Size(41, 21);
			this.cboMonthClassifier.TabIndex = 25;
			// 
			// cboMonthLower
			// 
			this.cboMonthLower.FormattingEnabled = true;
			this.cboMonthLower.Location = new System.Drawing.Point(102, 174);
			this.cboMonthLower.Name = "cboMonthLower";
			this.cboMonthLower.Size = new System.Drawing.Size(129, 21);
			this.cboMonthLower.TabIndex = 24;
			this.cboMonthLower.Text = "*";
			// 
			// lblMonth
			// 
			this.lblMonth.AutoSize = true;
			this.lblMonth.Location = new System.Drawing.Point(26, 177);
			this.lblMonth.Name = "lblMonth";
			this.lblMonth.Size = new System.Drawing.Size(37, 13);
			this.lblMonth.TabIndex = 23;
			this.lblMonth.Text = "Month";
			// 
			// cboYearUpper
			// 
			this.cboYearUpper.FormattingEnabled = true;
			this.cboYearUpper.Location = new System.Drawing.Point(284, 201);
			this.cboYearUpper.Name = "cboYearUpper";
			this.cboYearUpper.Size = new System.Drawing.Size(129, 21);
			this.cboYearUpper.TabIndex = 31;
			// 
			// cboYearClassifier
			// 
			this.cboYearClassifier.FormattingEnabled = true;
			this.cboYearClassifier.Location = new System.Drawing.Point(237, 201);
			this.cboYearClassifier.Name = "cboYearClassifier";
			this.cboYearClassifier.Size = new System.Drawing.Size(41, 21);
			this.cboYearClassifier.TabIndex = 30;
			// 
			// cboYearLower
			// 
			this.cboYearLower.FormattingEnabled = true;
			this.cboYearLower.Location = new System.Drawing.Point(102, 201);
			this.cboYearLower.Name = "cboYearLower";
			this.cboYearLower.Size = new System.Drawing.Size(129, 21);
			this.cboYearLower.TabIndex = 29;
			this.cboYearLower.Text = "*";
			// 
			// lblYear
			// 
			this.lblYear.AutoSize = true;
			this.lblYear.Location = new System.Drawing.Point(26, 204);
			this.lblYear.Name = "lblYear";
			this.lblYear.Size = new System.Drawing.Size(29, 13);
			this.lblYear.TabIndex = 28;
			this.lblYear.Text = "Year";
			// 
			// lblDeviceID
			// 
			this.lblDeviceID.AutoSize = true;
			this.lblDeviceID.Location = new System.Drawing.Point(26, 27);
			this.lblDeviceID.Name = "lblDeviceID";
			this.lblDeviceID.Size = new System.Drawing.Size(55, 13);
			this.lblDeviceID.TabIndex = 33;
			this.lblDeviceID.Text = "&Device ID";
			// 
			// cboDeviceID
			// 
			this.cboDeviceID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cboDeviceID.FormattingEnabled = true;
			this.cboDeviceID.Location = new System.Drawing.Point(102, 24);
			this.cboDeviceID.Name = "cboDeviceID";
			this.cboDeviceID.Size = new System.Drawing.Size(76, 21);
			this.cboDeviceID.TabIndex = 34;
			// 
			// cboDeviceState
			// 
			this.cboDeviceState.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cboDeviceState.FormattingEnabled = true;
			this.cboDeviceState.Location = new System.Drawing.Point(266, 24);
			this.cboDeviceState.Name = "cboDeviceState";
			this.cboDeviceState.Size = new System.Drawing.Size(76, 21);
			this.cboDeviceState.TabIndex = 36;
			// 
			// lblDeviceState
			// 
			this.lblDeviceState.AutoSize = true;
			this.lblDeviceState.Location = new System.Drawing.Point(190, 27);
			this.lblDeviceState.Name = "lblDeviceState";
			this.lblDeviceState.Size = new System.Drawing.Size(69, 13);
			this.lblDeviceState.TabIndex = 35;
			this.lblDeviceState.Text = "Device &State";
			// 
			// btnClose
			// 
			this.btnClose.Location = new System.Drawing.Point(257, 242);
			this.btnClose.Name = "btnClose";
			this.btnClose.Size = new System.Drawing.Size(75, 23);
			this.btnClose.TabIndex = 37;
			this.btnClose.Text = "&Close";
			this.btnClose.UseVisualStyleBackColor = true;
			// 
			// frmEntry
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(443, 302);
			this.Controls.Add(this.btnClose);
			this.Controls.Add(this.cboDeviceState);
			this.Controls.Add(this.lblDeviceState);
			this.Controls.Add(this.cboDeviceID);
			this.Controls.Add(this.lblDeviceID);
			this.Controls.Add(this.cboYearUpper);
			this.Controls.Add(this.cboYearClassifier);
			this.Controls.Add(this.cboYearLower);
			this.Controls.Add(this.lblYear);
			this.Controls.Add(this.cboMonthUpper);
			this.Controls.Add(this.cboMonthClassifier);
			this.Controls.Add(this.cboMonthLower);
			this.Controls.Add(this.lblMonth);
			this.Controls.Add(this.cboWeekDayUpper);
			this.Controls.Add(this.cboWeekDayClassifier);
			this.Controls.Add(this.cboWeekDayLower);
			this.Controls.Add(this.lblWeekDay);
			this.Controls.Add(this.cboDayUpper);
			this.Controls.Add(this.cboDayClassifier);
			this.Controls.Add(this.cboDayLower);
			this.Controls.Add(this.lblDay);
			this.Controls.Add(this.cboHourUpper);
			this.Controls.Add(this.cboHourClassifier);
			this.Controls.Add(this.cboHourLower);
			this.Controls.Add(this.lblHour);
			this.Controls.Add(this.cboMinuteUpper);
			this.Controls.Add(this.cboMinuteClassifier);
			this.Controls.Add(this.cboMinuteLower);
			this.Controls.Add(this.lblMinute);
			this.Controls.Add(this.btnSave);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmEntry";
			this.Text = "Chron Schedule Entry";
			this.Load += new System.EventHandler(this.frmEntry_Load);
			this.Shown += new System.EventHandler(this.frmEntry_Shown);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnSave;
		private System.Windows.Forms.Label lblMinute;
		private System.Windows.Forms.ComboBox cboMinuteLower;
		private System.Windows.Forms.ComboBox cboMinuteClassifier;
		private System.Windows.Forms.ComboBox cboMinuteUpper;
		private System.Windows.Forms.ComboBox cboHourUpper;
		private System.Windows.Forms.ComboBox cboHourClassifier;
		private System.Windows.Forms.ComboBox cboHourLower;
		private System.Windows.Forms.Label lblHour;
		private System.Windows.Forms.ComboBox cboDayUpper;
		private System.Windows.Forms.ComboBox cboDayClassifier;
		private System.Windows.Forms.ComboBox cboDayLower;
		private System.Windows.Forms.Label lblDay;
		private System.Windows.Forms.ComboBox cboWeekDayUpper;
		private System.Windows.Forms.ComboBox cboWeekDayClassifier;
		private System.Windows.Forms.ComboBox cboWeekDayLower;
		private System.Windows.Forms.Label lblWeekDay;
		private System.Windows.Forms.ComboBox cboMonthUpper;
		private System.Windows.Forms.ComboBox cboMonthClassifier;
		private System.Windows.Forms.ComboBox cboMonthLower;
		private System.Windows.Forms.Label lblMonth;
		private System.Windows.Forms.ComboBox cboYearUpper;
		private System.Windows.Forms.ComboBox cboYearClassifier;
		private System.Windows.Forms.ComboBox cboYearLower;
		private System.Windows.Forms.Label lblYear;
		private System.Windows.Forms.Label lblDeviceID;
		private System.Windows.Forms.ComboBox cboDeviceID;
		private System.Windows.Forms.ComboBox cboDeviceState;
		private System.Windows.Forms.Label lblDeviceState;
		private System.Windows.Forms.Button btnClose;
		private System.IO.Ports.SerialPort serialPort1;
	}
}