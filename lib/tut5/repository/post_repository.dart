import 'package:http/http.dart' as http;

class PostRepository {
  Future<http.Response> getPosts() async {
    try {
      var posts = await http.get('https://jsonplaceholder.typicode.com/posts');
      return posts;
    } catch (e) {
      throw PostsExcpetion();
    }
  }
}

class PostsExcpetion implements Exception {
  String message;
  PostRepository() {
    this.message = 'There is a posts excpetion we will get that solution soon';
  }
}
