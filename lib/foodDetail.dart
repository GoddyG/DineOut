import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_cam/colors.dart';
import 'package:food_cam/constant.dart';
import 'package:food_cam/style.dart';

class FoodDetail extends StatelessWidget {
  final String imagePath;
  FoodDetail({this.imagePath});

  // const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 40, minHeight: 56),
        child: ElevatedButton(
          onPressed: ()=>{

          },
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(text: "Place an Order", fontWeight: FontWeight.w700, size: 16,),
              Icon(Icons.chevron_right, color: AppColors.secondary,)
            ],
          ) ,
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 25, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: "Burger",
                  size: 40,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 24,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/dollar.svg', color: AppColors.tertiary, width: 15,),
                    PrimaryText(
                      text: "5.99",
                      size: 45,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: " Size",
                            size: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightGray,

                          ),
                          
                          PrimaryText(
                            text: " Medium 14",
                            size: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 20,),
                          PrimaryText(
                            text: " Crust",
                            size: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightGray,

                          ),

                          PrimaryText(
                            text: " Thin Crust",
                            size: 22,
                            fontWeight: FontWeight.w600,
                          ),

                          SizedBox(height: 20,),
                          PrimaryText(
                            text: " Delivery In",
                            size: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightGray,

                          ),

                          PrimaryText(
                            text: " 30 min",
                            size: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          boxShadow: [BoxShadow(color: AppColors.lighterGray,
                          blurRadius: 50)]
                        ),
                        child: Hero(
                            tag: imagePath,
                            child: Image.asset(imagePath, fit:BoxFit.contain,)),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(left: 20, top: 50, ),
          child: PrimaryText(text: 'Ingredients', fontWeight: FontWeight.w700, 
          size: 22,),
          ),
          
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: ingredientCard(ingredients[index]['imagePath']),
              ),
              // children: [
              //   ingredientCard()
              // ],
            ),
          )
        ],
      ),
    );
  }

  Container ingredientCard( String imagePath) {
    return Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                margin: EdgeInsets.only(right: 8, top: 15, bottom: 15),
                decoration : BoxDecoration(
                  color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.lightGray)]
          ),
                child: Image.asset(imagePath, width: 90,),
              );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => {
              Navigator.pop(context),
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.chevron_left_rounded),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.star,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
