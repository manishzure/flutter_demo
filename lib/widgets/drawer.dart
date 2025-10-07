import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://user-images.githubusercontent.com/5709133/50445980-88299a80-0912-11e9-962a-6fd92fd18027.png";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Manish",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text("manish@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            decoration: BoxDecoration(
              color: Colors.blue, 
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context); // close drawer
              // Add navigation logic if needed, e.g.:
              // Navigator.pushNamed(context, "/home");
            },
          ),

          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, "/profile");
            },
          ),

          ListTile(
            leading: const Icon(Icons.email, color: Colors.blue),
            title: const Text(
              "Email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, "/email");
            },
          ),
        ],
      ),
    );
  }
}
