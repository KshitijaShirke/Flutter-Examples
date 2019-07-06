import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:tabbar_example/post.dart';

void main()=> runApp(
    MaterialApp(home:MyApp()
    )
);

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{

  Future<List<Post>> showPosts() async {
    var data= await http.get("https://jsonplaceholder.typicode.com/posts");
    var dataDecode=json.decode(data.body);

    List<Post> posts=List();
    dataDecode.forEach((post){
      String title=post["title"];
      if(title.length>25){
        title=post["title"].toString().substring(1,25)+"....";
      }
      String body=post["body"].toString().replaceAll(RegExp(r'\n')," ");
      posts.add(Post(title, body));
    });

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
         title: Text("JsonDataExample"),
       ),
       body: Padding(
           padding: const EdgeInsets.all(8.0),
           child : FutureBuilder(
           future: showPosts(),
           builder: (context,snapshot){
             if(snapshot.hasData){
               return ListView.builder(
                   itemCount: snapshot.data.length,
                   itemBuilder: (context,index){
                     return Card(
                       child:  Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.stretch,
                           children: <Widget>[
                             Text(snapshot.data[index].title,style: TextStyle(fontSize: 30.0)),
                             Divider(),
                             Text(snapshot.data[index].text,style: TextStyle(fontSize: 15.0)),
                             Divider(),
                             RaisedButton(
                                 child: Text("Read More"),
                                 onPressed: (){}
                             )
                           ],
                         ),
                       ),
                     );
                   }
               );
             }else{
                return Align(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                );
             }
           }
       ),
       ),
    );
  }
}
