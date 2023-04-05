import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  final response = await http.get(Uri.parse('http://localhost/wordpress/wp-json/wp/v2/posts?_embed'), headers: {"Accept":"application/json"});
  var convertDatatoJson = jsonDecode(response.body);

  for (var post in convertDatatoJson) {
    //post['image_url'] = post['_embedded']['wp:featuredmedia']?[0]['source_url'];
    post['image_url'] = post['_embedded']['wp:featuredmedia']?[0]['source_url'] ?? 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png';
  }

  return convertDatatoJson;
}