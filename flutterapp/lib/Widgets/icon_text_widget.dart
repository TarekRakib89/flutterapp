import 'package:flutter/material.dart';
import 'package:flutterapp/Widgets/small_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(text: text,color: color,),
      ],
    );
  }
}
