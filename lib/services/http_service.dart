import 'package:covid19/model/model.dart';
import 'package:covid19/model/summary.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future getcountrylist() async {
    String uri = "https://api.covid19api.com/countries";
    var url = Uri.parse(uri);
    var response = await get(url);
    List<Welcome> data = welcomeFromJson(response.body);
    List country = data;
    return country;
  }

  Future getsummary() async {
    String uri = "https://api.covid19api.com/summary";
    var url = Uri.parse(uri);
    var response = await get(url);
    Summary summarydata = summaryFromJson(response.body);
    Global summary = summarydata.global!;
    return summary;
  }

  // Future<List<Post>> getPosts() async {
  //   Response res = await get(postsURL);

  //   if (res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body);

  //     List<Post> posts = body
  //       .map(
  //         (dynamic item) => Post.fromJson(item),
  //       )
  //       .toList();

  //     return posts;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }
}
