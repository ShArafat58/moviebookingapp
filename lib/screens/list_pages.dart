import 'package:flutter/material.dart';
import 'package:movie_app/screens/MovieList.dart';
import 'package:movie_app/screens/home_screen.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static List<String> pageName =['Book Ticket','Seat Booking','View Timing', 'Movie & Series List', 'Payment'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('All Pages'),),
        body: ListView.builder(
            itemCount: pageName.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(pageName[index]),
                  leading: const SizedBox(
                    width: 50,
                    height: 50
                  ),
                  onTap: (){
                    print('Came Here');
                    if(pageName[index] == 'Book Ticket') {
                      print('Going to movie Pages');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AvailableMovieList()));
                    }
                    if(pageName[index] == 'Movie & Series List') {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeScreen()));
                    }

                  },
                ),
              );
            }
        )
    );
  }
}
