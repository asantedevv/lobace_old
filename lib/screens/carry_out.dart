import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarryOut extends StatefulWidget {
  const CarryOut({super.key});

  @override
  State<CarryOut> createState() => _CarryOutState();
}

class _CarryOutState extends State<CarryOut> {
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/delivery');
                                },
                                child: Column(
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
                              ),
                              Column(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Choose Your Carryout Store on the Map Below:",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Carryout orders must be placed 15 mins before \nthe store's closing time",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 400,
                      width: 400,
                      child: const GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(5.624856327769731, -0.008477357394527658),
                          zoom: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
