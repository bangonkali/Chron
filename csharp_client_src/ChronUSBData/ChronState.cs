using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronCore
{
	public class ChronState
	{
		private string mDiagnostics;
		private byte[] mData;
		private bool mOverriden;

		public bool Overidden
		{
			get { return mOverriden; }
			set { mOverriden = value; }
		}

		public ChronState()
		{
			mData = new byte[12];
			mOverriden = false;
		}

		public string Diagnostics
		{
			get { return this.mDiagnostics; }
			set { this.mDiagnostics = value; }
		}

		public void SetData(byte[] data)
		{
			mOverriden = true;
			int c = 0;
			foreach (byte b in data)
			{
				mData[c] = b;
				c++;
			}
		}

		public byte[] GetData()
		{
			return mData;
		}

		public bool Read_MoreToParse { get; set; }
	}
}
