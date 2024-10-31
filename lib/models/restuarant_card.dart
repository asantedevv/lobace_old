import 'dart:convert'; // For base64 decoding
import 'package:flutter/material.dart';
import 'package:food/screens/restaurant_screen.dart';

class RestaurantCard extends StatelessWidget {
  final String restaurantName;
  final int restaurantId;
  final String restaurantImage;
  final String restaurantCategory; // Store the restaurant image here

  RestaurantCard(
      {required this.restaurantName,
      required this.restaurantImage,
      required this.restaurantId,
      required this.restaurantCategory});

  // String get restaurantImage => null;

  @override
  Widget build(BuildContext context) {
    // Decode the base64 image
    final imageBytes = base64Decode(restaurantImage);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.memory(imageBytes),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantScreen(id: restaurantId),
                ),
              );
            },
            child: Text(
              restaurantName,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );

    // Card(
    //   elevation: 4,
    //   margin: EdgeInsets.all(10),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Image.memory(imageBytes), // Display the image
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text(
    //           restaurantName,
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
