// class ArticleService {


//   Future<List<Article>> getArticles() async {
//     // Fetch articles from the server
//     final response = await http.get('https://api.example.com/articles');
//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response,
//       // then parse the JSON.
//       final List<dynamic> articles = json.decode(response.body);
//       return articles.map((article) => Article.fromJson(article)).toList();
//     } else {
//       // If the server returns an error response, then throw an exception.
//       throw Exception('Failed to load articles');
//     }
//   }
// }
