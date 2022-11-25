import 'package:flutter/material.dart';
import 'package:flutter_hello_world/widgets/big_text.dart';
import '../utils/dimensions.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  int cookingMinutes;
  double price;   

  AppColumn({super.key, required this.text, required this.cookingMinutes, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.font26,
      ),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 15,
              ),
            ),
          ),
          const SizedBox(width: 10),
          SmallText(text: "4.5"),
          const SizedBox(width: 10),
          SmallText(text: "80"),
          const SizedBox(width: 10),
          SmallText(text: "comentarios"),
        ],
      ),
      SizedBox(
        height: Dimensions.height20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
            icon: Icons.attach_money,
            text: price.toString(),
            iconColor: Colors.green,
          ),
          IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: cookingMinutes,
            iconColor: Colors.lightBlue,
          ),
        ],
      )
    ]);
  }
}
