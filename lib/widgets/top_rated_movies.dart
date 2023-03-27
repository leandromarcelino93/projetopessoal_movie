import 'package:flutter/material.dart';
import 'description.dart';

class TopRatedMovies extends StatelessWidget {

  final List topRatedMovies;

  const TopRatedMovies({super.key, required this.topRatedMovies});
  //Os filmes são passados via construtor para o componente visual

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            textAlign: TextAlign.center,
            'Filmes com as Melhores Avaliações ⭐',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 600,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        //Navegação para tela com detalhes dos itens
                        MaterialPageRoute(
                            builder: (context) => Description(
                              //Para todos os elementos, pegamos as informações a partir do atributo (a chave) do Map
                                  name: topRatedMovies[index]['title'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      topRatedMovies[index]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      topRatedMovies[index]['poster_path'],
                                  description: topRatedMovies[index]
                                      ['overview'],
                                  vote: topRatedMovies[index]['vote_average']
                                      .toString(),
                                  launch_on: topRatedMovies[index]
                                      ['release_date'],
                                )));
                  },
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'https://image.tmdb.org/t/p/w500' +
                                      topRatedMovies[index]['poster_path']),
                            ),
                          ),
                          height: 300,
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            topRatedMovies[index]['title'] ?? 'Loading',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
