import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipee/allcategory.dart';
import 'package:recipee/constant/color.dart';
import 'package:recipee/provider/food_provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({ Key? key }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FoodProvider())],
      child: Consumer<FoodProvider>(
        builder: (context, foodprovider, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AllCategory()));
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    foodprovider.loadingCategory
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 0.1,
                                    mainAxisSpacing: 0.1),
                            itemBuilder: (BuildContext context, int index) {
                              var food = foodprovider.listCategoryFood[index];
                              return Stack(
                                children: [
                                  Container(
                                    child: Image.network(
                                      food['strCategoryThumb'],
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      food['strCategory'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w200,
                                        color: darkNeutral,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                    SizedBox(
                      height: 10,
                    ),
                    foodprovider.loadingArea
                        ? Text('Loading..')
                        : Container(
                            height: 50,
                            width: double.infinity,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: foodprovider.listAreaFood.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var area = foodprovider.listAreaFood[index];
                                  return InkWell(
                                    onTap: () {
                                      foodprovider.kodeArea = area['strArea'];
                                      foodprovider.getFoodByArea(area['strArea']);
                                    },
                                    child: Card(
                                      shadowColor: darkColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30),
                                        child: Center(
                                          child: Text(
                                            area['strArea'],
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: darkenColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                   foodprovider.loadingfoodbyArea?
                   Text('loading'):
                   ListView.builder(
                        shrinkWrap: true,
                        itemCount: foodprovider.listFoodByArea.length,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var food = foodprovider.listFoodByArea[index];
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                height: 100,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        food['strMealThumb'],
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(food['strMeal']),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemArea() {
    return InkWell(
      onTap: () {},
      child: Card(
        shadowColor: darkColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Center(
            child: Text(
              'Area',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkenColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemMealCard() {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/image/food.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('strMeal'),
              )
            ],
          ),
        ),
      ),
    );
  }
}