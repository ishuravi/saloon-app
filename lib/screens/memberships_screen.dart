import 'package:flutter/material.dart';
import '../color/colors.dart';

class MembershipsScreen extends StatefulWidget {
  @override
  _MembershipsScreenState createState() => _MembershipsScreenState();
}

class _MembershipsScreenState extends State<MembershipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Memberships'),
        backgroundColor: AppColors.primary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addMembership,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          _buildMembershipItem('Membership 1', 'Details about Membership 1'),
          _buildMembershipItem('Membership 2', 'Details about Membership 2'),
          // Add more memberships as needed
        ],
      ),
    );
  }

  Widget _buildMembershipItem(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Edit') {
              _editMembership();
            } else if (value == 'Delete') {
              _deleteMembership();
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

  void _addMembership() {
    // Logic to add a new membership
    print('Add Membership');
    // You might want to navigate to a form or show a dialog here
  }

  void _editMembership() {
    // Logic to edit an existing membership
    print('Edit Membership');
    // You might want to navigate to a form or show a dialog here
  }

  void _deleteMembership() {
    // Logic to delete a membership
    print('Delete Membership');
    // Show a confirmation dialog and delete the membership
  }
}
