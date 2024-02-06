import 'package:flutter/material.dart';
import 'package:movie_app/utils/add_to_cart.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatefulWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on, email;
  final bool bookTicket;


  const Description({super.key, this.name = '',
    this.description = '',this.bannerurl = '', this.posterurl = '', this.vote = '', this.launch_on = '',
    this.email = '', this.bookTicket = false});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int _quantity = 1;
  DateTime _selectedDate = DateTime.now();
  List<String> _availableDates = [
    'FEB 6 - 10:00 AM',
    'FEB 7 - 11:30 AM',
    'FEB 8 - 2:00 PM',
  ];
  String _selectedDateTime = 'FEB 6 - 10:00 AM';

  void _updateQuantity(String value) {
    setState(() {
      _quantity = int.tryParse(value) ?? 1;
    });
  }

  // const _DescriptionState({this.name = '', this.description = '', this.bannerurl = '', this.posterurl = '',
  // this.vote = '', this.launch_on = '', this.email = '', this.bookTicket = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.name!=null?widget.name:''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: ListView(
          children:[
            Container(
              height: 250,
              child:Stack(
                children:[
                  Positioned(child: Container(
                    height:250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(widget.bannerurl, fit: BoxFit.cover,),

                  )),
                  Positioned(bottom: 10,
                      child: modified_text(text:'  ⭐ Average Rating - '+widget.vote, size: 18))
                ],
              )
            ),
            SizedBox(height: 15,),
            Container(padding: EdgeInsets.all(10),
            child: modified_text(text: widget.name!=null?widget.name:'Not Loaded', size: 24,),)
            ,Container(padding: EdgeInsets.only(left: 10),
              child: modified_text(text:'Releasing On - '+widget.launch_on, size: 14,),),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(widget.posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modified_text(text:widget.description, size: 18,),
                  ),
                )
              ],
            )],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: _selectedDateTime,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDateTime = newValue!;
                  });
                },
                items: _availableDates.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // Text('Amount: '),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: _updateQuantity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  AddToCartButton(
                    userEmail: widget.email,
                    ticketQuantity: _quantity,
                    movieName: widget.name,
                    selectedDateTime: _selectedDateTime,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}