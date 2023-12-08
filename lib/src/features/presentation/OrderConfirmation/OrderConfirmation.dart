import 'package:flutter/material.dart';

import '../../Domain/Entities/Order/OrderEntity.dart';

class OrderConfirmationPage extends StatefulWidget {
  final OrderEntity order;

  OrderConfirmationPage({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Order Details'),
            _buildOrderInfo('Order ID:', widget.order.orderId),
            _buildDivider(),
            _buildSectionHeader('Products:'),
            _buildProductList(),
            _buildDivider(),
            _buildSectionHeader('Total Amount:'),
            _buildOrderInfo('Total Amount:', '\$${widget.order.totalAmount}'),
            SizedBox(height: 16),
            _buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildOrderInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$label $value',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider();
  }

  Widget _buildProductList() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.order.products.length,
        itemBuilder: (context, index) {
          var product = widget.order.products[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                product.productName,
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ${product.amount}'),
                  Text('Price: \$${product.productPrice}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          // Show a confirmation dialog before confirming the order
          bool confirmed = await _showConfirmationDialog(context);

          // If confirmed, process the payment (empty method for now)
          if (confirmed) {
            _processPayment(context);
          }
        },
        child: Text('Confirmar'),
      ),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    bool confirmed = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar orden'),
          content: Text('¿Estás seguro de que deseas confirmar la orden?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // If confirmed, close the confirmation dialog
                Navigator.of(context).pop(true);
                confirmed = true;
              },
              child: Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                // If canceled, close the confirmation dialog
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
    return confirmed;
  }

  void _processPayment(BuildContext context) {
    // Leave this method empty since you don't want to integrate Stripe in this version.
  }
}
