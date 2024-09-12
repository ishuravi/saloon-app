import 'package:flutter/material.dart';
import '../color/colors.dart';

class CustomerProfileScreen extends StatefulWidget {
  @override
  _CustomerProfileScreenState createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Customer Profile'),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: <Widget>[
          // Profile Header
          Container(
            padding: EdgeInsets.all(16.0),
            color: AppColors.primary,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Customer Name',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'customer.email@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Tabs or Sections for Profile Details
          Expanded(
            child: DefaultTabController(
              length: 5, // Number of tabs
              child: Column(
                children: <Widget>[
                  TabBar(
                    tabs: [
                      Tab(text: 'Bills'),
                      Tab(text: 'Transactions'),
                      Tab(text: 'Notes'),
                      Tab(text: 'Memberships'),
                      Tab(text: 'Packages'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildBillsTab(),
                        _buildTransactionsTab(),
                        _buildNotesTab(),
                        _buildMembershipsTab(),
                        _buildPackagesTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillsTab() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        // Replace with dynamic data
        ListTile(
          title: Text('Bill #1234'),
          subtitle: Text('Amount: \$100'),
        ),
        ListTile(
          title: Text('Bill #1235'),
          subtitle: Text('Amount: \$150'),
        ),
      ],
    );
  }

  Widget _buildTransactionsTab() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        // Replace with dynamic data
        ListTile(
          title: Text('Transaction #5678'),
          subtitle: Text('Amount: \$50'),
        ),
        ListTile(
          title: Text('Transaction #5679'),
          subtitle: Text('Amount: \$75'),
        ),
      ],
    );
  }

  Widget _buildNotesTab() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        // Replace with dynamic data
        ListTile(
          title: Text('Note #1'),
          subtitle: Text('Details about this note.'),
        ),
        ListTile(
          title: Text('Note #2'),
          subtitle: Text('Details about this note.'),
        ),
      ],
    );
  }

  Widget _buildMembershipsTab() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        // Replace with dynamic data
        ListTile(
          title: Text('Membership #1'),
          subtitle: Text('Details about this membership.'),
        ),
        ListTile(
          title: Text('Membership #2'),
          subtitle: Text('Details about this membership.'),
        ),
      ],
    );
  }

  Widget _buildPackagesTab() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        // Replace with dynamic data
        ListTile(
          title: Text('Package #1'),
          subtitle: Text('Details about this package.'),
        ),
        ListTile(
          title: Text('Package #2'),
          subtitle: Text('Details about this package.'),
        ),
      ],
    );
  }
}
