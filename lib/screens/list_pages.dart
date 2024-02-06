import 'package:flutter/material.dart';
import 'package:movie_app/screens/MovieList.dart';
import 'package:movie_app/screens/home_screen.dart';

class ListPage extends StatefulWidget {
  final String user_email;
  const ListPage({Key? key, this.user_email = ''})
      : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static List<String> pageName =['Book Ticket','Movie & Series List'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello ${widget.user_email}")),
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
                    if(pageName[index] == 'Book Ticket') {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                          AvailableMovieList(user_email: "${widget.user_email}")));
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
