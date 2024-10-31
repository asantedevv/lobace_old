import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class FoodCard extends StatelessWidget {
  final int id;
  final String name;
  final String image; // Base64 encoded image`
  final String price;

  FoodCard(
      {required this.name,
      required this.image,
      required this.id,
      required this.price});

  // const FoodCard({super.key});

  Future<bool> getFoodById(int id, BuildContext context) async {
    var uri = Uri.parse("http://localhost:8080/food/find-by-id/$id");

    Map<String, String> headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: headers);

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    if (parsedJson['responseCode'] == "000") {
      print(parsedJson['responseCode']);
      print("BODY CONTAINS DATA");
      print(parsedJson);
      Navigator.pushNamed(context, '/foodScreen');
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final imageBytes = base64Decode(image);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.memory(
          imageBytes,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
            onPressed: () {
              getFoodById(id, context);
            },
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
