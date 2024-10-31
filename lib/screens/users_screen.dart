import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/models/card.dart';
import 'package:food/models/user.dart';
import 'package:http/http.dart' as http;

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> user1 = [];

  @override
  void initState() {
    super.initState();
    // Call your function here
    retrieveAllUsers(context);
  }

  Future<bool> retrieveAllUsers(BuildContext context) async {
    var uri = Uri.parse("http://localhost:8080/user/find-all-users"); // ??

    Map<String, String> header = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: header);

    List jsonResponse = json.decode(response.body);

    var usersList = jsonResponse.map((user) => User.fromJson(user)).toList();

    // Update state to trigger a rebuild
    setState(() {
      user1 = usersList;
    });

    for (var user in user1) {
      print(user.firstName);
    }

    print("FOUND ALL USERS");
    print(usersList.length);
    print(usersList[0].firstName);

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
                    'Profile',
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
                    child: Text(
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
                  itemCount: user1.length,
                  itemBuilder: (context, index) {
                    return MyCard(
                      text: user1[index].firstName,
                      image: user1[index].image,
                    );
                  },
                ),
              )

              // Stack(
              //   alignment: AlignmentDirectional.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/Burger.png",
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.black.withOpacity(0.5),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Text(
              //         "Burger",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/like-shapes.png"),
              //     const Text("97%")
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Stack(
              //   alignment: AlignmentDirectional.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/Pizza.png",
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.black.withOpacity(0.5),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Text(
              //         "Pizza",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/like-shapes.png"),
              //     const Text("98%")
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Stack(
              //   alignment: AlignmentDirectional.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/BBQ.png",
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.black.withOpacity(0.5),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Text(
              //         "Barbeque",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/like-shapes.png"),
              //     const Text("92%")
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Stack(
              //   alignment: AlignmentDirectional.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/Vegan.png",
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.black.withOpacity(0.5),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Text(
              //         "Vegan",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/like-shapes.png"),
              //     const Text("75%")
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Stack(
              //   alignment: AlignmentDirectional.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/Amala.png",
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.black.withOpacity(0.5),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Text(
              //         "Amala",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/like-shapes.png"),
              //     const Text("94%")
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Stack(
              //   alignment: AlignmentDirectional.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/Rice.png",
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.black.withOpacity(0.5),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Text(
              //         "Rice",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/like-shapes.png"),
              //     const Text("98%")
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
