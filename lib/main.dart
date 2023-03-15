import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void tambahi() {
    emit(state + 1);
  }

  void kurangi() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit mycounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUBIT APP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: mycounter.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.kurangi();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  mycounter.tambahi();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
