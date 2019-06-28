import 'package:flutter/material.dart';
//import 'package:newfile/models/movie_model.dart';
import 'package:newfile/screens/first_Screen.dart';
//import 'package:poster/routes/routes.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:newfile/screens/second_screen.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
   
      
    );
  }
}
class  MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end:  Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7,0.9],
            colors: [
              Colors.grey[900],
              Colors.grey[800],
              Colors.grey[800],
              Colors.grey[700],
            ],
          ),
        ),
        child: Center(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(90),
              ),
              Container(
                width: 400,
                height: 400,
                child: 
                Column(
                  children: <Widget>[
                  Text("Poster",
                  style: TextStyle(color: Colors.orange[500],fontWeight: FontWeight.w900,fontStyle: FontStyle.italic,fontFamily: 'Kranky', fontSize: 85),),
                   Text("Gully",
                  style: TextStyle(color: Colors.amber[400],fontWeight: FontWeight.w900,fontStyle: FontStyle.italic,fontFamily: 'Kranky', fontSize: 60),),
                 ], 
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
               child: TextField(
                 controller: controller,
                 decoration: InputDecoration(
                    //labelText: 'write any title'
                    hintText: "write any title",
                    icon: Icon(Icons.text_fields),
          
                  ),
               ),
              ),
       Padding(
         padding: EdgeInsets.all(7),
       ),
       RaisedButton(
                           child: Center(
                             child: Text("START"),
                             
                           ),
                           color: Colors.amber[300],
                           
                           onPressed: (){
                         
                           
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => FirstScreen(name: controller.text) )
                );  
                           },
                         ),
                         Padding(
                           padding: EdgeInsets.all(7),
                         ),
                         Center(
                         child:Text("write any movie's salutation to find interesting results... ",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15)),),
            ],
          ),
        ),
      ),
    );
  }
}
