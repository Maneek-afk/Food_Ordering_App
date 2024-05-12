import 'package:az/Widgets/bigText.dart';
import 'package:az/Widgets/icon_and_text.dart';
import 'package:az/Widgets/smallText.dart';
import 'package:az/utils/Colors.dart';
import 'package:az/utils/dimension.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor=0.8;
  double _height=Dimension.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      pageController.page;
       setState(() {
         _currentPageValue=pageController.page!;
       });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          //2;16;30
          height: Dimension.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder:(
            context,position){
              return _buildPageItem(position);
          } ),
        ),
        
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator:  DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Appcolor.MainColor,
          ),
        ),

         //popular writing

         Container(
            margin: EdgeInsets.only(left: Dimension.widtht20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: 'Popular'),
                SizedBox(width: Dimension.widtht10,),
                Container(
                  child: BigText(text: '.',color: Colors.black26,),
                ),
                SizedBox(width: Dimension.widtht10,),
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food Pairing"),
                )
              ],
            ),
          ),

           //image and text

           Container(
            height: 700,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(bottom: Dimension.hieght20,left: Dimension.widtht10,right: Dimension.widtht10),
                  child: Row(
                    children: [
                    //IMAGE SECTION
                      Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white38,
                        image: const DecorationImage(
                          image: AssetImage("assets/Images/food2.jpg"))
                        ),
                      ),
                      //TEXT SECTION
                      Expanded(
                        child: Container(
                          height: 95,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                            color: Color.fromARGB(179, 221, 219, 219)
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }),
          )
      ],
    );  
  }

  Widget _buildPageItem(int index){

    Matrix4 matrix = new Matrix4.identity();

    if(index==_currentPageValue.floor()){
      var currscale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var curTrans=_height*(1-currscale)/2;
      matrix= Matrix4.diagonal3Values(1,currscale, 1)..setTranslationRaw(0, curTrans, 0);
    }
    else if(index==_currentPageValue.floor()+1){
      var currscale =_scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var curTrans=_height*(1-currscale)/2;
      matrix= Matrix4.diagonal3Values(1,currscale, 1);
      matrix= Matrix4.diagonal3Values(1,currscale, 1)..setTranslationRaw(0, curTrans, 0);
    }
     else if(index==_currentPageValue.floor()-1){
      var currscale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var curTrans=_height*(1-currscale)/2;
      matrix= Matrix4.diagonal3Values(1,currscale, 1);
      matrix= Matrix4.diagonal3Values(1,currscale, 1)..setTranslationRaw(0, curTrans, 0);
    }
    else{
      var currscale=0.8;
      matrix= Matrix4.diagonal3Values(1,currscale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return  Transform(
      transform: matrix,
      child: Stack(
        children: [
      Container(
        height: Dimension.pageViewContainer,
        margin: EdgeInsets.only(left: 10,right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven?Colors.blue:Colors.yellow,
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/Images/food0.jpg")
          )
        ),
      ),
      
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: const EdgeInsets.only(right: 40, left: 40,bottom: 10),
          decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0,5),
            ),
            const BoxShadow(
              color: Colors.white,    
              offset: Offset(-5, 0)
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0)
            )
            ],
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20,left: 15 , right: 15,bottom: 10),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Burger"),
                SizedBox(height: Dimension.hieght10,),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) => Icon(Icons.star, color: Appcolor.MainColor,size: 15,)),
                    ),
      
                    SizedBox(width: 10,),
                    SmallText(text: "4.5"),
      
                    SizedBox(width: 10,),
                    SmallText(text: "1287"),
      
                    SizedBox(width: 10,),
                    SmallText(text: "Comments"),
      
                  ],
                ),
                SizedBox(height: Dimension.hieght10,),
                  Row(
                      children: [
                        IconandText(
                          icon: Icons.circle_sharp, 
                          text: "Normal", 
                          iconColor: Appcolor.iconColor1
                        ),

                        SizedBox(width: 10,),

                        IconandText(
                          icon: Icons.location_on, 
                          text: "1.7Km", 
                          iconColor: Appcolor.MainColor
                        ),

                        SizedBox(width: 10,),

                        IconandText(
                          icon: Icons.access_time_rounded, 
                          text: "32min", 
                          iconColor: Appcolor.iconColor1
                        ),
                      ],
                    )
              ],
            ),
          ),
        ),
      )
        ],
      ),
    );

  }
}