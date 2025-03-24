import 'package:aula_8_gerenciando_estados_gerais/classes/counter_state.dart';
import 'package:aula_8_gerenciando_estados_gerais/controllers/state_observable.dart';
import 'package:aula_8_gerenciando_estados_gerais/mixins/change_state_mixin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ChangeStateMixin {
  // Controllers
  final observableCounter = StateObservable(0);
  late StateObservable<int> newMixinCounter;
  // Classes que extendem controllers
  final counterState = CounterState();

  @override
  void initState() {
    useChangeState(counterState);
    useChangeState(observableCounter);
    newMixinCounter = useStateObservable(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de estado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor do CounterState ${counterState.counter}"),
            ElevatedButton(
              onPressed: () {
                counterState.increment();
              },
              child: const Text('Incrementar'),
            ),
            Text("Valor do ObservableCounter ${observableCounter.state}"),
            ElevatedButton(
              onPressed: () {
                observableCounter.state++;
              },
              child: const Text('Incrementar'),
            ),
            Text("Valor do newMixinState ${newMixinCounter.state}"),
            ElevatedButton(
              onPressed: () {
                newMixinCounter.state++;
              },
              child: const Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}
