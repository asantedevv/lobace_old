import 'package:flutter/material.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Link new Card",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("ADD NEW PAYMENT METHOD",
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.grey,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pay with Mastercard and Visa",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                          Row(
                            children: [
                              Image.asset("assets/images/MasterCard.png"),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset("assets/images/Text.png"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: "Card Name",
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: "Card Number",
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Expire Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "MM",
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 80,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "YY",
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          Image.asset("assets/images/Circle_Question.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "CVV",
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          Image.asset("assets/images/Circle_Question.png")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Color(0xFFF4F3F3)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image.asset("assets/images/Circle_Warning.png"),
                  Text(
                    "To activate your 1-Click Payment, we need to verify \nyour payment method by issuing temporary \nauthorization hold of NGN 100 on it. It will not be \ncollected. You can manage your 1-Click Payment \nin the account settings during checkout. Your payment \ninformation is safe with us and will not be shared \nwith the merchant - LOBACE FOOD DELIVERY.",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 13,
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
                  padding: EdgeInsets.symmetric(horizontal: 115),
                  child: Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "By tapping “AGREE AND CONTINUE” I accept the Lobace",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const Text(
              "Payment Terms & Conditions, General Terms and Conditions,",
              style: TextStyle(fontSize: 14, color: Color(0xFF9139BA)),
            ),
            const Text(
              "and Privacy and Cookies Notice",
              style: TextStyle(fontSize: 14, color: Color(0xFF9139BA)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "Please Note: We will never ask you for your password, PIN,"),
            const Text("CVV or full card details over the phone or via email."),
            const Text("Need help? Contact us on +234 816 6280 796")
          ],
        ),
      ),
    );
  }
}
