using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace ChronCore
{
	[Serializable()]
	public class ChronEntries : ISerializable
	{
		public List<ChronEntry> entries = new List<ChronEntry>();

		public ChronEntries()
		{
		}

		public ChronEntries(SerializationInfo info, StreamingContext ctxt)
		{
			this.entries = (List<ChronEntry>)info.GetValue("Entries", typeof(List<ChronEntry>));
		}

		public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
		{
			info.AddValue("Entries", this.entries);
		}
	}
}
