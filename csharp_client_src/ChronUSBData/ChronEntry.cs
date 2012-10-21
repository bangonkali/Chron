using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronCore
{
	class ChronEntry
	{
		public ChronUnit Minute { get; set; }
		public ChronUnit Hour { get; set; }
		public ChronUnit DayMonth { get; set; }
		public ChronUnit DayWeek { get; set; }
		public ChronUnit Month { get; set; }
		public ChronUnit Year { get; set; }
		public ChronUnit Enabled { get; set; }
		public ChronUnit Sync { get; set; }
	}
}
