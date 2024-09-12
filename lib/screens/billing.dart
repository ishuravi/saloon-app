import 'package:flutter/material.dart';
import '../color/colors.dart'; // Update the import as per your project structure

class BillingScreen extends StatefulWidget {
  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing'),
        backgroundColor: AppColors.primary, // Replace with your primary color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildSellSection('Services'),
            _buildSellSection('Products'),
            _buildSellSection('Packages'),
            _buildSellSection('Memberships'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateInvoice,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Generate Invoice', style: TextStyle(color: AppColors.text)),
            ),
            SizedBox(height: 20),
            _buildPaymentOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildSellSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        // Add widgets here to display and manage items for each section
        SizedBox(height: 10),
        // Example widget
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter $title',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Payment Modes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        // Add widgets here for payment options
        ListTile(
          title: Text('Credit/Debit Card'),
          leading: Radio(value: 1, groupValue: 1, onChanged: (value) {}),
        ),
        ListTile(
          title: Text('Wallet'),
          leading: Radio(value: 2, groupValue: 1, onChanged: (value) {}),
        ),
        ListTile(
          title: Text('Cash'),
          leading: Radio(value: 3, groupValue: 1, onChanged: (value) {}),
        ),
      ],
    );
  }

  void _generateInvoice() {
    // Implement the functionality to generate and download the invoice
    print('Generating invoice...');
  }
}
