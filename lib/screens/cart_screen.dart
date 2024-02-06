import 'package:flutter/material.dart';


class AddToCartScreen extends StatefulWidget {
  final String userEmail;
  final String movieName;
  final String selectedDateTime;
  final int ticketQuantity;
  final double totalPayableAmount;

  const AddToCartScreen({super.key,
    required this.userEmail,
    required this.movieName,
    required this.ticketQuantity,
    required this.selectedDateTime,
    required this.totalPayableAmount
  });

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: ${widget.userEmail}',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Movie: ${widget.movieName}',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Number of Tickets: ${widget.ticketQuantity}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Amount: \$${widget.totalPayableAmount}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ),
        ),
      ),
    );
  }
}
