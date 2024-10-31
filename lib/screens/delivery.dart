import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Select Your Local Store",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 3, bottom: 50), // ??
          child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 5.0,
                  color: Colors.grey,
                ),
              ], color: Colors.white, border: Border.all(color: Colors.white)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        const Row(
                          children: [
                            Text(
                              "IS THIS ORDER FOR DELIVERY OR CARRYOUT?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/deliver.png",
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Delivery",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF9139BA)),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/carryOut');
                                },
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/Group 29.png"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Carryout",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF9139BA)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Home Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        const TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(9),
                              hintText: "House Address",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              )),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        const Row(
                          children: [
                            Text(
                              "City",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        const TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(9),
                              hintText: "City",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              )),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        const SizedBox(height: 7),
                        const Row(
                          children: [
                            Text(
                              "Street Number/Unit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(9),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Delivery Instructions:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 60),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          )),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Example: ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          "Gate code, ring the door bell etc.",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
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
                            Text(
                              "CONTINUE",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
