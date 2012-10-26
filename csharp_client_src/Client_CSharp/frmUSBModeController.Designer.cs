namespace Client_CSharp
{
	partial class frmUSBModeController
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
			this.btnClose = new System.Windows.Forms.Button();
			this.cboDevice0 = new System.Windows.Forms.CheckBox();
			this.cboDevice1 = new System.Windows.Forms.CheckBox();
			this.cboDevice3 = new System.Windows.Forms.CheckBox();
			this.cboDevice2 = new System.Windows.Forms.CheckBox();
			this.cboDevice7 = new System.Windows.Forms.CheckBox();
			this.cboDevice6 = new System.Windows.Forms.CheckBox();
			this.cboDevice5 = new System.Windows.Forms.CheckBox();
			this.cboDevice4 = new System.Windows.Forms.CheckBox();
			this.SuspendLayout();
			// 
			// btnClose
			// 
			this.btnClose.Location = new System.Drawing.Point(149, 142);
			this.btnClose.Name = "btnClose";
			this.btnClose.Size = new System.Drawing.Size(75, 23);
			this.btnClose.TabIndex = 0;
			this.btnClose.Text = "&Close";
			this.btnClose.UseVisualStyleBackColor = true;
			this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
			// 
			// cboDevice0
			// 
			this.cboDevice0.AutoSize = true;
			this.cboDevice0.Location = new System.Drawing.Point(37, 29);
			this.cboDevice0.Name = "cboDevice0";
			this.cboDevice0.Size = new System.Drawing.Size(69, 17);
			this.cboDevice0.TabIndex = 1;
			this.cboDevice0.Text = "Device 0";
			this.cboDevice0.UseVisualStyleBackColor = true;
			this.cboDevice0.CheckedChanged += new System.EventHandler(this.cboDevice0_CheckedChanged);
			// 
			// cboDevice1
			// 
			this.cboDevice1.AutoSize = true;
			this.cboDevice1.Location = new System.Drawing.Point(37, 52);
			this.cboDevice1.Name = "cboDevice1";
			this.cboDevice1.Size = new System.Drawing.Size(69, 17);
			this.cboDevice1.TabIndex = 2;
			this.cboDevice1.Text = "Device 1";
			this.cboDevice1.UseVisualStyleBackColor = true;
			this.cboDevice1.CheckedChanged += new System.EventHandler(this.cboDevice1_CheckedChanged);
			// 
			// cboDevice3
			// 
			this.cboDevice3.AutoSize = true;
			this.cboDevice3.Location = new System.Drawing.Point(37, 98);
			this.cboDevice3.Name = "cboDevice3";
			this.cboDevice3.Size = new System.Drawing.Size(69, 17);
			this.cboDevice3.TabIndex = 4;
			this.cboDevice3.Text = "Device 3";
			this.cboDevice3.UseVisualStyleBackColor = true;
			this.cboDevice3.CheckedChanged += new System.EventHandler(this.cboDevice3_CheckedChanged);
			// 
			// cboDevice2
			// 
			this.cboDevice2.AutoSize = true;
			this.cboDevice2.Location = new System.Drawing.Point(37, 75);
			this.cboDevice2.Name = "cboDevice2";
			this.cboDevice2.Size = new System.Drawing.Size(69, 17);
			this.cboDevice2.TabIndex = 3;
			this.cboDevice2.Text = "Device 2";
			this.cboDevice2.UseVisualStyleBackColor = true;
			this.cboDevice2.CheckedChanged += new System.EventHandler(this.cboDevice2_CheckedChanged);
			// 
			// cboDevice7
			// 
			this.cboDevice7.AutoSize = true;
			this.cboDevice7.Location = new System.Drawing.Point(155, 98);
			this.cboDevice7.Name = "cboDevice7";
			this.cboDevice7.Size = new System.Drawing.Size(69, 17);
			this.cboDevice7.TabIndex = 8;
			this.cboDevice7.Text = "Device 7";
			this.cboDevice7.UseVisualStyleBackColor = true;
			this.cboDevice7.CheckedChanged += new System.EventHandler(this.cboDevice7_CheckedChanged);
			// 
			// cboDevice6
			// 
			this.cboDevice6.AutoSize = true;
			this.cboDevice6.Location = new System.Drawing.Point(155, 75);
			this.cboDevice6.Name = "cboDevice6";
			this.cboDevice6.Size = new System.Drawing.Size(69, 17);
			this.cboDevice6.TabIndex = 7;
			this.cboDevice6.Text = "Device 6";
			this.cboDevice6.UseVisualStyleBackColor = true;
			this.cboDevice6.CheckedChanged += new System.EventHandler(this.cboDevice6_CheckedChanged);
			// 
			// cboDevice5
			// 
			this.cboDevice5.AutoSize = true;
			this.cboDevice5.Location = new System.Drawing.Point(155, 52);
			this.cboDevice5.Name = "cboDevice5";
			this.cboDevice5.Size = new System.Drawing.Size(69, 17);
			this.cboDevice5.TabIndex = 6;
			this.cboDevice5.Text = "Device 5";
			this.cboDevice5.UseVisualStyleBackColor = true;
			this.cboDevice5.CheckedChanged += new System.EventHandler(this.cboDevice5_CheckedChanged);
			// 
			// cboDevice4
			// 
			this.cboDevice4.AutoSize = true;
			this.cboDevice4.Location = new System.Drawing.Point(155, 29);
			this.cboDevice4.Name = "cboDevice4";
			this.cboDevice4.Size = new System.Drawing.Size(69, 17);
			this.cboDevice4.TabIndex = 5;
			this.cboDevice4.Text = "Device 4";
			this.cboDevice4.UseVisualStyleBackColor = true;
			this.cboDevice4.CheckedChanged += new System.EventHandler(this.cboDevice4_CheckedChanged);
			// 
			// frmUSBModeController
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(264, 187);
			this.Controls.Add(this.cboDevice7);
			this.Controls.Add(this.cboDevice6);
			this.Controls.Add(this.cboDevice5);
			this.Controls.Add(this.cboDevice4);
			this.Controls.Add(this.cboDevice3);
			this.Controls.Add(this.cboDevice2);
			this.Controls.Add(this.cboDevice1);
			this.Controls.Add(this.cboDevice0);
			this.Controls.Add(this.btnClose);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmUSBModeController";
			this.Text = "USB Mode Control";
			this.Load += new System.EventHandler(this.frmUSBModeController_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnClose;
		public System.Windows.Forms.CheckBox cboDevice0;
		public System.Windows.Forms.CheckBox cboDevice1;
		public System.Windows.Forms.CheckBox cboDevice3;
		public System.Windows.Forms.CheckBox cboDevice2;
		public System.Windows.Forms.CheckBox cboDevice7;
		public System.Windows.Forms.CheckBox cboDevice6;
		public System.Windows.Forms.CheckBox cboDevice5;
		public System.Windows.Forms.CheckBox cboDevice4;
	}
}