import 'package:global_fitness/data/model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
 // https://api.openweathermap.org/data/2.5/weather?q=London&appid=b6b9ce5fe64fe91ed4a62f9894b88124

 final String authority = 'api.openweathermap.org';
 final String path = 'data/2.5/weather';
 final String apiKey = 'b6b9ce5fe64fe91ed4a62f9894b88124';

 Future<Weather> getWeather(String location) async {
   Map<String, dynamic> parameters = {
     'q': location, 'appid': apiKey
   };

   Uri uri = Uri.https(authority, path, parameters);
   http.Response result = await http.get(uri);
   Map<String, dynamic> data =  json.decode(result.body);
   
   Weather weather = Weather.fromJson(data);
   
   return weather;
 }
}