import 'package:flutter/material.dart';
import '../utils/text.dart';
import '../screens/home.dart';

class Description extends StatelessWidget {

  final String name, description, bannerurl, posterurl, vote, launch_on;
  //Atributos do Map que recebemos via construtor

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    //Construção do componente visual
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (_) {
                  return const Home();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: ModifiedText(
                    text: '⭐ Average Rating - $vote',
                  )),
            ])),
        const SizedBox(height: 15),
        Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
                text: name != null ? name : 'Not Loaded', size: 24)),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child:
                ModifiedText(text: 'Releasing On - $launch_on', size: 14)),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ModifiedText(text: description, size: 18)),
            ),
          ],
        )
      ]),
    );
  }
}
