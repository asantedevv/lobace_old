import 'package:flutter/material.dart';
import 'package:food/models/restuarant.dart';
import 'package:food/models/restuarant_card.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Restaurant> restaurants = []; // Variable to hold the list of restaurants

  @override
  void initState() {
    super.initState();
    // Call your function here
    retrieveAllRestaurants(context);
  }

  Future<bool> deleteUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    // Create the URI
    var uri = Uri.parse("http://localhost:8080/user/delete-user/$userId");

    Map<String, String> headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: headers);

    // Map<String, dynamic> parsedJson = jsonDecode(response.body);

    // if (response.statusCode == 200) {
    //   Navigator.pushNamed(context, '/loginScreen');
    // }

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/signUpScreen');
    }

    return true;
  }

  Future<bool> retrieveAllRestaurants(BuildContext context) async {
    var uri =
        Uri.parse("http://localhost:8080/restaurant/find-all-restaurants");

    Map<String, String> header = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: header);

    List jsonResponse = json.decode(response.body);

    var restaurantList = jsonResponse
        .map((restaurant) => Restaurant.fromJson(restaurant))
        .toList();

    // Update state to trigger a rebuild
    setState(() {
      restaurants = restaurantList;
    });

    for (var restaurant in restaurants) {
      print(restaurant.name);
    }

    print("FOUND ALL RESTAURANTS");
    print(restaurantList.length);
    print(restaurantList[0].name);

    return true;
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
                  "Delivery",
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF9139BA),
              ),
              child: Text(
                "X",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/profile-circle.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Update Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/updateProfileScreen');
              },
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/profile-circle.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Delete Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                // deleteUser(context);
                Navigator.pushNamed(context, '/deleteProfileScreen');
              },
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/shopping-cart2.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Order Online',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/Group.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Menu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/Group.png"), // Group 26.png
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Tracker',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/tracker');
              },
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/Group.png"), // Group 26.png
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Orders',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/oderSummary');
              },
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/call-calling.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Contact',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2)),
              title: Row(
                children: [
                  Image.asset("assets/images/users-more.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'About Us',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/tracker');
                    },
                    child: const Text(
                      "TRACKER",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9139BA)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
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
              const TextField(
                decoration: InputDecoration(
                    hintText: "What do you need?",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "RESTAURANTS",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Image.asset("assets/images/Group 6.png")
                ],
              ),

              // Replace this part in your build method
              Container(
                height:
                    400, // Set a fixed height or use MediaQuery to make it responsive
                child: ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantCard(
                      restaurantId: restaurants[index].id,
                      restaurantName: restaurants[index].name,
                      restaurantImage: restaurants[index].image,
                      restaurantCategory: restaurants[index].category,
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







// import 'package:flutter/material.dart';
// import 'package:food/models/restuarant.dart';
// import 'package:food/models/restuarant_card.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   List<Restaurant> restaurants = []; // Variable to hold the list of restaurants

//   @override
//   void initState() {
//     super.initState();
//     // Call your function here
//     retrieveAllRestaurants(context);
//   }

//   Future<bool> deleteUser(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? userId = prefs.getInt('userId');

//     // Create the URI
//     var uri = Uri.parse("http://localhost:8080/user/delete-user/$userId");

//     Map<String, String> headers = {"Content-Type": "application/json"};
//     var response = await http.post(uri, headers: headers);

//     if (response.statusCode == 200) {
//       Navigator.pushNamed(context, '/signUpScreen');
//     }

//     return true;
//   }

//   Future<bool> retrieveAllRestaurants(BuildContext context) async {
//     var uri =
//         Uri.parse("http://localhost:8080/restaurant/find-all-restaurants");

//     Map<String, String> header = {"Content-Type": "application/json"};
//     var response = await http.post(uri, headers: header);

//     List jsonResponse = json.decode(response.body);
//     var restaurantList = jsonResponse
//         .map((restaurant) => Restaurant.fromJson(restaurant))
//         .toList();

//     // Update state to trigger a rebuild
//     setState(() {
//       restaurants = restaurantList;
//     });

//     for (var restaurant in restaurants) {
//       print(restaurant.name);
//     }

//     print("FOUND ALL RESTAURANTS");
//     print(restaurantList.length);
//     print(restaurantList[0].name);

//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100.0),
//         child: AppBar(
//           centerTitle: true,
//           backgroundColor: const Color(0xFF9139BA),
//           title: const Column(
//             children: [
//               Text(
//                 "Lobace Food",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Delivery",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Image.asset("assets/images/shopping-cart.png"),
//             ),
//           ],
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xFF9139BA),
//               ),
//               child: Text(
//                 "X",
//                 style: TextStyle(color: Colors.white, fontSize: 30),
//               ),
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/profile-circle.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Update Profile',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, '/updateProfileScreen');
//               },
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/profile-circle.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Delete Profile',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, '/deleteProfileScreen');
//               },
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/shopping-cart2.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Order Online',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/Group.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Menu',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/Group.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Tracker',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, '/tracker');
//               },
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/Group.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Orders',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, '/orders');
//               },
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/Group.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'New Orders',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, '/oderSummary');
//               },
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/call-calling.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'Contact',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               shape: const Border(
//                   bottom: BorderSide(color: Colors.grey, width: 0.2)),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/users-more.png"),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'About Us',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/tracker');
//                     },
//                     child: const Text(
//                       "TRACKER",
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF9139BA),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 13),
//               Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF9139BA),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 5),
//                     child: Column(
//                       children: [
//                         const Text(
//                           "START YOUR ORDER",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 5),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pushNamed(context, '/delivery');
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFE5D2ED),
//                                     borderRadius: BorderRadius.circular(4.0),
//                                   ),
//                                   child: const Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 6, horizontal: 20),
//                                     child: Text(
//                                       "DELIVERY",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 20),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pushNamed(context, '/carryOut');
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFE5D2ED),
//                                     borderRadius: BorderRadius.circular(4.0),
//                                   ),
//                                   child: const Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 6, horizontal: 20),
//                                     child: Text(
//                                       "CARRY OUT",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const TextField(
//                 decoration: InputDecoration(
//                   hintText: "What do you need?",
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w300,
//                     fontSize: 17,
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.purple),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "RESTAURANTS",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   Image.asset("assets/images/Group 6.png"),
//                 ],
//               ),
//               Container(
//                 height: 400,
//                 child: ListView.builder(
//                   itemCount: restaurants.length,
//                   itemBuilder: (context, index) {
//                     return RestaurantCard(
//                       restaurantId: restaurants[index].id,
//                       restaurantName: restaurants[index].name,
//                       restaurantImage: restaurants[index].image,
//                       restaurantCategory: restaurants[index].category,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }