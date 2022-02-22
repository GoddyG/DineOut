import 'package:flutter/material.dart';
import 'package:food_cam/colors.dart';
import 'package:food_cam/constant.dart';
import 'package:food_cam/foodDetail.dart';
import 'package:food_cam/style.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedCategoryCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/man.png"),
          ),
        ),
        actions: [
          IconButton(icon: Image.asset('assets/menu.png'), onPressed: null)
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Food',
                  size: 20,
                ),
                PrimaryText(
                  text: 'Delivery',
                  size: 42,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search,
                color: AppColors.secondary,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lighterGray)),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightGray,
                          fontSize: 15)),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: PrimaryText(
              text: 'Categories',
              fontWeight: FontWeight.w600,
              size: 22,
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodCategoryList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: foodCategoryCard(foodCategoryList[index]['imagePath'],
                    foodCategoryList[index]['name'], index),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10),
            child: PrimaryText(
              text: 'Popular',
              fontWeight: FontWeight.w600,
              size: 22,
            ),
          ),
          Column(
              children: List.generate(
                  popularFoodList.length,
                  (index) => popularFoodCard(
                      context,
                      popularFoodList[index]['imagePath'],
                      popularFoodList[index]['name'],
                      popularFoodList[index]['weight'],
                      popularFoodList[index]['star']))
              // [
              //
              // ],
              )
        ],
      ),
    );
  }

  Widget popularFoodCard(BuildContext context, String imagePath, String name,
      String weight, String star) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetail(imagePath: imagePath,)))
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [BoxShadow(color: AppColors.lighterGray, blurRadius: 10)],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primary,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        PrimaryText(
                          text: "top of the week",
                          size: 16,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    padding: EdgeInsets.only(left: 20.0, top: 10),
                    child: PrimaryText(
                      text: name,
                      fontWeight: FontWeight.w600,
                      size: 22,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20),
                    child: PrimaryText(
                      text:  weight,
                      fontWeight: FontWeight.w600,
                      size: 18,
                      color: AppColors.lightGray,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 45.0, vertical: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: AppColors.primary),
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          PrimaryText(
                            text: star,
                            fontWeight: FontWeight.w500,
                            size: 16,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(15, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  boxShadow: [
                    BoxShadow(color: AppColors.lighterGray, blurRadius: 100)
                  ]),
              child: Hero(
                tag: imagePath,
                child: Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width / 2.35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryCard = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedCategoryCard == index
                ? AppColors.primary
                : AppColors.white,
            boxShadow: [
              BoxShadow(color: AppColors.lighterGray, blurRadius: 10)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              width: 45,
            ),
            PrimaryText(
              text: name,
              size: 16,
              fontWeight: FontWeight.w700,
            ),
            RawMaterialButton(
              onPressed: null,
              fillColor: selectedCategoryCard == index
                  ? AppColors.white
                  : AppColors.tertiary,
              shape: CircleBorder(),
              child: Icon(
                Icons.chevron_right,
                color: selectedCategoryCard == index
                    ? AppColors.secondary
                    : AppColors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
