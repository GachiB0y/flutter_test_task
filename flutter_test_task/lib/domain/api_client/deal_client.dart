import 'dart:convert';

import 'package:flutter_test_task/domain/entity/deal.dart';
import 'package:http/http.dart' as http;



class DealApiClient {
  final String host = 'https://nastintesthodl.stocrm.ru/api/external/v1';
  final String method ='/offers/get_from_filter?';
  final String sid = '10813_0c0a9a2f86eab09196705a274378b64a';
  final String page = '1';
  final String limit = '12';
  final String requestField ='1843';

  Future<List<Deal>> fetchDeal({String query = ''}) async {

    final newUrl = _makeUri(method,host,
      <String, dynamic> {
        'SID':sid,
        'PAGE':page,
        'LIMIT':limit,
        'REQUIRED_FIELDS[0]':requestField,
      },
    );

    final response = await http.get(Uri.parse(newUrl.toString()));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = jsonData['RESPONSE'];
      final List<Deal> data = (result['DATA'] as List<dynamic>).map((item) {
        return Deal.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load');
    }
  }
  Uri _makeUri( String path, String host, [Map<String, dynamic>? paramentrs]){
    final uri =Uri.parse("$host$path");

    if(paramentrs != null){
      return uri.replace(queryParameters: paramentrs);
    }else{
      return uri;
    }
  }


}
