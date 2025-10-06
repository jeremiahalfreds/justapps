import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() async {
  final store = Store(generateRandomValues, initialState: 'Initial Value');
  runApp(MyApp(store: store));
}
// enum type
enum RandomTypes { numbers, alphabets }

//
generateRandomValues(dynamic value, dynamic action) {
  if (action == RandomTypes.numbers) {
    return value = Random().nextInt(100);
  }
  if (action == RandomTypes.alphabets) {
    return value = String.fromCharCode(Random().nextInt(26) + 65);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.store});

  final Store<dynamic> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<dynamic>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Redux App'),
            centerTitle: true,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StoreConnector<dynamic, String>(
                converter: (store) => store.state.toString(),
                builder: (context, value) {
                  return Text(
                    value,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      store.dispatch(RandomTypes.numbers);
                    },
                    child: const Text('Random Number'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      store.dispatch(RandomTypes.alphabets);
                    },
                    child: const Text('Random Alphabet'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}