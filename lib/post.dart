import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'wp_api.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({Key? key}) : super(key: key);

  static const routeName = 'detail';

  @override
  Widget build(BuildContext context) {
    Map? wppost = ModalRoute.of(context)!.settings.arguments as Map?;
    if (wppost != null) {
      String imageUrl = wppost['image_url'] ?? '';
      return Scaffold(
        appBar: AppBar(title: Text(wppost['title']['rendered'])),
        body: ListView(children: <Widget>[
          imageUrl.isNotEmpty
              ? Container(
                  height: 200,
                  width: 1000,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image: imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
            child: HtmlWidget((wppost['content']['rendered'])))
        ]),
      );
    } else {
      // return const CircularProgressIndicator();
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: FutureBuilder(
            future: fetchWpPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map wppost = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        if (wppost != null) {
                          Navigator.of(context).pushNamed(PostDetail.routeName,
                              arguments: wppost);
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 5, bottom: 5),
                          ),
                          Text(
                            wppost['title']['rendered'],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                          HtmlWidget((wppost['excerpt']['rendered']))
                        ],
                      ),
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      );
    }
  }
}
