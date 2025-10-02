import 'package:flutter/material.dart';
import 'package:gtbank_app/components/login.dart';
import 'package:gtbank_app/screens/dashboard.dart';
import 'package:gtbank_app/screens/messages.dart';
import 'package:gtbank_app/screens/notifications.dart';
import 'package:gtbank_app/screens/profile.dart';
import 'package:gtbank_app/screens/settings.dart';

// import 'components/drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // ✅ Start with login screen
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainPage(),
      },
      theme: ThemeData(
        fontFamily: "Ubuntu",
        useMaterial3: true,
        brightness: Brightness.light,
        primarySwatch: Colors.grey,

        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 140.0,
          elevation: 0.0,
        ),
      ),
      home: MainPage(),
    );
  }
}

// MainPage
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Pages for bottom navigation
  final List<Widget> _pages = [
    const HomePage(),
    const NotificationsPage(),
    const MessagesPage(),
    const SettingsPage(),
  ];

  // titles for pages
  final List<String> _titles = [
    "Naruto Uzumaki",
    "Notifications",
    "Messages",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer
      // drawer: DrawerBuilder(context: context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   curve: Curves.fastOutSlowIn,
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Text("Testing header"),
            // ),
            const UserAccountsDrawerHeader(
              accountName: Text("Naruto Uzumaki"),
              accountEmail: Text("naruto@konoha.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notifications"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text("Messages"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 2);
              },
            ),

            ListTile(
              leading: const Icon(Icons.send),
              title: const Text("Transfer"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text("Task"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 3);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),

      // AppBar
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        // leading
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),

        // actions
        actions: [
          IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              // onPressed: (){
              //   Navigator.push<void>(
              //     context,
              //     MaterialPageRoute<void>(
              //       builder: (BuildContext context) => const ProfilePage(),
              //     ),
              //   );
              // }
            onPressed: () => setState(() => _currentIndex = 2),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: (){
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ProfilePage(),
                ),
              );
            }
            // onPressed: () => setState(() => _currentIndex = 4),
          ),
        ],
      ),

      // Body
      body: _pages[_currentIndex],

      // Bottom NavigationBar
      bottomNavigationBar: NavigationBar(
        height: 90.0,
        elevation: 10.0,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.task_alt_outlined),
            label: "Tasks",
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            label: "Messages",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_sharp),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
