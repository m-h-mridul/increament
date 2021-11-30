// ignore_for_file:, unused_local_variable, unnecessary_new
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> fetchmovises() async {
    const String baseURL = 'https://api.tvmaze.com/shows/82';
    var url = Uri.parse(baseURL);
    final response = await http.get(url);
    // var response = await Dio().get(baseURL);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      throw Exception('Failed to load post: ');
    }
  }

  //
  //
  //
  // using for rapid api movise data

  // var headers = {
  //   'Content-Type': "application/json",
  //   'x-rapidapi-host': "imdb8.p.rapidapi.com",
  //   'x-rapidapi-key': "c07dcdb58bmshcb98b73d0f5b861p18be85jsn414fb79b6d63"
  // };
  // Future<List<MoviseModel>> populermoviseget() async {
  //   print('step 1');
  //   List<MoviseModel> mdetals = [];
  //   String url =
  //       "https://imdb8.p.rapidapi.com/title/get-most-popular-movies?homeCountry=US&purchaseCountry=US&currentCountry=US";
  //   var result = await http.get(Uri.parse(url), headers: headers);
  //   if (result.statusCode == 200) {
  //     print('step 2');
  //     var resMap = json.decode(result.body);
  //     for (var element in resMap) {
  //       String title =
  //           element.toString().replaceAll(new RegExp(r'(\/)*(title)*'), '');
  //       String murl =
  //           'https://imdb8.p.rapidapi.com/title/get-overview-details?tconst=${title}&currentCountry=US';
  //       print('step 4');
  //       var movisedetails = await http.get(Uri.parse(murl), headers: headers);
  //       if (movisedetails.statusCode == 200) {
  //         print('step 5');
  //         var md = jsonDecode(movisedetails.body) as Map;
  //         print('step 6');
  //         mdetals.add(MoviseModel(
  //           m_imageurl: md['title']['image']['url'],
  //           m_name: md['title']['title'],
  //           m_genere: md['genres'][0],
  //           m_rating: md['ratings']['rating'].toString(),
  //           m_stroy: md["plotSummary"]['text'].toString(),
  //           m_stroywritter: md["plotSummary"]['author'].toString(),
  //           m_year: md['title']['year'].toString(),
  //         ));
  //         print(md['plotSummary']['text']);
  //       }
  //     }
  //   }else{
  //     print(result.statusCode);
  //   }
  //   return mdetals;
  // }
}
