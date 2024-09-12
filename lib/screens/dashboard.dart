import 'package:flutter/material.dart';
import 'package:saloon/screens/profile.dart';
import '../color/colors.dart';
import 'appoinment.dart';
import 'billing.dart';
import 'reports.dart';
import 'memberships_screen.dart'; // Import for MembershipsScreen
import 'retail_inventory_screen.dart'; // Import for RetailInventoryScreen

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.accent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                _buildMetricsSection(),
                SizedBox(height: 20),
                _buildQuickAccessButtons(context),
                SizedBox(height: 20),
                // Add more widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMetricItem(Icons.attach_money, 'Total Sales', '\$10000'),
              _buildMetricItem(Icons.calendar_today, 'Appointments', '20'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricItem(IconData icon, String label, String value) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 40, color: AppColors.background),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccessButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          _buildQuickAccessCard(context, 'Billing', Icons.payment, BillingScreen()),
          _buildQuickAccessCard(context, 'Appointments', Icons.calendar_today, AppointmentsScreen()),
          _buildQuickAccessCard(context, 'Reports', Icons.report, ReportsScreen()),
          _buildQuickAccessCard(context, 'Profile', Icons.person, CustomerProfileScreen()),
          _buildQuickAccessCard(context, 'Memberships', Icons.card_membership, MembershipsScreen()),
          _buildQuickAccessCard(context, 'Retail Inventory', Icons.store, RetailInventoryScreen()),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(BuildContext context, String label, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjusted padding for column layout
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          child: Container(
            width: double.infinity, // Make the cards take the full width
            height: 120,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.secondary, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(icon, size: 40, color: Colors.black),
                SizedBox(width: 16), // Add spacing between icon and text
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
