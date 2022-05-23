import 'package:flutter/material.dart';

class InformationTile extends StatelessWidget {
  final String title;
  final String value;

  const InformationTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 14.0)),
        Text(value, style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
