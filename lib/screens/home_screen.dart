import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

// class _LoginState extends State {}

class _HomeState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tvmovies = [];
  final String apikey = '381915bb016431e725c163deb14a2975';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODE5MTViYjAxNjQzMWU3MjVjMTYzZGViMTRhMjk3NSIsInN1YiI6IjY1N2Q4NzUyYzkwNTRmMDZjY2I1NGUxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Z7u1SpQ0Z9tHbEjmIzj7QI6TBKOeCV8ecVL0tv-mKQ';

  @override
  void initState(){
    super.initState();
    loadmovies();
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken), logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true
    ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getTopRated();

    print("==============TRENDING RESULT START ===================");

    print(trendingresult['total_results']);

    print("==============TRENDING RESULT END ===================");

    print("==============TOP RATED RESULT START ===================");

    print(topratedresult['total_results']);

    print("==============TOP RATED  RESULT END ===================");

    print("==============TV RESULT START ===================");

    print(tvresult['total_results']);

    print("==============TV  RESULT END ===================");

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tvmovies = tvresult['results'];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: modified_text(text: 'Movie Ticket Booking App💗'),
        ),
        body: ListView(
          children: [
            TopRated(toprated: topratedmovies),
            TrendingMovies(trending: trendingmovies),
            TvShows(tvshow: tvmovies),
          ],
        )
    );
  }
}
