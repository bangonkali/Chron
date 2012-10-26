namespace Client_CSharp
{
	partial class frmAbout
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAbout));
			this.logoPictureBox = new System.Windows.Forms.PictureBox();
			this.lblDescription = new System.Windows.Forms.TextBox();
			this.btnOk = new System.Windows.Forms.Button();
			this.lblProductName = new System.Windows.Forms.Label();
			this.lblCopyRight = new System.Windows.Forms.Label();
			this.lblVersion = new System.Windows.Forms.Label();
			this.lblCompanyName = new System.Windows.Forms.Label();
			this.lnkSite = new System.Windows.Forms.LinkLabel();
			((System.ComponentModel.ISupportInitialize)(this.logoPictureBox)).BeginInit();
			this.SuspendLayout();
			// 
			// logoPictureBox
			// 
			this.logoPictureBox.Image = ((System.Drawing.Image)(resources.GetObject("logoPictureBox.Image")));
			this.logoPictureBox.Location = new System.Drawing.Point(12, 12);
			this.logoPictureBox.Name = "logoPictureBox";
			this.logoPictureBox.Size = new System.Drawing.Size(131, 259);
			this.logoPictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.logoPictureBox.TabIndex = 12;
			this.logoPictureBox.TabStop = false;
			// 
			// lblDescription
			// 
			this.lblDescription.Location = new System.Drawing.Point(152, 67);
			this.lblDescription.Margin = new System.Windows.Forms.Padding(6, 3, 3, 3);
			this.lblDescription.Multiline = true;
			this.lblDescription.Name = "lblDescription";
			this.lblDescription.ReadOnly = true;
			this.lblDescription.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.lblDescription.Size = new System.Drawing.Size(297, 204);
			this.lblDescription.TabIndex = 23;
			this.lblDescription.TabStop = false;
			this.lblDescription.Text = "Description";
			// 
			// btnOk
			// 
			this.btnOk.Location = new System.Drawing.Point(374, 277);
			this.btnOk.Name = "btnOk";
			this.btnOk.Size = new System.Drawing.Size(75, 23);
			this.btnOk.TabIndex = 24;
			this.btnOk.Text = "&Ok";
			this.btnOk.UseVisualStyleBackColor = true;
			this.btnOk.Click += new System.EventHandler(this.okButton_Click);
			// 
			// lblProductName
			// 
			this.lblProductName.AutoSize = true;
			this.lblProductName.Location = new System.Drawing.Point(149, 12);
			this.lblProductName.Name = "lblProductName";
			this.lblProductName.Size = new System.Drawing.Size(82, 13);
			this.lblProductName.TabIndex = 25;
			this.lblProductName.Text = "lblProductName";
			// 
			// lblCopyRight
			// 
			this.lblCopyRight.AutoSize = true;
			this.lblCopyRight.Location = new System.Drawing.Point(149, 25);
			this.lblCopyRight.Name = "lblCopyRight";
			this.lblCopyRight.Size = new System.Drawing.Size(66, 13);
			this.lblCopyRight.TabIndex = 26;
			this.lblCopyRight.Text = "lblCopyRight";
			// 
			// lblVersion
			// 
			this.lblVersion.AutoSize = true;
			this.lblVersion.Location = new System.Drawing.Point(149, 38);
			this.lblVersion.Name = "lblVersion";
			this.lblVersion.Size = new System.Drawing.Size(52, 13);
			this.lblVersion.TabIndex = 27;
			this.lblVersion.Text = "lblVersion";
			// 
			// lblCompanyName
			// 
			this.lblCompanyName.AutoSize = true;
			this.lblCompanyName.Location = new System.Drawing.Point(149, 51);
			this.lblCompanyName.Name = "lblCompanyName";
			this.lblCompanyName.Size = new System.Drawing.Size(89, 13);
			this.lblCompanyName.TabIndex = 28;
			this.lblCompanyName.Text = "lblCompanyName";
			// 
			// lnkSite
			// 
			this.lnkSite.AutoSize = true;
			this.lnkSite.Location = new System.Drawing.Point(9, 282);
			this.lnkSite.Name = "lnkSite";
			this.lnkSite.Size = new System.Drawing.Size(55, 13);
			this.lnkSite.TabIndex = 29;
			this.lnkSite.TabStop = true;
			this.lnkSite.Text = "linkLabel1";
			// 
			// frmAbout
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(462, 312);
			this.Controls.Add(this.lnkSite);
			this.Controls.Add(this.lblCompanyName);
			this.Controls.Add(this.lblVersion);
			this.Controls.Add(this.lblCopyRight);
			this.Controls.Add(this.lblProductName);
			this.Controls.Add(this.btnOk);
			this.Controls.Add(this.logoPictureBox);
			this.Controls.Add(this.lblDescription);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmAbout";
			this.Padding = new System.Windows.Forms.Padding(9);
			this.ShowIcon = false;
			this.ShowInTaskbar = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "About";
			this.Load += new System.EventHandler(this.frmAbout_Load);
			((System.ComponentModel.ISupportInitialize)(this.logoPictureBox)).EndInit();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.PictureBox logoPictureBox;
		private System.Windows.Forms.TextBox lblDescription;
		private System.Windows.Forms.Button btnOk;
		private System.Windows.Forms.Label lblProductName;
		private System.Windows.Forms.Label lblCopyRight;
		private System.Windows.Forms.Label lblVersion;
		private System.Windows.Forms.Label lblCompanyName;
		private System.Windows.Forms.LinkLabel lnkSite;
	}
}
