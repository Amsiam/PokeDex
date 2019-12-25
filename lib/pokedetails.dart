import 'package:pokedex/pokemon.dart';
import 'package:flutter/material.dart';
class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodywidget(BuildContext context)=>Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width-20,
        left: 10.0,
        top: MediaQuery.of(context).size.height*0.1,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 100.0,),
              Text(pokemon.name,
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              Text("Height: "+pokemon.height),
              Text("Weight: "+pokemon.weight),
              Text("Types: "),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((t)=>FilterChip(label: Text(t), backgroundColor: Colors.amberAccent, onSelected: (b){})).toList(),
              ),
              Text("Weekness: "),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map((t)=>FilterChip(label: Text(t), backgroundColor: Colors.redAccent, onSelected: (b){})).toList(),
              ),
              pokemon.prevEvolution==null
              ?Text("")
              :Text("Pre Evolution: "),
              pokemon.prevEvolution==null
              ?Text("")
              :Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.prevEvolution.map((t)=>FilterChip(label: Text(t.name), backgroundColor: Colors.greenAccent, onSelected: (b){})).toList(),
              ),
              pokemon.nextEvolution==null
              ?SizedBox()
              :Text("Next Evolution: "),
              pokemon.nextEvolution==null
              ?SizedBox()
              :Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution.map((t)=>FilterChip(label: Text(t.name), backgroundColor: Colors.blueGrey, onSelected: (b){})).toList(),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pokemon.img,
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(pokemon.img),
              fit: BoxFit.cover)
            ),
          ),
        ),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: bodywidget(context),
    );
  }
}
