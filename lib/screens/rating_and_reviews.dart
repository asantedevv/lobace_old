import 'package:flutter/material.dart';

class RatingAndReviews extends StatefulWidget {
  const RatingAndReviews({super.key});

  @override
  State<RatingAndReviews> createState() => _RatingAndReviewsState();
}

class _RatingAndReviewsState extends State<RatingAndReviews> {
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
                    "Rating & Review",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Your name",
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
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Your Email",
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
                    "Rate this services",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    hintText: "Review Summary (150 Characters max)",
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
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 50),
                    hintText: "",
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
              // Container(
              //   decoration: BoxDecoration(color: const Color(0xFF9139BA), border: Border.all()),
              //   child: Text(
              //     "SUBMIT",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "SUBMIT",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
