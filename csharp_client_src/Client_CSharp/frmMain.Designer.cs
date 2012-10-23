namespace Client_CSharp
{
	partial class frmMain
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
			this.stripContainer = new System.Windows.Forms.ToolStripContainer();
			this.stripStatus = new System.Windows.Forms.StatusStrip();
			this.txtStatus = new System.Windows.Forms.ToolStripStatusLabel();
			this.txtState = new System.Windows.Forms.ToolStripStatusLabel();
			this.mnuEntriesList = new System.Windows.Forms.ContextMenuStrip(this.components);
			this.newEntryToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.editEntryToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.deleteEntryToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
			this.disableEntryToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.enableEntryToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.mnMain = new System.Windows.Forms.MenuStrip();
			this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.newToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator = new System.Windows.Forms.ToolStripSeparator();
			this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.saveAsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.undoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.redoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
			this.cutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.copyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.pasteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
			this.selectAllToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.mnuSyncTime = new System.Windows.Forms.ToolStripMenuItem();
			this.mnuBeginTestUnit = new System.Windows.Forms.ToolStripMenuItem();
			this.writeCron01ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator6 = new System.Windows.Forms.ToolStripSeparator();
			this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator8 = new System.Windows.Forms.ToolStripSeparator();
			this.customizeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.contentsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
			this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStrip1 = new System.Windows.Forms.ToolStrip();
			this.newToolStripButton = new System.Windows.Forms.ToolStripButton();
			this.openToolStripButton = new System.Windows.Forms.ToolStripButton();
			this.saveToolStripButton = new System.Windows.Forms.ToolStripButton();
			this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
			this.helpToolStripButton = new System.Windows.Forms.ToolStripButton();
			this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
			this.splitRight = new System.Windows.Forms.SplitContainer();
			this.lstEntries = new System.Windows.Forms.ListView();
			this.txtBoxDiagnostics = new System.Windows.Forms.TextBox();
			this.stripContainer.BottomToolStripPanel.SuspendLayout();
			this.stripContainer.ContentPanel.SuspendLayout();
			this.stripContainer.TopToolStripPanel.SuspendLayout();
			this.stripContainer.SuspendLayout();
			this.stripStatus.SuspendLayout();
			this.mnuEntriesList.SuspendLayout();
			this.mnMain.SuspendLayout();
			this.toolStrip1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.splitRight)).BeginInit();
			this.splitRight.Panel1.SuspendLayout();
			this.splitRight.Panel2.SuspendLayout();
			this.splitRight.SuspendLayout();
			this.SuspendLayout();
			// 
			// stripContainer
			// 
			// 
			// stripContainer.BottomToolStripPanel
			// 
			this.stripContainer.BottomToolStripPanel.Controls.Add(this.stripStatus);
			// 
			// stripContainer.ContentPanel
			// 
			this.stripContainer.ContentPanel.Controls.Add(this.splitRight);
			this.stripContainer.ContentPanel.Size = new System.Drawing.Size(684, 402);
			this.stripContainer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.stripContainer.Location = new System.Drawing.Point(0, 0);
			this.stripContainer.Name = "stripContainer";
			this.stripContainer.Size = new System.Drawing.Size(684, 473);
			this.stripContainer.TabIndex = 0;
			this.stripContainer.Text = "toolStripContainer1";
			// 
			// stripContainer.TopToolStripPanel
			// 
			this.stripContainer.TopToolStripPanel.Controls.Add(this.mnMain);
			this.stripContainer.TopToolStripPanel.Controls.Add(this.toolStrip1);
			// 
			// stripStatus
			// 
			this.stripStatus.Dock = System.Windows.Forms.DockStyle.None;
			this.stripStatus.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.txtStatus,
            this.txtState});
			this.stripStatus.Location = new System.Drawing.Point(0, 0);
			this.stripStatus.Name = "stripStatus";
			this.stripStatus.Size = new System.Drawing.Size(684, 22);
			this.stripStatus.TabIndex = 0;
			// 
			// txtStatus
			// 
			this.txtStatus.Name = "txtStatus";
			this.txtStatus.Size = new System.Drawing.Size(623, 17);
			this.txtStatus.Spring = true;
			this.txtStatus.Text = "txtStatus";
			this.txtStatus.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// txtState
			// 
			this.txtState.Name = "txtState";
			this.txtState.Size = new System.Drawing.Size(46, 17);
			this.txtState.Text = "txtState";
			// 
			// mnuEntriesList
			// 
			this.mnuEntriesList.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newEntryToolStripMenuItem,
            this.editEntryToolStripMenuItem,
            this.deleteEntryToolStripMenuItem,
            this.toolStripMenuItem1,
            this.disableEntryToolStripMenuItem,
            this.enableEntryToolStripMenuItem});
			this.mnuEntriesList.Name = "mnuEntriesList";
			this.mnuEntriesList.Size = new System.Drawing.Size(143, 120);
			this.mnuEntriesList.Text = "MenuEntriesList";
			// 
			// newEntryToolStripMenuItem
			// 
			this.newEntryToolStripMenuItem.Name = "newEntryToolStripMenuItem";
			this.newEntryToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
			this.newEntryToolStripMenuItem.Text = "&New Entry";
			this.newEntryToolStripMenuItem.Click += new System.EventHandler(this.newEntryToolStripMenuItem_Click);
			// 
			// editEntryToolStripMenuItem
			// 
			this.editEntryToolStripMenuItem.Name = "editEntryToolStripMenuItem";
			this.editEntryToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
			this.editEntryToolStripMenuItem.Text = "&Edit Entry";
			this.editEntryToolStripMenuItem.Visible = false;
			// 
			// deleteEntryToolStripMenuItem
			// 
			this.deleteEntryToolStripMenuItem.Name = "deleteEntryToolStripMenuItem";
			this.deleteEntryToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
			this.deleteEntryToolStripMenuItem.Text = "&Delete Entry";
			this.deleteEntryToolStripMenuItem.Click += new System.EventHandler(this.deleteEntryToolStripMenuItem_Click);
			// 
			// toolStripMenuItem1
			// 
			this.toolStripMenuItem1.Name = "toolStripMenuItem1";
			this.toolStripMenuItem1.Size = new System.Drawing.Size(139, 6);
			this.toolStripMenuItem1.Visible = false;
			// 
			// disableEntryToolStripMenuItem
			// 
			this.disableEntryToolStripMenuItem.Name = "disableEntryToolStripMenuItem";
			this.disableEntryToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
			this.disableEntryToolStripMenuItem.Text = "&Disable Entry";
			this.disableEntryToolStripMenuItem.Visible = false;
			// 
			// enableEntryToolStripMenuItem
			// 
			this.enableEntryToolStripMenuItem.Name = "enableEntryToolStripMenuItem";
			this.enableEntryToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
			this.enableEntryToolStripMenuItem.Text = "&Enable Entry";
			this.enableEntryToolStripMenuItem.Visible = false;
			this.enableEntryToolStripMenuItem.Click += new System.EventHandler(this.enableEntryToolStripMenuItem_Click);
			// 
			// mnMain
			// 
			this.mnMain.Dock = System.Windows.Forms.DockStyle.None;
			this.mnMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.editToolStripMenuItem,
            this.toolsToolStripMenuItem,
            this.helpToolStripMenuItem});
			this.mnMain.Location = new System.Drawing.Point(0, 0);
			this.mnMain.Name = "mnMain";
			this.mnMain.Size = new System.Drawing.Size(684, 24);
			this.mnMain.TabIndex = 0;
			this.mnMain.Text = "menuStrip1";
			// 
			// fileToolStripMenuItem
			// 
			this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newToolStripMenuItem,
            this.openToolStripMenuItem,
            this.toolStripSeparator,
            this.saveToolStripMenuItem,
            this.saveAsToolStripMenuItem,
            this.toolStripSeparator1,
            this.exitToolStripMenuItem});
			this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
			this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
			this.fileToolStripMenuItem.Text = "&File";
			// 
			// newToolStripMenuItem
			// 
			this.newToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("newToolStripMenuItem.Image")));
			this.newToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.newToolStripMenuItem.Name = "newToolStripMenuItem";
			this.newToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.N)));
			this.newToolStripMenuItem.Size = new System.Drawing.Size(146, 22);
			this.newToolStripMenuItem.Text = "&New";
			this.newToolStripMenuItem.Click += new System.EventHandler(this.newToolStripMenuItem_Click);
			// 
			// openToolStripMenuItem
			// 
			this.openToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("openToolStripMenuItem.Image")));
			this.openToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.openToolStripMenuItem.Name = "openToolStripMenuItem";
			this.openToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
			this.openToolStripMenuItem.Size = new System.Drawing.Size(146, 22);
			this.openToolStripMenuItem.Text = "&Open";
			this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
			// 
			// toolStripSeparator
			// 
			this.toolStripSeparator.Name = "toolStripSeparator";
			this.toolStripSeparator.Size = new System.Drawing.Size(143, 6);
			// 
			// saveToolStripMenuItem
			// 
			this.saveToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("saveToolStripMenuItem.Image")));
			this.saveToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
			this.saveToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S)));
			this.saveToolStripMenuItem.Size = new System.Drawing.Size(146, 22);
			this.saveToolStripMenuItem.Text = "&Save";
			this.saveToolStripMenuItem.Click += new System.EventHandler(this.saveToolStripMenuItem_Click);
			// 
			// saveAsToolStripMenuItem
			// 
			this.saveAsToolStripMenuItem.Name = "saveAsToolStripMenuItem";
			this.saveAsToolStripMenuItem.Size = new System.Drawing.Size(146, 22);
			this.saveAsToolStripMenuItem.Text = "Save &As";
			// 
			// toolStripSeparator1
			// 
			this.toolStripSeparator1.Name = "toolStripSeparator1";
			this.toolStripSeparator1.Size = new System.Drawing.Size(143, 6);
			// 
			// exitToolStripMenuItem
			// 
			this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
			this.exitToolStripMenuItem.Size = new System.Drawing.Size(146, 22);
			this.exitToolStripMenuItem.Text = "E&xit";
			this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
			// 
			// editToolStripMenuItem
			// 
			this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.undoToolStripMenuItem,
            this.redoToolStripMenuItem,
            this.toolStripSeparator3,
            this.cutToolStripMenuItem,
            this.copyToolStripMenuItem,
            this.pasteToolStripMenuItem,
            this.toolStripSeparator4,
            this.selectAllToolStripMenuItem});
			this.editToolStripMenuItem.Name = "editToolStripMenuItem";
			this.editToolStripMenuItem.Size = new System.Drawing.Size(39, 20);
			this.editToolStripMenuItem.Text = "&Edit";
			// 
			// undoToolStripMenuItem
			// 
			this.undoToolStripMenuItem.Name = "undoToolStripMenuItem";
			this.undoToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Z)));
			this.undoToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
			this.undoToolStripMenuItem.Text = "&Undo";
			// 
			// redoToolStripMenuItem
			// 
			this.redoToolStripMenuItem.Name = "redoToolStripMenuItem";
			this.redoToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Y)));
			this.redoToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
			this.redoToolStripMenuItem.Text = "&Redo";
			// 
			// toolStripSeparator3
			// 
			this.toolStripSeparator3.Name = "toolStripSeparator3";
			this.toolStripSeparator3.Size = new System.Drawing.Size(141, 6);
			// 
			// cutToolStripMenuItem
			// 
			this.cutToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("cutToolStripMenuItem.Image")));
			this.cutToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.cutToolStripMenuItem.Name = "cutToolStripMenuItem";
			this.cutToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.X)));
			this.cutToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
			this.cutToolStripMenuItem.Text = "Cu&t";
			// 
			// copyToolStripMenuItem
			// 
			this.copyToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("copyToolStripMenuItem.Image")));
			this.copyToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.copyToolStripMenuItem.Name = "copyToolStripMenuItem";
			this.copyToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.C)));
			this.copyToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
			this.copyToolStripMenuItem.Text = "&Copy";
			// 
			// pasteToolStripMenuItem
			// 
			this.pasteToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("pasteToolStripMenuItem.Image")));
			this.pasteToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.pasteToolStripMenuItem.Name = "pasteToolStripMenuItem";
			this.pasteToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.V)));
			this.pasteToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
			this.pasteToolStripMenuItem.Text = "&Paste";
			// 
			// toolStripSeparator4
			// 
			this.toolStripSeparator4.Name = "toolStripSeparator4";
			this.toolStripSeparator4.Size = new System.Drawing.Size(141, 6);
			// 
			// selectAllToolStripMenuItem
			// 
			this.selectAllToolStripMenuItem.Name = "selectAllToolStripMenuItem";
			this.selectAllToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
			this.selectAllToolStripMenuItem.Text = "Select &All";
			// 
			// toolsToolStripMenuItem
			// 
			this.toolsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuSyncTime,
            this.mnuBeginTestUnit,
            this.writeCron01ToolStripMenuItem,
            this.toolStripSeparator6,
            this.toolStripMenuItem2,
            this.toolStripSeparator8,
            this.customizeToolStripMenuItem,
            this.optionsToolStripMenuItem});
			this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
			this.toolsToolStripMenuItem.Size = new System.Drawing.Size(48, 20);
			this.toolsToolStripMenuItem.Text = "&Tools";
			// 
			// mnuSyncTime
			// 
			this.mnuSyncTime.Name = "mnuSyncTime";
			this.mnuSyncTime.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift) 
            | System.Windows.Forms.Keys.T)));
			this.mnuSyncTime.Size = new System.Drawing.Size(230, 22);
			this.mnuSyncTime.Text = "Sync Time";
			this.mnuSyncTime.Click += new System.EventHandler(this.mnuGetCronTime_Click);
			// 
			// mnuBeginTestUnit
			// 
			this.mnuBeginTestUnit.Name = "mnuBeginTestUnit";
			this.mnuBeginTestUnit.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift) 
            | System.Windows.Forms.Keys.R)));
			this.mnuBeginTestUnit.Size = new System.Drawing.Size(230, 22);
			this.mnuBeginTestUnit.Text = "Read Schedule";
			this.mnuBeginTestUnit.Click += new System.EventHandler(this.mnuBeginTestUnit_Click);
			// 
			// writeCron01ToolStripMenuItem
			// 
			this.writeCron01ToolStripMenuItem.Name = "writeCron01ToolStripMenuItem";
			this.writeCron01ToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift) 
            | System.Windows.Forms.Keys.W)));
			this.writeCron01ToolStripMenuItem.Size = new System.Drawing.Size(230, 22);
			this.writeCron01ToolStripMenuItem.Text = "Write Schedule";
			this.writeCron01ToolStripMenuItem.Click += new System.EventHandler(this.writeCron01ToolStripMenuItem_Click);
			// 
			// toolStripSeparator6
			// 
			this.toolStripSeparator6.Name = "toolStripSeparator6";
			this.toolStripSeparator6.Size = new System.Drawing.Size(227, 6);
			// 
			// toolStripMenuItem2
			// 
			this.toolStripMenuItem2.Name = "toolStripMenuItem2";
			this.toolStripMenuItem2.Size = new System.Drawing.Size(230, 22);
			this.toolStripMenuItem2.Text = "&Clear Log";
			this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
			// 
			// toolStripSeparator8
			// 
			this.toolStripSeparator8.Name = "toolStripSeparator8";
			this.toolStripSeparator8.Size = new System.Drawing.Size(227, 6);
			// 
			// customizeToolStripMenuItem
			// 
			this.customizeToolStripMenuItem.Name = "customizeToolStripMenuItem";
			this.customizeToolStripMenuItem.Size = new System.Drawing.Size(230, 22);
			this.customizeToolStripMenuItem.Text = "&Customize";
			// 
			// optionsToolStripMenuItem
			// 
			this.optionsToolStripMenuItem.Name = "optionsToolStripMenuItem";
			this.optionsToolStripMenuItem.Size = new System.Drawing.Size(230, 22);
			this.optionsToolStripMenuItem.Text = "&Options";
			// 
			// helpToolStripMenuItem
			// 
			this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.contentsToolStripMenuItem,
            this.toolStripSeparator5,
            this.aboutToolStripMenuItem});
			this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
			this.helpToolStripMenuItem.Size = new System.Drawing.Size(44, 20);
			this.helpToolStripMenuItem.Text = "&Help";
			// 
			// contentsToolStripMenuItem
			// 
			this.contentsToolStripMenuItem.Name = "contentsToolStripMenuItem";
			this.contentsToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F1;
			this.contentsToolStripMenuItem.Size = new System.Drawing.Size(141, 22);
			this.contentsToolStripMenuItem.Text = "&Contents";
			this.contentsToolStripMenuItem.Click += new System.EventHandler(this.contentsToolStripMenuItem_Click);
			// 
			// toolStripSeparator5
			// 
			this.toolStripSeparator5.Name = "toolStripSeparator5";
			this.toolStripSeparator5.Size = new System.Drawing.Size(138, 6);
			// 
			// aboutToolStripMenuItem
			// 
			this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
			this.aboutToolStripMenuItem.Size = new System.Drawing.Size(141, 22);
			this.aboutToolStripMenuItem.Text = "&About...";
			this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
			// 
			// toolStrip1
			// 
			this.toolStrip1.Dock = System.Windows.Forms.DockStyle.None;
			this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newToolStripButton,
            this.openToolStripButton,
            this.saveToolStripButton,
            this.toolStripSeparator2,
            this.helpToolStripButton});
			this.toolStrip1.Location = new System.Drawing.Point(3, 24);
			this.toolStrip1.Name = "toolStrip1";
			this.toolStrip1.Size = new System.Drawing.Size(110, 25);
			this.toolStrip1.TabIndex = 1;
			// 
			// newToolStripButton
			// 
			this.newToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.newToolStripButton.Image = ((System.Drawing.Image)(resources.GetObject("newToolStripButton.Image")));
			this.newToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.newToolStripButton.Name = "newToolStripButton";
			this.newToolStripButton.Size = new System.Drawing.Size(23, 22);
			this.newToolStripButton.Text = "&New";
			this.newToolStripButton.Click += new System.EventHandler(this.newToolStripButton_Click);
			// 
			// openToolStripButton
			// 
			this.openToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.openToolStripButton.Image = ((System.Drawing.Image)(resources.GetObject("openToolStripButton.Image")));
			this.openToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.openToolStripButton.Name = "openToolStripButton";
			this.openToolStripButton.Size = new System.Drawing.Size(23, 22);
			this.openToolStripButton.Text = "&Open";
			this.openToolStripButton.Click += new System.EventHandler(this.openToolStripButton_Click);
			// 
			// saveToolStripButton
			// 
			this.saveToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.saveToolStripButton.Image = ((System.Drawing.Image)(resources.GetObject("saveToolStripButton.Image")));
			this.saveToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.saveToolStripButton.Name = "saveToolStripButton";
			this.saveToolStripButton.Size = new System.Drawing.Size(23, 22);
			this.saveToolStripButton.Text = "&Save";
			this.saveToolStripButton.Click += new System.EventHandler(this.saveToolStripButton_Click);
			// 
			// toolStripSeparator2
			// 
			this.toolStripSeparator2.Name = "toolStripSeparator2";
			this.toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
			// 
			// helpToolStripButton
			// 
			this.helpToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.helpToolStripButton.Image = ((System.Drawing.Image)(resources.GetObject("helpToolStripButton.Image")));
			this.helpToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.helpToolStripButton.Name = "helpToolStripButton";
			this.helpToolStripButton.Size = new System.Drawing.Size(23, 22);
			this.helpToolStripButton.Text = "He&lp";
			this.helpToolStripButton.Click += new System.EventHandler(this.helpToolStripButton_Click);
			// 
			// splitRight
			// 
			this.splitRight.Dock = System.Windows.Forms.DockStyle.Fill;
			this.splitRight.Location = new System.Drawing.Point(0, 0);
			this.splitRight.Name = "splitRight";
			this.splitRight.Orientation = System.Windows.Forms.Orientation.Horizontal;
			// 
			// splitRight.Panel1
			// 
			this.splitRight.Panel1.Controls.Add(this.lstEntries);
			// 
			// splitRight.Panel2
			// 
			this.splitRight.Panel2.Controls.Add(this.txtBoxDiagnostics);
			this.splitRight.Size = new System.Drawing.Size(684, 402);
			this.splitRight.SplitterDistance = 248;
			this.splitRight.TabIndex = 1;
			// 
			// lstEntries
			// 
			this.lstEntries.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lstEntries.Location = new System.Drawing.Point(0, 0);
			this.lstEntries.Name = "lstEntries";
			this.lstEntries.Size = new System.Drawing.Size(684, 248);
			this.lstEntries.TabIndex = 0;
			this.lstEntries.UseCompatibleStateImageBehavior = false;
			// 
			// txtBoxDiagnostics
			// 
			this.txtBoxDiagnostics.BackColor = System.Drawing.Color.White;
			this.txtBoxDiagnostics.Dock = System.Windows.Forms.DockStyle.Fill;
			this.txtBoxDiagnostics.Location = new System.Drawing.Point(0, 0);
			this.txtBoxDiagnostics.Multiline = true;
			this.txtBoxDiagnostics.Name = "txtBoxDiagnostics";
			this.txtBoxDiagnostics.ReadOnly = true;
			this.txtBoxDiagnostics.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.txtBoxDiagnostics.Size = new System.Drawing.Size(684, 150);
			this.txtBoxDiagnostics.TabIndex = 0;
			this.txtBoxDiagnostics.WordWrap = false;
			// 
			// frmMain
			// 
			this.AccessibleName = "Chron Scheduler C# Client";
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(684, 473);
			this.Controls.Add(this.stripContainer);
			this.MainMenuStrip = this.mnMain;
			this.Name = "frmMain";
			this.Text = "Chron Scheduler Desktop Client";
			this.Load += new System.EventHandler(this.frmMain_Load);
			this.Shown += new System.EventHandler(this.frmMain_Shown);
			this.stripContainer.BottomToolStripPanel.ResumeLayout(false);
			this.stripContainer.BottomToolStripPanel.PerformLayout();
			this.stripContainer.ContentPanel.ResumeLayout(false);
			this.stripContainer.TopToolStripPanel.ResumeLayout(false);
			this.stripContainer.TopToolStripPanel.PerformLayout();
			this.stripContainer.ResumeLayout(false);
			this.stripContainer.PerformLayout();
			this.stripStatus.ResumeLayout(false);
			this.stripStatus.PerformLayout();
			this.mnuEntriesList.ResumeLayout(false);
			this.mnMain.ResumeLayout(false);
			this.mnMain.PerformLayout();
			this.toolStrip1.ResumeLayout(false);
			this.toolStrip1.PerformLayout();
			this.splitRight.Panel1.ResumeLayout(false);
			this.splitRight.Panel2.ResumeLayout(false);
			this.splitRight.Panel2.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.splitRight)).EndInit();
			this.splitRight.ResumeLayout(false);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.ToolStripContainer stripContainer;
		private System.Windows.Forms.StatusStrip stripStatus;
		private System.Windows.Forms.ToolStripStatusLabel txtStatus;
		private System.Windows.Forms.ToolStripStatusLabel txtState;
		private System.Windows.Forms.MenuStrip mnMain;
		private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem newToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator;
		private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem saveAsToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
		private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem undoToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem redoToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
		private System.Windows.Forms.ToolStripMenuItem cutToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem copyToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem pasteToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
		private System.Windows.Forms.ToolStripMenuItem selectAllToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem customizeToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem optionsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem contentsToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
		private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem mnuBeginTestUnit;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator6;
		private System.Windows.Forms.ToolStripMenuItem mnuSyncTime;
		private System.Windows.Forms.ToolStripMenuItem writeCron01ToolStripMenuItem;
		private System.Windows.Forms.ToolStrip toolStrip1;
		private System.Windows.Forms.ToolStripButton newToolStripButton;
		private System.Windows.Forms.ToolStripButton openToolStripButton;
		private System.Windows.Forms.ToolStripButton saveToolStripButton;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
		private System.Windows.Forms.ToolStripButton helpToolStripButton;
		private System.Windows.Forms.ContextMenuStrip mnuEntriesList;
		private System.Windows.Forms.ToolStripMenuItem newEntryToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem editEntryToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem deleteEntryToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
		private System.Windows.Forms.ToolStripMenuItem disableEntryToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem enableEntryToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator8;
		private System.IO.Ports.SerialPort serialPort1;
		private System.Windows.Forms.SplitContainer splitRight;
		private System.Windows.Forms.ListView lstEntries;
		private System.Windows.Forms.TextBox txtBoxDiagnostics;
	}
}

