import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF9139BA),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFE5D2ED)),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "MY LOBACE ACCOUNT",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/profile-circle.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/shopping-cart2.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Orders',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/likeShapes.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Ratings & Reviews',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/rating');
            },
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/archive-book.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Address Book',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/address');
            },
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/card-tick.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Payment method',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/payment');
            },
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/setting-2.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Setting',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {},
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFE5D2ED)),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "MY SETTINGS",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/changePassword');
            },
          ),
          ListTile(
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            title: Row(
              children: [
                Image.asset("assets/images/logout.png"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/logout');
            },
          ),
        ],
      ),
    );
  }
}

// AIzaSyAVNbF-xdROd-Q68EtduhZPowINBDrSRpg