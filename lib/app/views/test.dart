import 'package:http/http.dart' as http;
import 'dart:convert';

fetchLink() async {
  final response = await http
      .get(Uri.parse('https://gpdvetquimica.com.br/push_mobile_image'));
  final url = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}

void main() {
  fetchLink();
}
