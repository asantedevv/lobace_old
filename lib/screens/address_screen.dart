import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Address Book",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 0),
          child: Column(
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "19 Bisola Durosinmi Etti Drive, \nLekki Phase 1 (LAGOS) \nLAGOS",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "20, Abayomi Adewale Street, \nAgo Palace way, Okota (LAGOS) \nLAGOS",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/location');
                },
                child: Row(
                  children: [
                    Image.asset("assets/images/location-add.png"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Add address",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF9139BA)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
