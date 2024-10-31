import 'package:flutter/material.dart';
import 'package:food/screens/dashboard.dart';
import 'package:food/screens/forget_password.dart';
import 'package:food/screens/main_screen.dart';
import 'package:food/screens/sign_in_screen.dart';
import 'package:food/screens/sign_up_screen.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
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

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(bottom: 130), // ??
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signInScreen');
              },
              child: Icon(Icons.arrow_back_ios)),
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
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 35),
        child: Column(
          children: [
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
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  )),
              style: const TextStyle(fontSize: 14),
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
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  )),
              style: const TextStyle(fontSize: 14),
            ),
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
                  // Navigator.pushNamed(context, '/dashboard');

                  authenticate(emailTextEditingController.text,
                      passwordTextEditingController.text, context);
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgetPassword');
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                    color: Color(0xFF9139BA),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signUpScreen');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SignInScreen()));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Color(0xFFF9139BA), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> authenticate(
      String email, String password, BuildContext context) async {
    //create uri
    var uri = Uri.parse("http://localhost:8080/user/login"); // ??
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'email': email,
      'password': password,
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    // print("${response.body.data}");

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    if (parsedJson['data'] != null) {
      var data = parsedJson['data']; // Access the 'data' object
      var userId = data['id']; // Retrieve the 'id' field from 'data'
      var email = data['email'];
      var password = data['password'];

      // Print the ID for debugging
      print("User ID: $userId");

      // Store the user ID in SharedPreferences for access in other pages
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userId', userId);
      await prefs.setString('email', email);
      // await prefs.setString('password', password);

      // Navigate to the dashboard
    } else {
      print("No data found in response.");
    }

    if (parsedJson['responseCode'] == "000") {
      print(parsedJson['responseCode']);
      print("BODY CONTAINS DATA");
      print(parsedJson);
      // print("${response.body.data}");
      Navigator.pushNamed(context, '/dashboard');
    }

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


}
