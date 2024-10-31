import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Location",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 0),
          child: Column(
            children: [
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ADDRESS",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                children: [
                  Text(
                    "Street Number",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Street Number",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                children: [
                  Text(
                    "Street",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Street",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                children: [
                  Text(
                    "City",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
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
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                children: [
                  Text(
                    "State",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "State",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                children: [
                  Text(
                    "Country",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Country ",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                children: [
                  Text(
                    "Postal Code",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Postal Code",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 160),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
