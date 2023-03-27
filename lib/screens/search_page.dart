import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class SearchPage extends SearchDelegate<String> {

  @override
  String get searchFieldLabel => 'Digite o nome do filme';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: (){
          query = '';
        },
          icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: (){
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container();
    }
    return FutureBuilder<List>(
        future: sugestions(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  print(snapshot.hasData);
                  return ListTile(
                    //leading: Image.network(snapshot.data![index]['backdrop_path']),
                    title: Text(snapshot.data![index]['title']),
                  );
                });
          } else if(snapshot.hasError){
            return const Center(
              child: Text('Erro ao pesquisar filme'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List> sugestions() async {
    var url = Uri.parse('${Constants.BaseUrl}?search=$query');
    // Map<String, String> headers = {
    // 'Authorization': '',
    // };
    var response = await http.get(url);
    print(response.body);
    if(response.statusCode == 200) {
      return jsonDecode(response.body).map((movie) => movie.toList());
    }
    throw Exception('Erro ao solicitar o filme solicitado');
  }
}