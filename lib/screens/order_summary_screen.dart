// import 'package:flutter/material.dart';
// import 'package:food/models/food_cart_provider.dart';
// // import 'package:provider/provider.dart';

// class OrderSummaryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final foodCounts = context.watch<FoodCartProvider>().foodCounts;

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
