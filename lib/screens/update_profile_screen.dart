import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
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

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
                    "Update Profile",
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "First Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: firstNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "First Name",
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
                      "Last Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: lastNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Last name",
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
                      "Age",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: ageTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Age",
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
                      "Phone number",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: phoneNumberTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Phone number",
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
                  updateUser(
                      firstNameTextEditingController.text,
                      lastNameTextEditingController.text,
                      ageTextEditingController.text,
                      emailTextEditingController.text,
                      phoneNumberTextEditingController.text,
                      passwordTextEditingController.text,
                      context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONFIRM CHANGES",
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

  Future<bool> updateUser(
      String firstName,
      String lastName,
      String age,
      String email,
      String phoneNumber,
      String password,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    // Create the URI
    var uri = Uri.parse("http://localhost:8080/user/update-by-id/$userId");

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map data = {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };

    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    // Check the response
    // if (parsedJson['responseCode'] == "000") {
    //   print(parsedJson['responseCode']);
    //   print("BODY CONTAINS DATA");
    //   print(parsedJson);
    //   Navigator.pushNamed(context, '/loginScreen');
    //   return true;
    // } else {
    //   print('Failed with response code: ${response.statusCode}');
    //   return false;
    // }

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/loginScreen');
    }

    return true;
  }



}
