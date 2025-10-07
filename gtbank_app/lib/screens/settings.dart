import 'package:flutter/material.dart';
import 'package:gtbank_app/screens/profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Account Info',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProfilePage(),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            child: ListTile(
              // dense: true,
              leading: const Icon(Icons.remove_red_eye_outlined),
              title: const Text('View your profile'),
              subtitle: Text(
                "View account profile and update.",
                style: TextStyle(fontSize: 11.0),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProfilePage(),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            child: ListTile(
              // dense: true,
              leading: const Icon(Icons.lock_open_outlined),
              title: const Text('Change password'),
              subtitle: Text(
                "Change your login password & pin.",
                style: TextStyle(fontSize: 11.0),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            child: ListTile(
              // dense: true,
              leading: const Icon(Icons.share),
              title: const Text('Share account'),
              subtitle: Text(
                "Share social media to other platform.",
                style: TextStyle(fontSize: 11.0),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            child: ListTile(
              // dense: true,
              leading: const Icon(Icons.sync_alt_outlined),
              title: const Text('Recent transactions'),
              subtitle: Text(
                "View all account recent transactions",
                style: TextStyle(fontSize: 11.0),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: Text(
            'General',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          child: ListTile(
            // dense: true,
            leading: const Icon(Icons.personal_injury_outlined),
            title: const Text('Insurance'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          child: ListTile(
            // dense: true,
            leading: const Icon(Icons.event_available),
            title: const Text('Schedule Tasks'),
            subtitle: Text(
              "View all schedule upcoming events.",
              style: TextStyle(fontSize: 11.0),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          child: ListTile(
            // dense: true,
            leading: const Icon(Icons.support_agent_outlined),
            title: const Text('Customer Service'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}
