import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/cart_screen.dart';

class AddToCartButton extends StatelessWidget {
  final String userEmail;
  final String movieName;
  final String selectedDateTime;
  final int ticketQuantity;

  AddToCartButton({
    required this.userEmail,
    required this.movieName,
    required this.ticketQuantity,
    required this.selectedDateTime,
  });

  Future<void> _addToCart() async {
    try {
      print('User Email: $userEmail');
      print('Movie Name: $movieName');
      print('Quantity: $ticketQuantity');
      print('Selected Date time: $selectedDateTime');
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      // Query Firestore for documents where productName field matches the given name
      QuerySnapshot userSnapshot = await firestore
          .collection('Users')
          .where('email', isEqualTo: this.userEmail)
          .limit(1) // Limit the result to 1 document
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        // Extract product data from the first document
        Object? userData = userSnapshot.docs.first.data();

        // Push product details to Cart collection in Firestore
        DocumentReference<Map<String, dynamic>> result = await firestore.collection('Cart').add({
          'userEmail': userEmail,
          'quantity': ticketQuantity,
          'movieName': movieName,
          'selectedDateTime': selectedDateTime,
          'userDetails': userData,
          'totalPayableamount': 500*ticketQuantity,
          'totalPaid': 0
        });

        print('Product added to cart successfully!');
        print(result.id);
      } else {
        print('Product not found in the database.');
      }
    } catch (error) {
      print('Error adding product to cart: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        _addToCart();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddToCartScreen(movieName: movieName,
          userEmail: userEmail,
          selectedDateTime: selectedDateTime,
          ticketQuantity: ticketQuantity,
          totalPayableAmount: 500*ticketQuantity as double,
        )));
      },
      child: Text('Add To Cart'),
    );
  }
}