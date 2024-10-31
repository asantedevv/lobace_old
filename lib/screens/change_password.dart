import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 60);
    path.quadraticBezierTo(width / 2, height, width, height - 60);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 130), // ??
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/account');
              },
              child: Icon(Icons.arrow_back_ios)),
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.white,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFE5D2ED),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lobace Food",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Delivery",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9139BA)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 3, bottom: 100), // ??
          child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                      blurRadius: 5.0,
                      color: Colors.grey,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.white)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                        child: Text(
                      "Change Password",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Current Password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Enter your current password",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                              ),
                              // labelText: "Email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              )),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            Text(
                              "New Password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "min. 8 characters",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                              ),
                              // labelText: "Email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              )),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            Text(
                              "Confrim Password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                              ),
                              // labelText: "Email",
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
                              "SAVE",
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
