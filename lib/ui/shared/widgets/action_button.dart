import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool enable;
  final Function onPressed;

  const ActionButton({
    required this.title,
    required this.icon,
    this.enable = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        enable ? onPressed : null;
      },
      child: Card(
        elevation: enable ? 4.0 : 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 165.0,
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: enable ? kPrimaryColor : kPrimaryLightColor,
                foregroundColor: Colors.white,
                child: Icon(icon),
              ),
              const SizedBox(width: 12.0),
              FittedBox(
                child: Text(
                  title,
                  style: TextStyle(color: enable ? Colors.black87 : Colors.black38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
