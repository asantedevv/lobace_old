import 'dart:convert';

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String text;
  final String image;

  // const Card({super.key});
  MyCard({
    required this.text,
    required this.image,
  });

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
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
