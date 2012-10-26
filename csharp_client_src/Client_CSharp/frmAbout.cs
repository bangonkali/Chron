using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Windows.Forms;

namespace Client_CSharp
{
	partial class frmAbout : Form
	{
		public frmAbout()
		{
			InitializeComponent();
		}

		#region Assembly Attribute Accessors

		public string AssemblyTitle
		{
			get
			{
				object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
				if (attributes.Length > 0)
				{
					AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
					if (titleAttribute.Title != "")
					{
						return titleAttribute.Title;
					}
				}
				return System.IO.Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase);
			}
		}

		public string AssemblyVersion
		{
			get
			{
				return Assembly.GetExecutingAssembly().GetName().Version.ToString();
			}
		}

		public string AssemblyDescription
		{
			get
			{
				object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyDescriptionAttribute), false);
				if (attributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyDescriptionAttribute)attributes[0]).Description;
			}
		}

		public string AssemblyProduct
		{
			get
			{
				object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyProductAttribute), false);
				if (attributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyProductAttribute)attributes[0]).Product;
			}
		}

		public string AssemblyCopyright
		{
			get
			{
				object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCopyrightAttribute), false);
				if (attributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyCopyrightAttribute)attributes[0]).Copyright;
			}
		}

		public string AssemblyCompany
		{
			get
			{
				object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCompanyAttribute), false);
				if (attributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyCompanyAttribute)attributes[0]).Company;
			}
		}
		#endregion

		private void frmAbout_Load(object sender, EventArgs e)
		{
			this.Text = String.Format("About {0}", AssemblyTitle);

			lblCompanyName.Text = "Mindanao State University";
			lblCopyRight.Text = "Iligan Institute of Technology";
			lblDescription.Text = "This is the desktop client for the Hardware Chron Device developed as partial fullfillment of the requirements for EE 188.\r\n\r\n";
			lblDescription.Text += "Developed by:" + "\r\n";
			lblDescription.Text += "Abestano, Johannah Mae" + "\r\n"; 
			lblDescription.Text += "Enanor, Caryl Keen" + "\r\n";
			lblDescription.Text += "Regalado, Gil Michael" + "\r\n\r\n";
			lblDescription.Text += "Required by:" + "\r\n";
			lblDescription.Text += "Jabian, Marven E. - EE Professor" + "\r\n" + "\r\n";
			lblDescription.Text += "This study focuses on the implementation of the famous Cron software for scheduling automation in UNIX and Linux systems to actual hardware implementation in scheduling on and off switching of actual hardware devices. The use of the Cron specification is the most unique characteristic of this research as it is the first time it is going to be used for hardware application for purposes of automation.";
			lblProductName.Text = "Chron";
			lblVersion.Text = "Prototype V.0.1.4.3";
		}

		private void okButton_Click(object sender, EventArgs e)
		{
			this.Close();
		}

		private void labelProductName_Click(object sender, EventArgs e)
		{

		}

		private void labelVersion_Click(object sender, EventArgs e)
		{

		}

		private void labelCopyright_Click(object sender, EventArgs e)
		{

		}

		private void labelCompanyName_Click(object sender, EventArgs e)
		{

		}

		private void lnkSite_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
		{
			System.Diagnostics.Process.Start("https://github.com/bangonkali/Chron");
		}
	}
}
