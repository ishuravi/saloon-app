import 'package:flutter/material.dart';
import '../color/colors.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Reports'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildReportItem('Financial Report'),
            _buildReportItem('Sales Report'),
            _buildReportItem('Staff Performance Report'),
            // Add more report items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String reportTitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(reportTitle, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            _generateReport(reportTitle);
          },
        ),
      ),
    );
  }

  void _generateReport(String reportTitle) {
    // Logic to generate the selected report
    print('Generating $reportTitle');
    // You might want to navigate to a detailed report view or display results here
  }
}
