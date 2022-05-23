import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  const ActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 165.0,
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                child: Icon(icon),
              ),
              const SizedBox(width: 12.0),
              FittedBox(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
