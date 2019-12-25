import 'package:pokedex/pokedetails.dart';
import 'package:pokedex/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(
  MaterialApp(
      title: "PokeDex",
      home: MyApp()
      )
      );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokehub;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData() async{
    var res = await http.get(url);
    var decoded = jsonDecode(res.body);
    pokehub = PokeHub.fromJson(decoded);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("PokeDex"),
          centerTitle: true,
        ),
        body: pokehub==null
        ?Center(child: CircularProgressIndicator(),)
        :Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: pokehub.pokemon.map((Pokemon poke)=>InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PokeDetail(pokemon: poke)));
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Hero(
                      tag: poke.img,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(poke.img),
                          )
                        ),
                      ),
                    ),
                    Text(poke.name,)
                  ],
                ),
              ),
            )).toList(),
          ),
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.teal,
          child: Icon(Icons.refresh),
        ),
    );
  }
}