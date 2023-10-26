// ignore_for_file: avoid_print

import 'package:bicoin_ticker/data_tools/coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = "coin api Key";
const url = "https://rest.coinapi.io/v1/exchangerate";

class Networking {
  Future getResponse(String selectedcurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String coin in cryptoList) {
      String api = "$url/$coin/$selectedcurrency?apikey=$apikey";

      http.Response response = await http.get(Uri.parse(api));

      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);
        double coinPrice = data['rate'];
        cryptoPrices[coin] = coinPrice.toStringAsFixed(2);
      } else {
        print('Error: ${response.statusCode}');
      }
    }
    return cryptoPrices;
  }
}
