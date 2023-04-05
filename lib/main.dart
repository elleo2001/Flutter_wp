import 'package:flutter/material.dart';
import 'package:flutter_application_1/post.dart';
import 'wp_api.dart';
import 'package:html/parser.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.blue[900],
        ),
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (BuildContext contex) => MyHomePage(),
        PostDetail.routeName: (BuildContext context) => PostDetail(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance blog'),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: fetchWpPosts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var posts = snapshot.data;
                return Column(children: [
                  ...posts.map((e) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(PostDetail.routeName, arguments: e),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 40, bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: FadeInImage(
                                    placeholder:
                                        AssetImage('assets/img/loading.gif'),
                                    image: NetworkImage(e!['image_url'])),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      e['title']['rendered'],
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                    Text(
                                      parse(e['content']['rendered'])
                                          .documentElement!
                                          .text,
                                      maxLines: 3,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final textiTheme = Theme.of(context).textTheme;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Finance Blog',
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           color: Colors.yellow,
//         ),

//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//       initialRoute: MyHomePage.routeName,
//       routes: {
//         MyHomePage.routeName: (BuildContext contex) => MyHomePage(),
//         PostDetail.routeName: (BuildContext context) => PostDetail(),
//       },
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//   static const routeName = 'home';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Text("Finance Blog"),
//           FutureBuilder(
//             future: fetchWpPosts(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 var posts = snapshot.data;
//                 return Column(children: [
//                   ...posts.map((e) {
//                     return GestureDetector(
//                       onTap: () => Navigator.of(context)
//                           .pushNamed(PostDetail.routeName, arguments: e),
//                       child: Column(
//                         children: <Widget>[
//                           FadeInImage(
//                               placeholder: AssetImage('assets/loading.gif'),
//                               image: NetworkImage(
//                                   'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg')
//                               //  image: NetworkImage(e["_embedded"]["wp:featuredmedia"][0]["media_details"]["sizes"]["medium_large"]["source_url"])
//                               ),
//                           Container(
//                             padding: EdgeInsets.all(20),
//                             child: Column(
//                               children: <Widget>[
//                                 Text(
//                                   e['title']['rendered'],
//                                   style: const TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blueAccent),
//                                 ),
//                                 Text(
//                                   parse(e['content']['rendered'])
//                                       .documentElement!
//                                       .text,
//                                   maxLines: 3,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ]);
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


////////////////////////////////////////////////////////////

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Finance blog',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow,
//       ),
//       home:  MyMyHomePage(),
//       initialRoute: MyMyHomePage.routeName,
//       routes: {
//         MyMyHomePage.routeName : (BuildContext contex) => MyMyHomePage(),
//         PostDetail.routeName : (BuildContext context) => PostDetail()
//       },
//     );
//   }
// }

// class MyMyHomePage extends StatelessWidget {
//   const MyMyHomePage({Key? key}) : super(key: key);
//   static const routeName = 'home';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Finance blog'),),
//       body: Container(
//         child: FutureBuilder(
//           future: fetchWpPosts(),
//           builder: (context, snapshot)   {
//             if(snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (BuildContext context, int index){
//                   Map wppost = snapshot.data![index];
//                   return GestureDetector(
//                     onTap: (){
//                       if(wppost != null){ 
//                       Navigator.of(context).pushNamed(PostDetail.routeName, arguments: wppost);
//                       }
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                       Padding(
//                       padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
//                       child: Image.asset(
//                         'assets/img/leo.jpg',
//                         ),
//                         ),
//                         Text(
//                           wppost['title']['rendered'],
//                            style: const TextStyle(
//                            fontSize: 22,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.blueAccent),
//                         ),
                  
//                         HtmlWidget(
//                           (wppost['excerpt']['rendered'])
//                         )
//                       ],
//                      ),
//                   );
//                 },
//                 );
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }