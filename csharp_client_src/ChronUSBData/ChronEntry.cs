using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
namespace ChronCore
{
	[Serializable()]
	public class ChronEntry : ISerializable
	{
		public byte[] mEntry = new byte[20];
		public int mID = 0;
		public static int mAutoIncrement = 0;


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

		public ChronEntry()
		{
			mAutoIncrement++;
			mID = mAutoIncrement;
		}

		public ChronEntry(SerializationInfo info, StreamingContext ctxt)
		{
			this.mEntry = (byte[])info.GetValue("Entry", typeof(byte[]));
			this.mID = (int)info.GetValue("ID", typeof(int));
			mAutoIncrement = (int)info.GetValue("AutoIncrement", typeof(int));
		}

		public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
		{
			info.AddValue("Entry", this.mEntry);
			info.AddValue("ID", this.mID);
			info.AddValue("AutoIncrement", mAutoIncrement);
		}
	}
}
