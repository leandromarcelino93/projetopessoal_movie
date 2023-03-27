import 'package:flutter/material.dart';
import '../screens/search_page.dart';
import '../widgets/top_rated_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Chaves de acesso fornecidas pelo TMDB
  final String apikey = '';
  final String readAccessToken =
      '';

  //Lista para armazenar os filmes
  List topRatedMovies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  //Chamada a API
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    //Map que armazena o JSON
    Map TopRated = await tmdbWithCustomLogs.v3.movies.getTopRated();
    //print((TopRated));
    setState(() {
      topRatedMovies = TopRated['results'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie DB App'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage(),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          TopRatedMovies(
            topRatedMovies: topRatedMovies,
          ),
        ],
      ),
    );
  }
}