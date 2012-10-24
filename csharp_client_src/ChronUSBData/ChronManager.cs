using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

using HidLibrary;

namespace ChronCore
{
    /// <summary>
    /// Manages one Chron device.
    /// </summary>
    public class ChronManager : IDisposable
    {
        private const int VendorId = 0x0001;
        private const int ProductId = 0x0001;
        private HidDevice device;
        private bool attached = false;
        private bool connectedToDriver = false;
        private bool debugPrintRawMessages = true;
        private bool disposed = false;
		private int cron_entries_received = 0;
		private int cron_entries_written = 0;
		public static readonly byte[] arrhexint = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x90, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99 };

        /// <summary>
        /// Occurs when a Chron device is attached.
        /// </summary>
        public event EventHandler DeviceAttached;

        /// <summary>
        /// Occurs when a Chron device is removed.
        /// </summary>
        public event EventHandler DeviceRemoved;

		public event EventHandler<ChronEventArgs> EntryReceived;

        /// <summary>
        /// Attempts to connect to a Chron device.
        /// 
        /// After a successful connection, a DeviceAttached event will normally be sent.
        /// </summary>
        /// <returns>True if a Chron device is connected, False otherwise.</returns>
        public bool OpenDevice()
        {
            device = HidDevices.Enumerate(VendorId, ProductId).FirstOrDefault();

            if (device != null)
            {
                connectedToDriver = true;
                device.OpenDevice();

                device.Inserted += DeviceAttachedHandler;
                device.Removed += DeviceRemovedHandler;

                device.MonitorDeviceEvents = true;
				device.ReadReport(OnReport);

                return true;
            }

            return false;
        }

        /// <summary>
        /// Closes the connection to the device.
        /// 
        /// FIXME: Verify that this also shuts down any thread waiting for device data. 2012-06-07 thammer.
        /// </summary>
        public void CloseDevice()
        {
            device.CloseDevice();
            connectedToDriver = false;
        }

        /// <summary>
        /// Closes the connection to the device.
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Sends a message to the Chron device to enable pulsing of the LED.
        /// The (constant) LED brightness will be ignored. The pulse speed is set
        /// by the SetLedPulseBrightness() method.
        /// </summary>
        /// <param name="enable">True to enable pulsing, False otherwise.</param>
        public void SetLedPulseEnabled(bool enable)
        {
            if (connectedToDriver)
            {
                byte [] data = new byte[64];
                data[0] = 0x00;
                data[1] = 0x41;
                data[2] = 0x01;
                data[3] = 0x03; // command
                data[4] = 0x00;
                data[5] = enable ? (byte)0x01 : (byte)0x00;
                data[6] = 0x00;
                data[7] = 0x00;
                data[8] = 0x00;
                HidReport report = new HidReport(9, new HidDeviceData(data, HidDeviceData.ReadStatus.Success));
                device.WriteFeatureData(data);
            }
        }

        private void DeviceAttachedHandler()
        {
            attached = true;

            if (DeviceAttached != null)
                DeviceAttached(this, EventArgs.Empty);

			device.ReadReport(OnReport);
        }

        private void DeviceRemovedHandler()
        {
            attached = false;

            if (DeviceRemoved != null)
                DeviceRemoved(this, EventArgs.Empty);
        }


        /// <summary>
        /// Closes any connected devices.
        /// </summary>
        /// <param name="disposing"></param>
        private void Dispose(bool disposing)
        {
            if(!this.disposed)
            {
                if(disposing)
                {
                    CloseDevice();
                }

                disposed = true;
            }
        }

        /// <summary>
        /// Destroys instance and frees device resources (if not freed already)
        /// </summary>
		~ChronManager()
        {
            Dispose(false);
        }


		public void GetCronTime()
		{
			if (connectedToDriver)
			{
				byte[] data = new byte[63];
				data[0] = (byte)0x00;
				data[1] = (byte)0x00; // mao ni ang 0 sa PIC
				data[2] = arrhexint[DateTime.Now.Minute]; // 1
				data[3] = arrhexint[DateTime.Now.Hour]; // 2
				data[4] = arrhexint[DateTime.Now.Day]; //3 
				data[5] = arrhexint[(byte)DateTime.Now.DayOfWeek+1]; //4 
				data[6] = arrhexint[DateTime.Now.Month]; // 5
				data[7] = arrhexint[DateTime.Now.Year - 2000]; //6 
				data[8] = (byte)(80 + DateTime.Now.Second);
				HidReport report = new HidReport(63, new HidDeviceData(data, HidDeviceData.ReadStatus.Success)); //7
				device.WriteReport(report);
				//ReceiveReport(report);
			}
		}

		private void ReceiveReport(HidReport report)
		{
			ChronState state = new ChronState();
			if (report.Data.Length > 2)
			{
				if (report.Data[0] == 0 && report.Data[1] == 2)
				{
					state.Diagnostics = "Received Chron Entry " + cron_entries_received + ": ";
					state.Read_MoreToParse = true;
					cron_entries_received++;
					//this.GetCronDataContinuation();
				}

				if (report.Data[0] == 0 && report.Data[1] == 3)
				{
					state.Diagnostics = "Chron Entry Comms Ended: ";
					cron_entries_received = 0;
				}

				if (debugPrintRawMessages)
				{
					for (int i = 0; i < report.Data.Length; i++)
					{
						state.Diagnostics += report.Data[i] + ", ";
					}

					System.Diagnostics.Debug.WriteLine(state.Diagnostics);
				}

				this.OnEntryReceived(state);
			}
		}

		public void GetCronData()
		{
			if (connectedToDriver)
			{
				byte[] data = new byte[64];
				data[0] = (byte)0x00;
				data[1] = (byte)0x01;
				HidReport report = new HidReport(63, new HidDeviceData(data, HidDeviceData.ReadStatus.Success));
				device.WriteReport(report);
				//ReceiveReport(report);
			}
		}

		public void GetCronDataContinuation()
		{
			if (connectedToDriver)
			{
				byte[] data = new byte[64];
				data[0] = (byte)0x00;
				data[1] = (byte)0x02;
				HidReport report = new HidReport(63, new HidDeviceData(data, HidDeviceData.ReadStatus.Success));
				device.WriteReport(report);
				//ReceiveReport(report);
			}
		}

		public Queue<ChronEntry> QueuedItems = new Queue<ChronEntry>();

		public void WriteCronData(ChronEntries ce)
		{
            if (connectedToDriver && ce.entries.Count() > 0)
			{
				foreach (ChronEntry i in ce.entries)
				{
					QueuedItems.Enqueue(i);
				}

				byte[] data = new byte[64];
				data[0] = (byte)0x00; // required
				data[1] = (byte)0x07; // begin writing 

				ChronEntry buffer = QueuedItems.Dequeue();

                System.Diagnostics.Debug.WriteLine("Codasyl");
				data[2] = (byte)QueuedItems.Count(); // inform pic how many left.
				for (int x = 0; x < 21; x++)
				{
                    data[x + 3] = buffer.mEntry[x];
                    System.Diagnostics.Debug.Write(data[x + 3]);

				}

                System.Diagnostics.Debug.WriteLine("");
				HidReport report = new HidReport(63, new HidDeviceData(data, HidDeviceData.ReadStatus.Success));
				device.WriteReport(report);
				//ReceiveReport(report);
			}
		}

		public void WriteCronDataContinuation()
		{
			if (connectedToDriver)
			{
				if (QueuedItems.Count > 0)
				{
					byte[] data = new byte[64];
					data[0] = (byte)0x00;
					data[1] = (byte)0x04;

					ChronEntry buffer = QueuedItems.Dequeue();

					data[2] = (byte)QueuedItems.Count(); // inform pic how many left.
					for (int x = 0; x < 21; x++)
					{
						data[x + 3] = buffer.mEntry[x];
					}

					HidReport report = new HidReport(63, new HidDeviceData(data, HidDeviceData.ReadStatus.Success));
					device.WriteReport(report);
					//ReceiveReport(report);
				}
				else 
				{
					// write dummy to end sequence
					byte[] data = new byte[64];
					data[0] = (byte)0x00;
					data[1] = (byte)0x04;
					data[2] = (byte)0x00;
					HidReport report = new HidReport(63, new HidDeviceData(data, HidDeviceData.ReadStatus.Success));
					device.WriteReport(report);
					//ReceiveReport(report);
				}
			}
		}

		private void OnReport(HidReport report)
		{
			ChronState state = new ChronState();

			if (attached == false) { return; }

			if (report.Data.Length > 2)
			{
				if (report.Data[0] == 0 && report.Data[1] == 0)
				{
					state.Diagnostics = "Received Time and Data Reset " + cron_entries_received + ": ";
					state.Read_MoreToParse = true;
					cron_entries_received++;
				}

				if (report.Data[0] == 0 && report.Data[1] == 2)
				{
					state.Diagnostics = "Received Chron Entry " + cron_entries_received + ": ";
					state.Read_MoreToParse = true;
					cron_entries_received++;
					this.GetCronDataContinuation();
				}
				
				if (report.Data[0] == 0 && report.Data[1] == 3)
				{
					state.Diagnostics = "Chron Entry Comms Ended: ";
					cron_entries_received = 0;
				}

				if (report.Data[0] == 0 && report.Data[1] == 6)
				{
					state.Diagnostics = "Written Chron Entry " + cron_entries_written + ": ";
					state.Read_MoreToParse = true;
					cron_entries_written++;
					this.WriteCronDataContinuation();
				}

				if (report.Data[0] == 0 && report.Data[1] == 5)
				{
					state.Diagnostics = "Chron Write Comms Ended: ";
					cron_entries_written = 0;
				}

				if (debugPrintRawMessages)
				{
					for (int i = 0; i < report.Data.Length; i++)
					{
						state.Diagnostics += report.Data[i] + ", ";
					}

					System.Diagnostics.Debug.WriteLine(state.Diagnostics);
				}

				this.OnEntryReceived(state);
			}

			device.ReadReport(OnReport);
		}

		
		private void OnEntryReceived(ChronState state)
		{
			var handle = this.EntryReceived;
			if (handle != null)
			{
				handle(this, new ChronEventArgs(state));
			}
		}

		public static int IntToHexInt(int value)
		{
			return arrhexint[value];
		}
    }
}
