
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newfile/config/config.dart';
import 'package:newfile/models/movie_model.dart';
import 'package:newfile/photo_hero.dart';
import 'package:newfile/screens/second_screen.dart';
import 'package:newfile/services/api.dart';

class FirstScreen extends  StatefulWidget {
 final String name;
  FirstScreen({this.name});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
with SingleTickerProviderStateMixin {
  bool loading = false;
  bool errorloading = false;
  Movie movie = Movie();
  @override
  void initState() { 
    super.initState();
   print(widget.name);
   _getData();
  }
  _getData() async{
    try{
      print(config['BASE_URL']+"${widget.name}");
    movie = Movie.fromJson(await Api.getRequest(config['BASE_URL']+"${widget.name}"));
    print(movie.search[0].title);
    print(movie.search[0].poster);
    setState(() {
      loading = true;
    });
    
    }catch(e){
      print("error => ${e.toString()}");
          setState(() {
      errorloading = true;
    });
   
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EXPLORE"),
        backgroundColor: Colors.black,
      ),
      body:
      loading
      ?  Center(
      child: InkWell(
        child:Container(
         decoration: BoxDecoration(
           color: Colors.black,
           border: Border(
             top: BorderSide(width: 2.5),
             bottom: BorderSide(width: 2.5),
            ),
          ),
          child: ListView.builder(
            itemCount: movie.search.length,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: () {
                        print("tap");
                        //Navigator.push(context, MaterialPageRoute(
                         //builder: (BuildContext context) => SecondScreen() ));
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1,0.5,0.7,0.9],
                                colors: [
                                  Colors.amber[100],
                                  Colors.amber[100],
                                  Colors.amber[100],
                                  Colors.amber[100],
                                ]
                              )
                            ),
                             child: 
                             PhotoHero(
                               photo: movie.search[index].poster,
                               width: 100,
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) => SecondScreen(movie: movie, index: index) ));
                               },
                             )
                          ),
                          Container(
                              width: 314,
                              height: 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.1,0.5,0.7,0.9],
                                  colors: [
                                    Colors.amber[200],
                                    Colors.amber[200],
                                    Colors.amber[100],
                                    Colors.amber[100],
                                  ]
                                )
                              ),
                              child:Container(
                                child:
                              Column(
                                children: <Widget>[
                                  Text(movie.search[index].title.toUpperCase(),
                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                                   Text("RELEASED YEAR- ${movie.search[index].year}",
                                   style: TextStyle(fontSize: 20),),
                                  Text("TYPE- ${movie.search[index].type.toUpperCase()}",
                                  style: TextStyle(fontSize: 20),),
                                ],
                              ),),
                            ), 
                        ],
                       ),), );
            },
          ),
        ),
      )):errorloading ?
      Center(
          child: Container(
            child: 
            Column(
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.all(180),
                ),
                Text("sorry,no results found....",style: TextStyle(fontSize: 30),),
                Icon(Icons.mood_bad, size: 100,),
              ],
            ),
          ),
      ): Center( child:CircularProgressIndicator(backgroundColor: Colors.white,)),
     
   );
  }
}