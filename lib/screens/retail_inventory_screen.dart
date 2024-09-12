import 'package:flutter/material.dart';
import '../color/colors.dart';

class RetailInventoryScreen extends StatefulWidget {
  @override
  _RetailInventoryScreenState createState() => _RetailInventoryScreenState();
}

class _RetailInventoryScreenState extends State<RetailInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Retail Inventory'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _buildCategoryFilter(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildProductItem('Product 1', 'Brand A', 100, 20),
                  _buildProductItem('Product 2', 'Brand B', 150, 5),
                  // Add more products as needed
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showAddProductDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Add Product', style: TextStyle(color: AppColors.text)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return DropdownButton<String>(
      value: 'All',
      onChanged: (String? newValue) {
        // Handle category change
        print('Selected category: $newValue');
      },
      items: <String>['All', 'Brand A', 'Brand B'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildProductItem(String productName, String brand, double price, int stock) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Brand: $brand\nPrice: \$${price.toStringAsFixed(2)}\nStock: $stock'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            _showEditProductDialog(productName, brand, price, stock);
          },
        ),
      ),
    );
  }

  void _showAddProductDialog() {
    // Show dialog to add a new product
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Product'),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Stock Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Add product logic
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditProductDialog(String productName, String brand, double price, int stock) {
    // Show dialog to edit the selected product
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: productName),
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: TextEditingController(text: brand),
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              TextField(
                controller: TextEditingController(text: price.toStringAsFixed(2)),
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: TextEditingController(text: stock.toString()),
                decoration: InputDecoration(labelText: 'Stock Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Edit product logic
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
