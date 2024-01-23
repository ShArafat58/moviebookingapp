import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TvShows extends StatelessWidget {
  final List tvshow;

  const TvShows({Key? key, this.tvshow = const [] }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text(text:'Top TV Movies', size: 26,),
          SizedBox(height: 10,),
          Container(height: 270,
            child: ListView.builder(itemCount: tvshow.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tvshow[index]['original_name'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+tvshow[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+tvshow[index]['poster_path'],
                        description: tvshow[index]['overview'],
                        vote: tvshow[index]['vote_average'].toString(),
                        launch_on: tvshow[index]['first_air_date'],)));
                    },
                    child:
                    tvshow[index]['original_name']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+tvshow[index]['poster_path']

                                )
                            )),
                          ),
                          Container(child: modified_text(text:tvshow[index]['original_name']!=null?
                          tvshow[index]['original_name']:'Loading'),)
                        ],
                      ),

                    ):Container(),
                  );
                }),)
        ],
      ),
    );
  }
}