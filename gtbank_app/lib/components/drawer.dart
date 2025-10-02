import 'package:flutter/material.dart';
import 'package:gtbank_app/screens/dashboard.dart';
import 'package:gtbank_app/screens/messages.dart';
import 'package:gtbank_app/screens/notifications.dart';
import 'package:gtbank_app/screens/settings.dart';

class DrawerBuilder extends StatefulWidget {
  const DrawerBuilder({super.key, required this.context});

  final BuildContext context;

  @override
  State<DrawerBuilder> createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header
          UserAccountsDrawerHeader(
            accountName: const Text("Jeremiah F Alfred"),
            accountEmail: const Text("jeremiah.alfred@gtbank.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.black),
            ),
            decoration: const BoxDecoration(color: Colors.teal),
          ),

          // Drawer items
          ListTile(
            leading: const Icon(Icons.home_work),
            title: const Text("Home"),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text("Message"),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MessagesPage(),
                ),
              );
              // Navigate to home page logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text("Transfer"),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NotificationsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.today),
            title: const Text("Task"),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MessagesPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SettingsPage(),
                ),
              );
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}
