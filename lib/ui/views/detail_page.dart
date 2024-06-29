import 'package:flutter/material.dart';
import 'package:imdb_top_10/data/entity/movies.dart';

class DetailPage extends StatefulWidget {
  Movies movie;
  DetailPage({required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.movie.name}"),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("${widget.movie.image}"),
            ),
            Text("Director : ${widget.movie.director}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Text("${widget.movie.description}"),
            )
          ],
        ),
      ),
    );
  }
}
