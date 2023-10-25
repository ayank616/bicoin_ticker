// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:bicoin_ticker/data_tools/coin_data.dart';
import 'package:bicoin_ticker/data_tools/crypto_cards.dart';
import 'package:bicoin_ticker/data_tools/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "AUD";

  //Android
  Widget getDropMenuButton() {
    List<DropdownMenuItem<String>> getCurrency = [];

    for (String i in currenciesList) {
      var currency = DropdownMenuItem(value: i, child: Text(i));
      getCurrency.add(currency);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: getCurrency,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value!;
            getData();
          },
        );
      },
    );
  }

  //IOS
  Widget getCuperTinoTicker() {
    List<Text> getCurrency = [];

    for (String i in currenciesList) {
      Text currency = Text(i);
      getCurrency.add(currency);
    }

    return CupertinoPicker(
      useMagnifier: true,
      magnification: 1.1,
      itemExtent: 30,
      onSelectedItemChanged: (selected) {
        setState(() {
          selectedCurrency = currenciesList[selected];
          getData();
        });
      },
      children: getCurrency,
    );
  }

  Map<String, String> cryptoPrices = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      isWaiting = false;
      var data = await Networking().getResponse(selectedCurrency);
      setState(() {
        cryptoPrices = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makecards() {
    List<CryptoCards> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCards(
            crypto,
            isWaiting ? '?' : cryptoPrices[crypto] ?? '0',
/*"If isWaiting is true, return '?', otherwise, if cryptoRate[crypto] is not null,
 return the value in cryptoRate[crypto], and if cryptoRate[crypto] is null, return '?'."*/
            selectedCurrency),
      );
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, children: cryptoCards);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('💰 Coin Ticker')),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makecards(),
          Container(
            height: 68.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.black,
            child: Platform.isIOS ? getCuperTinoTicker() : getDropMenuButton(),
          ),
        ],
      ),
    );
  }
}
