import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  // static const String url = "http://31.187.76.34:8090/";
  static const String url = "http://185.98.137.115:8082/";

  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': '*/*',
      };

  postData(data, apiUrl) async {
    final fullurl = url + apiUrl;
    return await http.post(Uri.parse(fullurl),body: jsonEncode(data), headers: setHeaders());
  }


  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  getDataWithID(apiUrl,int id) async {
    var fullUrl = url + apiUrl + "/" + id.toString();
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }
  patchDataWithID(apiUrl,int id) async {
    var fullUrl = url + apiUrl + "/" + id.toString();
    return await http.patch(Uri.parse(fullUrl), headers: setHeaders());
  }
  
}
