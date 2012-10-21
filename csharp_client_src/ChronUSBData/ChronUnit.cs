using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronCore
{
	public class ChronUnit 
	{
		private byte mNumber = 0;
		private byte mClassifier = 0;
		private byte mLimit = 0;
		private byte mType = 0;
		private byte mBuffer = 0;

		public static readonly string[] mDaysOfWeek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "*"};
		public static readonly string[] mMonths = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "*"};
		public static readonly string[] mTypes = {"Minute", "Hour", "Month Day", "Week Day", "Month", "Year"};
		public static readonly string[] mClassifiers = {"-", "/", ""};

		public enum UnitType { MM=0, HH, MD, WD, MO, YY };
		public enum ClassifierType { To=0, EveryAfter, NoClass };

		public byte Number { get; set; }
		public byte Classifier { get; set; }
		public byte Limit { get; set; }

		public ChronUnit(byte type)
		{
			if (type >= (byte)UnitType.MM && type <= (byte)UnitType.YY)
			{
				mType = type;
			}
		}

		

		public string getClassifierText()
		{
			switch (mClassifier)
			{
				case (byte)ClassifierType.To:
					return mClassifiers[(int)ClassifierType.To];
				case (byte)ClassifierType.EveryAfter:
					return mClassifiers[(int)ClassifierType.EveryAfter];
				case (byte)ClassifierType.NoClass:
					return mClassifiers[(int)ClassifierType.NoClass];
				default:
					return "";
			}
			
		}

		public string getNumberText(byte num)
		{
			if (mType == (byte)UnitType.MD)
			{
				return mMonths[(int)num];
			}
			else if (mType == (byte)UnitType.WD)
			{
				return mDaysOfWeek[(int)num];
			}
			else
			{
				return num.ToString();
			}
		}

		public string getLowerText()
		{
			return this.getNumberText(mNumber);
		}

		public string getUpperText()
		{
			return this.getNumberText(mLimit);
		}

		public bool setMonthFromString(string mo, bool isLower)
		{
			byte x = 1;
			foreach (string m in mMonths) 
			{
				if (m == mo)
				{
					if (isLower)
						mNumber = x;
					else
						mLimit = x;

					return true;
				}
				x++;
			}
			return false;
		}

		public bool setWeekDayFromString(string wd, bool isLower)
		{
			byte x = 1;
			foreach (string m in mDaysOfWeek)
			{
				if (m == wd)
				{
					if (isLower)
						mNumber = x;
					else
						mLimit = x;
					return true;
				}
				x++;
			}
			return false;
		}

		public bool setClassifierFromString(string classifier)
		{
			byte x = 1;
			foreach (string m in mClassifiers)
			{
				if (m == classifier)
				{
					mClassifier = x;
					return true;
				}
				x++;
			}
			return false;
		}

		public bool setMonth(string moLower, string moClass, string moHigher)
		{
			if (!this.setMonthFromString(moLower, true))
			{
				if (!byte.TryParse(moLower, out mNumber))
					return false;
			}
			else
			{
				return false;
			}

			if (!this.setMonthFromString(moHigher, false))
			{
				if (!byte.TryParse(moHigher, out mLimit))
					return false;
			}
			else
			{
				return false;
			}

			return setClassifierFromString(moClass);
		}
	}

}
