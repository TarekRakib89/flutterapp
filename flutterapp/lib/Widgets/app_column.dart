// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.blueAccent,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconText(
                icon: Icons.circle_sharp,
                text: "Normal",
                color: Colors.black,
                iconColor: Colors.yellowAccent),
            IconText(
                icon: Icons.location_on,
                text: "Normal",
                color: Colors.black,
                iconColor: Colors.yellowAccent),
            IconText(
                icon: Icons.access_time,
                text: "Normal",
                color: Colors.black,
                iconColor: Colors.yellowAccent),
          ],
        ),
      ],
    );
  }
}
