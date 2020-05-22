import 'package:http/http.dart' as http;

class NegocioRepository {
  final apiUls = 'https://mercadito.fiuls.cl/negocios/search/'; // url de la uls

  final Map<String, String> headers = { // headers para el POST
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
  };

  constructor() {}

  Future<http.Response> getNegocios(Map<String, dynamic> body) {
    try{
      return http.post(apiUls, headers: headers, body: body);
    }
    catch(e){
      print(e);
    }
    
  }
}