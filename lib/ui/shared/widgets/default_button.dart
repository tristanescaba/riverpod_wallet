import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              // side: BorderSide(color: Colors.red),
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: SizedBox(
          width: double.infinity,
          height: 50.0,
          child: Center(child: Text(title, style: const TextStyle(fontSize: 17.0))),
        ),
      ),
    );
  }
}
