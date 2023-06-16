import 'dart:convert';

import 'package:flutter_test_task/domian/entity/deal.dart';
import 'package:http/http.dart' as http;

class DealApiClient {
  Future<List<Deal>> fetchDeal({String query = ''}) async {
    var url =
        'https://nastintesthodl.stocrm.ru/api/external/v1/offers/get_from_filter?SID=10813_0c0a9a2f86eab09196705a274378b64a&PAGE=1&LIMIT=12&REQUIRED_FIELDS[0]=1843';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = jsonData['RESPONSE'];

      final List<Deal> data = (result['DATA'] as List<dynamic>).map((item) {
        return Deal.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
