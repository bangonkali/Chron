using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronUSBData
{
	public struct ChronState
	{
		private string mDiagnostics;

		public string Diagnostics
		{
			get { return this.mDiagnostics; }
			set { this.mDiagnostics = value; }
		}

		public bool Read_MoreToParse { get; set; }
	}
}
