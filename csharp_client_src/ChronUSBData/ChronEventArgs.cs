using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChronCore
{
	public class ChronEventArgs: EventArgs
	{
		public ChronEventArgs(ChronState state)
		{
			this.State = state;
		}

		public ChronState State { get; private set; }
	}
}
	