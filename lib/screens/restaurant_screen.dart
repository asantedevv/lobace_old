import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food/models/food.dart';
import 'package:food/models/food_card.dart';
import 'package:food/models/food_cart_provider.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

class RestaurantScreen extends StatefulWidget {
  final int id;

  RestaurantScreen({required this.id});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Food> foods = [];
  Map<int, int> foodCounts = {}; // Map to store count for each food item

  @override
  void initState() {
    super.initState();
    getFoodsRestaurantById(widget.id, context);
  }

  Future<bool> getFoodsRestaurantById(int id, BuildContext context) async {
    var uri =
        Uri.parse("http://localhost:8080/food/find-foods-by-restaurant-id/$id");

    Map<String, String> headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: headers);

    List jsonResponse = jsonDecode(response.body);

    var foodList = jsonResponse.map((food) => Food.fromJson(food)).toList();

    setState(() {
      foods = foodList;
      foodCounts = {for (var food in foods) food.id: 0}; // Initialize counts
    });

    return true;
  }

  void incrementFoodCount(int id) {
    setState(() {
      foodCounts[id] = (foodCounts[id] ?? 0) + 1;
    });
  }

  void decrementFoodCount(int id) {
    setState(() {
      if ((foodCounts[id] ?? 0) > 0) {
        foodCounts[id] = (foodCounts[id] ?? 0) - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFF9139BA),
            title: const Column(
              children: [
                Text(
                  "Lobace Food",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Restaurant Screen",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset("assets/images/shopping-cart.png"),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF9139BA),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        const Text(
                          "START YOUR ORDER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/delivery');
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE5D2ED),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 20),
                                      child: Text(
                                        "DELIVERY",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/carryOut');
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE5D2ED),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 20),
                                      child: Text(
                                        "CARRY OUT",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "FOODS",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Image.asset("assets/images/Group 6.png")
                ],
              ),
              // Food List with increment and decrement buttons
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return Column(
                      children: [
                        FoodCard(
                          id: food.id,
                          price: food.price,
                          name: food.name,
                          image: food.image,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {
                        //         context
                        //             .read<FoodCartProvider>()
                        //             .decrementFoodCount(food.id);
                        //       },
                        //       icon: Icon(Icons.remove),
                        //     ),
                        //     Text(
                        //       '${context.watch<FoodCartProvider>().foodCounts[food.id] ?? 0}',
                        //       style: TextStyle(
                        //           fontSize: 16, fontWeight: FontWeight.bold),
                        //     ),
                        //     IconButton(
                        //       onPressed: () {
                        //         context
                        //             .read<FoodCartProvider>()
                        //             .incrementFoodCount(food.id);
                        //       },
                        //       icon: Icon(Icons.add),
                        //     ),
                        //   ],
                        // ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
