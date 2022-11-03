import 'package:flutter/material.dart';
import 'package:flutter_hello_world/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final dynamic text;
  final Color color;
  final Color iconColor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      this.color = Colors.black87,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text.toString(),
          color: color,
        ),
      ],
    );
  }
}
