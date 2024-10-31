import 'package:flutter/material.dart';
import 'package:food/models/food.dart';
import 'package:food/models/food_card.dart';
import 'package:food/models/food_card_new.dart';
import 'package:food/models/food_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food/models/food.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  List<Food> foodsList = [];

  @override
  void initState() {
    super.initState();

    fetchFoodDetails(context);
  }

  Future<void> fetchFoodDetails(BuildContext context) async {
    final foodCounts = context.read<FoodCartProvider>().foodCounts;

    for (var entry in foodCounts.entries.where((entry) => entry.value > 0)) {
      final foodId = entry.key;
      findFoodById(foodId, context);
      // final foodData = await findFoodById(foodId, context);
      // setState(() {
      //   foodsList.add(foodData as Food);
      //   // foodDetails[foodId] = foodData;
      // });
    }
  }

  Future<bool> findFoodById(int id, BuildContext context) async {
    var uri = Uri.parse("http://localhost:8080/food/find-by-id/$id");

    Map<String, String> header = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: header);

    // Food parsedJson = jsonDecode(response.body);

    var parsedJson = jsonDecode(response.body);
    Food food = Food.fromJson(parsedJson);

    // List jsonResponse = json.decode(response.body);

    // var food = jsonResponse.map((food) => Food.fromJson(food));

    // Update state to trigger a rebuild
    setState(() {
      foodsList.add(food); // Initialize counts
    });

    for (var food in foodsList) {
      print(food.name);
    }

    print("FOUND ALL FOODS");
    // print(restaurantList.length);
    // print(restaurantList[0].name);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final foodCounts = context.watch<FoodCartProvider>().foodCounts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
        backgroundColor: const Color(0xFF9139BA),
      ),
      body: Column(
        children: [
          Container(
            height:
                400, // Set a fixed height or use MediaQuery to make it responsive
            child: ListView.builder(
              itemCount: foodsList.length,
              itemBuilder: (context, index) {
                return FoodCardNew(
                  name: foodsList[index].name,
                  image: foodsList[index].image,
                  id: 0,
                  price: "",
                  quantity: 1,
                );
              },
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: const Color(0xFF9139BA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                makeOrder(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 25,
          ),
        ],
      ),

      // ListView(
      //   padding: const EdgeInsets.all(10),
      //   children:
      //       foodCounts.entries.where((entry) => entry.value > 0).map((entry) {
      //     return ListTile(
      //       title: Text("Food ID: ${entry.key}"),
      //       subtitle: Text("Quantity: ${entry.value}"),
      //     );
      //   }).toList(),
      // ),
    );
  }
}

// class OrderSummaryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final foodCounts = context.watch<FoodCartProvider>().foodCounts;
//     List<Food> foodsList = [];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Order Summary"),
//         backgroundColor: const Color(0xFF9139BA),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(10),
//         children:
//             foodCounts.entries.where((entry) => entry.value > 0).map((entry) {
//           return ListTile(
//             title: Text("Food ID: ${entry.key}"),
//             subtitle: Text("Quantity: ${entry.value}"),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

Future<bool> makeOrder(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userId = prefs.getInt('userId');

  final foodCounts = context.read<FoodCartProvider>().foodCounts;

  //create uri
  var uri = Uri.parse("http://localhost:8080/order/create-order"); // ??
  //header
  Map<String, String> headers = {"Content-Type": "application/json"};
  //body

  for (var entry in foodCounts.entries) {
    // Create a JSON body for each food item
    final body = jsonEncode(
        {'foodId': entry.key, 'quantity': entry.value, 'userId': userId});

    //convert the above data into json
    var response = await http.post(uri, headers: headers, body: body);
  }

  //print the response body
  // print("${response.body.data}");

  // Map<String, dynamic> parsedJson = jsonDecode(response.body);

  // if (parsedJson['data'] != null) {
  //   var data = parsedJson['data']; // Access the 'data' object
  //   var userId = data['id']; // Retrieve the 'id' field from 'data'
  //   var email = data['email'];
  //   var password = data['password'];

  //   // Print the ID for debugging
  //   print("User ID: $userId");

  //   // Store the user ID in SharedPreferences for access in other pages
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('userId', userId);
  //   await prefs.setString('email', email);
  //   // await prefs.setString('password', password);

  //   // Navigate to the dashboard
  // } else {
  //   print("No data found in response.");
  // }

  // if (parsedJson['responseCode'] == "000") {
  //   print(parsedJson['responseCode']);
  //   print("BODY CONTAINS DATA");
  //   print(parsedJson);
  //   // print("${response.body.data}");
  //   Navigator.pushNamed(context, '/dashboard');
  // }

// Store the user ID

  // if (response.statusCode == 200) {
  //   Navigator.pushNamed(context, '/dashboard');

  //   // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
  // } else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }

  // if (response.body.contains('token')) {
  //   print("registered");
  //   displayToastMessage("You are logged in", context);
  //   userEmail = '$email';
  //   print("Your email is " + userEmail);
  //   Navigator.pushNamedAndRemoveUntil(
  //       context as BuildContext, MainScreen.idScreen, (route) => false);
  //   return true;
  // } else {
  //   print("null not registered");
  //   displayToastMessage("Account does not exist", context);
  //   Navigator.pop(context);
  //   return false;
  // }

  return true;
}
