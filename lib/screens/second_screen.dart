
import 'package:flutter/material.dart';
import 'package:newfile/models/movie_model.dart';
import 'package:newfile/photo_hero.dart';



class SecondScreen extends  StatefulWidget {
  final Movie movie;
  final int index;
  SecondScreen({this.movie, this.index});
  @override 
  SecondScreenState createState(){
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: PhotoHero(
          photo: widget.movie.search[widget.index].poster,
          width: 800,
          onTap: (){
             print("return");
            Navigator.pop(context);
          },
        ),
        
    ),
     
    );
    
  }
}