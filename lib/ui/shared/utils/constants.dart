import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Colors.blue;
var kPrimaryLightColor = Colors.blue[100];
const kSecondaryColor = Colors.blueAccent;
const kTextColor = Color(0xff5c5c5c);
const double kScreenPadding = 18.0;

var number = NumberFormat("#,##0.00", "en_US");
var kCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      offset: const Offset(0, 3),
      blurRadius: 15,
    )
  ],
);
