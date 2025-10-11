import 'package:flutter/material.dart';
import 'package:gtbank_app/components/landing.dart';
import 'package:gtbank_app/components/login.dart';
import 'package:gtbank_app/screens/dashboard.dart';
import 'package:gtbank_app/screens/messages.dart';
import 'package:gtbank_app/screens/notifications.dart';
import 'package:gtbank_app/screens/profile.dart';
import 'package:gtbank_app/screens/settings.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // routes
      initialRoute: '/landing', // ✅ Start with login screen
      routes: {
        '/landing': (context) => const LandingPage(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainPage(),
      },

      // ********** Use this command for interactive theme mode (light or dark)
      // The Mandy red, light theme.
      theme:
          FlexThemeData.light(
            scheme: FlexScheme.sanJuanBlue,
            fontFamily: "Ubuntu",
            useMaterial3: true,
          ).copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade100,
              foregroundColor: Colors.black,
              centerTitle: true,
              toolbarHeight: 120.0,
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            //scaffoldBackgroundColor: Colors.white,
            //brightness: Brightness.dark,
            navigationBarTheme: NavigationBarThemeData(
              iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (states) => IconThemeData(
                  color: states.contains(WidgetState.selected)
                      ? Colors
                            .blue // selected icon color
                      : Colors.black87, // unselected icon color
                ),
              ),
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (states) => TextStyle(
                  color: states.contains(WidgetState.selected)
                      ? Colors
                            .blue // selected text color
                      : Colors.black87, // unselected text color
                  fontWeight: FontWeight.w600,
                ),
              ),
              indicatorColor: Colors.transparent,
              height: 100.0,
              elevation: 20.0,
              backgroundColor: Colors.grey.shade300, // customize as needed
            ),
          ),
      // The Mandy red, dark theme.
      darkTheme:
          FlexThemeData.dark(
            scheme: FlexScheme.outerSpace,
            fontFamily: "Ubuntu",
            useMaterial3: true,
          ).copyWith(
            appBarTheme: AppBarTheme(
              //backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              centerTitle: true,
              toolbarHeight: 120.0,
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            //scaffoldBackgroundColor: Colors.white70,
            //brightness: Brightness.dark,
            navigationBarTheme: NavigationBarThemeData(
              iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (states) => IconThemeData(
                  color: states.contains(WidgetState.selected)
                      ? Colors
                            .blue // selected icon color
                      : Colors.white70, // unselected icon color
                ),
              ),
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (states) => TextStyle(
                  color: states.contains(WidgetState.selected)
                      ? Colors
                            .blue // selected text color
                      : Colors.white70, // unselected text color
                  fontWeight: FontWeight.w600,
                ),
              ),
              indicatorColor: Colors.transparent,
              height: 100.0,
              elevation: 20.0,
              //backgroundColor: Colors.grey.shade100, // customize as needed
            ),
          ),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,

      // ********** Use this command for interactive theme mode (light or dark)
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
    HomePage(),
    const NotificationsPage(),
    const MessagesPage(),
    const SettingsPage(),
    const ProfilePage(),
  ];

  // titles for pages
  final List<String> _titles = [
    "Anime Zoo",
    "Notifications",
    "Messages",
    "Settings",
    "Profile",
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
              leading: const Icon(LucideIcons.house500, size: 20.0),
              title: const Text("Home", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 0);
              },
            ),
            ListTile(
              leading: const Icon(LucideIcons.bell500, size: 20.0),
              title: const Text(
                "Notifications",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 1);
              },
            ),
            ListTile(
              leading: const Icon(LucideIcons.messageCircle500, size: 20.0),
              title: const Text("Messages", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 2);
              },
            ),

            ListTile(
              leading: const Icon(LucideIcons.send500, size: 20.0),
              title: const Text("Transfer", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 3);
              },
            ),
            ListTile(
              leading: const Icon(LucideIcons.headset500, size: 20.0),
              title: const Text("Task", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 3);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text("Settings"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     setState(() => _currentIndex = 4);
            //   },
            // ),
            const Divider(),
            ListTile(
              leading: const Icon(
                LucideIcons.logOut500,
                color: Colors.red,
                size: 20.0,
              ),
              title: const Text("Logout", style: TextStyle(fontSize: 18)),
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
              icon: const Icon(LucideIcons.menu500),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),

        // actions
        actions: [
          IconButton(
            icon: Badge.count(
              count: 5,
              child: const Icon(LucideIcons.messageCircle500),
            ),
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
            icon: const Icon(Icons.person_outline, size: 33.0),
            onPressed: () => setState(() => _currentIndex = 4),
            // onPressed: () {
            //   Navigator.push<void>(
            //     context,
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => const ProfilePage(),
            //     ),
            //   );
            // },
            // onPressed: () => setState(() => _currentIndex = 4),
          ),
        ],
      ),

      // Body
      body: _pages[_currentIndex],

      // nav bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0), // optional margin from screen edge
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ), // round corners

          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) =>
                setState(() => _currentIndex = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(LucideIcons.house500, size: 26.0),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(LucideIcons.circleCheckBig500, size: 26.0),
                label: "Tasks",
              ),
              NavigationDestination(
                icon: Icon(LucideIcons.messageCircle500, size: 26.0),
                label: "Messages",
              ),
              NavigationDestination(
                icon: Icon(LucideIcons.settings500, size: 26.0),
                label: "Settings",
              ),
              NavigationDestination(
                icon: Icon(LucideIcons.user500, size: 26.0),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
