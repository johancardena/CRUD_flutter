import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<List<dynamic>> obtenerDeals(int pagina) async {

    final response = await http.get(
      Uri.parse(
        'https://www.cheapshark.com/api/1.0/deals?pageNumber=$pagina&pageSize=10',
      ),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }
}
