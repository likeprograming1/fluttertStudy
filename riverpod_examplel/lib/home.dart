import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplel/provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyIncrementExample(),
    );
  }
}

class MyIncrementExample extends ConsumerStatefulWidget {
  const MyIncrementExample({super.key});

  @override
  ConsumerState<MyIncrementExample> createState() => _MyIncrementExampleState();
}

class _MyIncrementExampleState extends ConsumerState<MyIncrementExample> {
  @override
  Widget build(BuildContext context) {
    final int count = ref.watch(mainProvider.select((state) => state.count));
    final increment = ref.read(mainProvider.notifier).increment;
    final decrement = ref.read(mainProvider.notifier).decrement;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Center : $count"),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(onPressed: increment, child: Text("Count Up!!")),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: decrement, child: Text("Count Down!!")),
          ])
        ]),
      ),
    );
  }
}
