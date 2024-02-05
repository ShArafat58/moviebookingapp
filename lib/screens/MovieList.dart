import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/widgets/tv.dart';

class AvailableMovieList extends StatefulWidget {
  const AvailableMovieList({super.key});

  @override
  State<AvailableMovieList> createState() => _AvailableMovieListState();
}

class _AvailableMovieListState extends State<AvailableMovieList> {
  List tvmovies = [];

  @override
  void initState(){
    super.initState();
    loadmovies();
  }

  loadmovies()async{
    Iterable l = [
      {
        "adult": false,
        "backdrop_path": "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
        "genre_ids": [
          18,
          80
        ],
        "id": 278,
        "original_language": "en",
        "original_title": "The Shawshank Redemption",
        "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
        "popularity": 140.141,
        "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
        "release_date": "1994-09-23",
        "title": "The Shawshank Redemption",
        "video": false,
        "vote_average": 8.711,
        "vote_count": 25393
      },
      {
        "adult": false,
        "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
        "genre_ids": [
          18,
          80
        ],
        "id": 238,
        "original_language": "en",
        "original_title": "The Godfather",
        "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        "popularity": 142.932,
        "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        "release_date": "1972-03-14",
        "title": "The Godfather",
        "video": false,
        "vote_average": 8.707,
        "vote_count": 19335
      },
      {
        "adult": false,
        "backdrop_path": "/kGzFbGhp99zva6oZODW5atUtnqi.jpg",
        "genre_ids": [
          18,
          80
        ],
        "id": 240,
        "original_language": "en",
        "original_title": "The Godfather Part II",
        "overview": "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
        "popularity": 78.574,
        "poster_path": "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
        "release_date": "1974-12-20",
        "title": "The Godfather Part II",
        "video": false,
        "vote_average": 8.592,
        "vote_count": 11665
      },
      {
        "adult": false,
        "backdrop_path": "/3f92DMBTFqr3wgXpfxzrb0qv8nG.jpg",
        "genre_ids": [
          18,
          36,
          10752
        ],
        "id": 424,
        "original_language": "en",
        "original_title": "Schindler's List",
        "overview": "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.",
        "popularity": 72.135,
        "poster_path": "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
        "release_date": "1993-12-15",
        "title": "Schindler's List",
        "video": false,
        "vote_average": 8.572,
        "vote_count": 15026
      },
      {
        "adult": false,
        "backdrop_path": "/qqHQsStV6exghCM7zbObuYBiYxw.jpg",
        "genre_ids": [
          18
        ],
        "id": 389,
        "original_language": "en",
        "original_title": "12 Angry Men",
        "overview": "The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanish-American is guilty or innocent of murdering his father. What begins as an open and shut case soon becomes a mini-drama of each of the jurors' prejudices and preconceptions about the trial, the accused, and each other.",
        "popularity": 72.611,
        "poster_path": "/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg",
        "release_date": "1957-04-10",
        "title": "12 Angry Men",
        "video": false,
        "vote_average": 8.545,
        "vote_count": 7965
      },
      {
        "adult": false,
        "backdrop_path": "/90ez6ArvpO8bvpyIngBuwXOqJm5.jpg",
        "genre_ids": [
          35,
          18,
          10749
        ],
        "id": 19404,
        "original_language": "hi",
        "original_title": "दिलवाले दुल्हनिया ले जायेंगे",
        "overview": "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
        "popularity": 36.833,
        "poster_path": "/lfRkUr7DYdHldAqi3PwdQGBRBPM.jpg",
        "release_date": "1995-10-20",
        "title": "Dilwale Dulhania Le Jayenge",
        "video": false,
        "vote_average": 8.5,
        "vote_count": 4324
      },
      {
        "adult": false,
        "backdrop_path": "/mSDsSDwaP3E7dEfUPWy4J0djt4O.jpg",
        "genre_ids": [
          16,
          10751,
          14
        ],
        "id": 129,
        "original_language": "ja",
        "original_title": "千と千尋の神隠し",
        "overview": "A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.",
        "popularity": 119.958,
        "poster_path": "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
        "release_date": "2001-07-20",
        "title": "Spirited Away",
        "video": false,
        "vote_average": 8.539,
        "vote_count": 15413
      }
    ];
    // const data = FirebaseFirestore.instance.collection("AvailableMovies").snapshots();
    setState(() {
      tvmovies = List.from(l.map((model)=> (model)));
    });
    print(tvmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Available Movies')),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("AvailableMovies").snapshots(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.active) {
              if(snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot?.data?.docs?.length,
                    itemBuilder: (context,index){
                      QueryDocumentSnapshot<Map<String, dynamic>>? data = snapshot?.data?.docs[index];

                      // Extract data from the JSON object
                      return Card(
                        child: ListTile(
                          title: Text(snapshot?.data?.docs[index]['title']),
                          leading: const SizedBox(
                              width: 50,
                              height: 50
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: snapshot?.data?.docs[index]['title'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500'+snapshot?.data?.docs[index]['backdrop_path'],
                              posterurl: 'https://image.tmdb.org/t/p/w500'+snapshot?.data?.docs[index]['poster_path'],
                              description: snapshot?.data?.docs[index]['overview'],
                              vote: "${snapshot?.data?.docs[index]['vote_average']}",
                              launch_on: snapshot?.data?.docs[index]['release_date'],)));
                          },
                        ),
                      );
                    }
                );
              }
            }

            return Center(child: CircularProgressIndicator());
          }
        )
    );
  }
}
