using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronCore
{
	class ChronEntry
	{
		private byte[] mEntry = new byte[20];
		public enum EntryAddresing {
			Enable = 0,
			DeviceID,
			DeviceState,
			MinutesLower,
			MinutesClassifier,
			MinutesUpper,
			HourLower,
			HourClassifier,
			HourUpper,
			MonthDayLower,
			MonthDayClassifier,
			MonthDayUpper,
			WeekdayLower,
			WeekdayClassifier,
			WeekdayUpper,
			MonthLower,
			MonthClassifier,
			MonthUpper,
			YearLower,
			YearClassifier,
			YearUpper
		}

		public bool setMinutes(string l, string c, string h)
		{
			byte buffer;
			
			if (byte.TryParse(l, out mEntry[(int)EntryAddresing.MinutesLower]))
			{
				mEntry[(int)EntryAddresing.MinutesLower] = buffer;
				return true;
			} 
		}
	}
}
