import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812), // Base design size (width x height)
//       minTextAdapt: true, // Ensures text scales properly
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter ScreenUtil Demo',
//           theme: ThemeData(primarySwatch: Colors.blue),
//           home: const HomeScreen(),
//         );
//       },
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ScreenUtil Example', style: TextStyle(fontSize: 20.sp)),
//       ),
//       body: Center(
//         child: Container(
//           width: 200.w, // Scaled width
//           height: 100.h, // Scaled height
//           color: Colors.blue,
//           child: Center(
//             child: Text(
//               'Responsive Box',
//               style: TextStyle(fontSize: 16.sp), // Scaled font size
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter layout demo',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey,
          middle: Text('Flutter layout demo'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Hello World')],
          ),
        ),
      ),
    );
  }
}
