import 'dart:ffi';

import 'package:az/Home/FoodPageBody.dart';
import 'package:az/Widgets/bigText.dart';
import 'package:az/Widgets/smallText.dart';
import 'package:az/utils/Colors.dart';
import 'package:az/utils/dimension.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
      void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("current height: ${MediaQuery.of(context).size.height}");
    });
  }
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'Germany',color: Appcolor.MainColor,),
                      Row(
                        children: [
                          SmallText(text: 'Pokhara',color: Colors.black54,),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),                     
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Appcolor.MainColor
                      ),
                      child:   Icon(Icons.search, color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
          ),
        
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            )
          ),
          

         
       
        ],
      ),
    );
  }
}
