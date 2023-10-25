// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CryptoCards extends StatelessWidget {
  CryptoCards(this.clabel, this.rate, this.selectedcurrency);
  final String clabel, rate, selectedcurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 0),
      child: Card(
        color: Colors.black45,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $clabel = $rate $selectedcurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
