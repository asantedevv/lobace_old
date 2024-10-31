import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Payment methods",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "SAVED PAYMENT METHODS",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  Image.asset("assets/images/MasterCard.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "MasterCard x-7753",
                    style: TextStyle(fontSize: 15),
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
                  Navigator.pushNamed(context, '/addCard');
                },
                child: Row(
                  children: [
                    Image.asset("assets/images/card-add.png"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Add new card",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
