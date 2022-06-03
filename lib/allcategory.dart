import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipee/constant/color.dart';
import 'package:recipee/provider/food_provider.dart';
import 'food_by_category.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({ Key? key }) : super(key: key);

  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FoodProvider())],
      child: Consumer<FoodProvider>(
        builder: (context, foodprovider, _) {
          return Scaffold(
            backgroundColor: whiteNeutral,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Category',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: darkColor,
                    fontSize: 20),
              ),
              backgroundColor: whiteNeutral,
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: darkenColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: GridView.builder(
                itemCount: foodprovider.listCategoryFood.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 0.1,
                    mainAxisSpacing: 0.1),
                itemBuilder: (BuildContext context, int index) {
                  var food = foodprovider.listCategoryFood[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodByCategoryPage(
                                    imageCat: food['strCategoryThumb'],
                                    nameCat: food['strCategory'],
                                  )));
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Image.network(
                            food['strCategoryThumb'],
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            food['strCategory'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200,
                              color: darkColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}