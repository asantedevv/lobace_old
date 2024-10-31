import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteProfileScreen extends StatefulWidget {
  const DeleteProfileScreen({super.key});

  @override
  State<DeleteProfileScreen> createState() => _DeleteProfileScreenState();
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 60);
    path.quadraticBezierTo(width / 2, height, width, height - 60);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _DeleteProfileScreenState extends State<DeleteProfileScreen> {
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(bottom: 130),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/dashboard');
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.white,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFE5D2ED),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Lobace Food",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Delivery",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9139BA)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Delete profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: emailTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: passwordTextEditingController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              // Other fields (age, email, password, etc.) remain the same
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFF9139BA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Are you sure you want to delete this account?"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.pushNamed(context, routeName)
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                          authenticate(
                                              emailTextEditingController.text,
                                              passwordTextEditingController
                                                  .text,
                                              context);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE5D2ED),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6, horizontal: 20),
                                              child: Text(
                                                "YES",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE5D2ED),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 20),
                                            child: Text(
                                              "NO",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                  // authenticate1(
                  //     firstNameTextEditingController.text,
                  //     lastNameTextEditingController.text,
                  //     ageTextEditingController.text,
                  //     emailTextEditingController.text,
                  //     phoneNumberTextEditingController.text,
                  //     passwordTextEditingController.text,
                  //     context);

                  // Navigator.pushNamed(context, '/mainScreen');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DELETE",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Other widgets
            ],
          ),
        ),
      ),
    );
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

  Future<bool> authenticate(
      String email, String password, BuildContext context) async {
    //create uri
    var uri = Uri.parse("http://localhost:8080/user/login");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'email': email,
      'password': password,
    };
    //convert the above data into json
    var body = json.encode(data);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');

    if (email != savedEmail) {
      return false;
    }

    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    // print("${response.body.data}");

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    if (parsedJson['responseCode'] == "000") {
      deleteUser(context);
    }
    return true;
  }
}
