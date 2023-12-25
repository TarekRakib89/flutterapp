// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp/Widgets/small_text.dart';
import 'package:flutterapp/apps_color.dart';

class ExpendablTextWidget extends StatefulWidget {
  final String text;
  ExpendablTextWidget({
    Key? key,
    required this.text, 
  }) : super(key: key);

  @override
  State<ExpendablTextWidget> createState() => _ExpendablTextWidgetState();
}

class _ExpendablTextWidgetState extends State<ExpendablTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 300;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(height: 1.8,text: firstHalf)
          : Column(
              children: [
                SmallText(
                  text:
                      hiddenText ? firstHalf + "..." : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(text: "Show more", color: AppColors.mainColor),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
