namespace OLAXBoughtLeaf
{
    partial class rptSupplierPaymentToBank
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.allCheck = new System.Windows.Forms.CheckBox();
            this.cmbRoute = new System.Windows.Forms.ComboBox();
            this.cmbMonth = new System.Windows.Forms.ComboBox();
            this.cmbYear = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cmdCancel = new System.Windows.Forms.Button();
            this.cmdDisplay = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.allCheck);
            this.groupBox1.Controls.Add(this.cmbRoute);
            this.groupBox1.Controls.Add(this.cmbMonth);
            this.groupBox1.Controls.Add(this.cmbYear);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(367, 125);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            // 
            // allCheck
            // 
            this.allCheck.AutoSize = true;
            this.allCheck.Location = new System.Drawing.Point(295, 77);
            this.allCheck.Name = "allCheck";
            this.allCheck.Size = new System.Drawing.Size(37, 17);
            this.allCheck.TabIndex = 6;
            this.allCheck.Text = "All";
            this.allCheck.UseVisualStyleBackColor = true;
            // 
            // cmbRoute
            // 
            this.cmbRoute.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbRoute.FormattingEnabled = true;
            this.cmbRoute.Location = new System.Drawing.Point(109, 75);
            this.cmbRoute.Name = "cmbRoute";
            this.cmbRoute.Size = new System.Drawing.Size(180, 21);
            this.cmbRoute.TabIndex = 5;
            // 
            // cmbMonth
            // 
            this.cmbMonth.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMonth.FormattingEnabled = true;
            this.cmbMonth.Location = new System.Drawing.Point(109, 48);
            this.cmbMonth.Name = "cmbMonth";
            this.cmbMonth.Size = new System.Drawing.Size(146, 21);
            this.cmbMonth.TabIndex = 4;
            // 
            // cmbYear
            // 
            this.cmbYear.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbYear.FormattingEnabled = true;
            this.cmbYear.Items.AddRange(new object[] {
            "2015",
            "2016",
            "2017",
            "2018",
            "2019",
            "2020"});
            this.cmbYear.Location = new System.Drawing.Point(109, 21);
            this.cmbYear.Name = "cmbYear";
            this.cmbYear.Size = new System.Drawing.Size(146, 21);
            this.cmbYear.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(28, 79);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(69, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Select Route";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(28, 52);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Select Month";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Select Year";
            // 
            // cmdCancel
            // 
            this.cmdCancel.Location = new System.Drawing.Point(298, 152);
            this.cmdCancel.Name = "cmdCancel";
            this.cmdCancel.Size = new System.Drawing.Size(75, 23);
            this.cmdCancel.TabIndex = 10;
            this.cmdCancel.Text = "Cancel";
            this.cmdCancel.UseVisualStyleBackColor = true;
            this.cmdCancel.Click += new System.EventHandler(this.cmdCancel_Click);
            // 
            // cmdDisplay
            // 
            this.cmdDisplay.Location = new System.Drawing.Point(217, 152);
            this.cmdDisplay.Name = "cmdDisplay";
            this.cmdDisplay.Size = new System.Drawing.Size(75, 23);
            this.cmdDisplay.TabIndex = 9;
            this.cmdDisplay.Text = "Display";
            this.cmdDisplay.UseVisualStyleBackColor = true;
            this.cmdDisplay.Click += new System.EventHandler(this.cmdDisplay_Click);
            // 
            // rptSupplierPaymentToBank
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(396, 190);
            this.Controls.Add(this.cmdCancel);
            this.Controls.Add(this.cmdDisplay);
            this.Controls.Add(this.groupBox1);
            this.MaximizeBox = false;
            this.Name = "rptSupplierPaymentToBank";
            this.Text = "Supplier Payment To Bank";
            this.Load += new System.EventHandler(this.rptSupplierPaymentToBank_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox allCheck;
        private System.Windows.Forms.ComboBox cmbRoute;
        private System.Windows.Forms.ComboBox cmbMonth;
        private System.Windows.Forms.ComboBox cmbYear;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button cmdCancel;
        private System.Windows.Forms.Button cmdDisplay;
    }
}