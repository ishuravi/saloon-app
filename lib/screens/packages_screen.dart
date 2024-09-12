import 'package:flutter/material.dart';
import '../color/colors.dart';

class PackagesScreen extends StatefulWidget {
  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Packages'),
        backgroundColor: AppColors.primary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addPackage,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          _buildPackageItem('Package 1', 'Details about Package 1'),
          _buildPackageItem('Package 2', 'Details about Package 2'),
          // Add more packages as needed
        ],
      ),
    );
  }

  Widget _buildPackageItem(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Edit') {
              _editPackage();
            } else if (value == 'Delete') {
              _deletePackage();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Edit',
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 'Delete',
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }

  void _addPackage() {
    // Logic to add a new package
    print('Add Package');
    // You might want to navigate to a form or show a dialog here
  }

  void _editPackage() {
    // Logic to edit an existing package
    print('Edit Package');
    // You might want to navigate to a form or show a dialog here
  }

  void _deletePackage() {
    // Logic to delete a package
    print('Delete Package');
    // Show a confirmation dialog and delete the package
  }
}
