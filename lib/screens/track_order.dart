import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5D2ED),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/Bike.png"),
            const SizedBox(
              height: 40,
            ),
            const Text("TRACK YOU ORDER",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(
              "Enter your tracking number below",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Tracking number",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFF9139BA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Text(
                      "TRACK YOUR ORDER ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
