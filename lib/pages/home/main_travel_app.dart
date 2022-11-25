import 'package:flutter/material.dart';
import 'package:flutter_hello_world/pages/home/travel_page_body.dart';
import 'package:flutter_hello_world/utils/dimensions.dart';
import 'package:flutter_hello_world/widgets/big_text.dart';
import 'package:flutter_hello_world/widgets/small_text.dart';

class MainTravelPage extends StatefulWidget {
  const MainTravelPage({super.key});

  @override
  State<MainTravelPage> createState() => _MainTravelPageState();
}

class _MainTravelPageState extends State<MainTravelPage> {
  @override
  Widget build(BuildContext context) {
    //print("current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          // muestra el header
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Colombia",
                          color: Color(0xff38B000),
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Bogota",
                              color: Colors.black54,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff38B000),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          //muestra el body
          Expanded(
              child: SingleChildScrollView(
            child: TravelPageBody(),
          )
          ),
        ],
      ),
    );
  }
}
