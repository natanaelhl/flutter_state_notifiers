import 'package:aula_8_gerenciando_estados_gerais/builders/observable_builder.dart';
import 'package:aula_8_gerenciando_estados_gerais/controllers/change_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should test ObservableBuilder", () {
    testWidgets("Should test increment Widget", (widgetTests) async {
      await widgetTests.pumpWidget(const MaterialApp(home: _CounterWidget()));
      final findText = find.text("Counter: 0");
      final findButton = find.byKey(const Key(incrementButtonKey));

      expect(findText, findsOneWidget);

      expect(findButton, findsOneWidget);

      await widgetTests.tap(findButton);
      await widgetTests.pump();
      
      final nextCounterText = find.text("Counter: 1");

      expect(nextCounterText, findsOneWidget);
    });
  });
}

const incrementButtonKey = "incrementButtonKey";

class _CounterWidget extends StatefulWidget {
  const _CounterWidget();

  @override
  State<_CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<_CounterWidget> {
  final _counter = _ObservableCounter();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ObservableBuilder(
          observable: _counter,
          builder: (context, child) {
            return Text("Counter: ${_counter.counter}");
          }
        ),
        ElevatedButton(
          key: const Key(incrementButtonKey),
          onPressed: (){
            _counter.increment();
          }, child: const Text("Increment"),)
      ],
    );
  }
}

class _ObservableCounter extends ChangeState{
  int counter = 0;

  void increment(){
    counter++;
    notifyCallbacks();
  }
}

