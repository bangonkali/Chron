using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronCore
{
	class ChronUnit 
	{
		private byte mNumber = 0;
		private byte mClassifier = 0;
		private byte mLimit = 0;


		public int IntToHexInt(int value)
		{
			return ChronManager.arrhexint[value];
		}

		public byte Number {
			get
			{
				return mNumber;
			}
			set 
			{
				mNumber = (byte)this.IntToHexInt(value);
			} 
		}
		public byte Classifier { get; set; }
		public byte Limit { get; set; }
	}

}
