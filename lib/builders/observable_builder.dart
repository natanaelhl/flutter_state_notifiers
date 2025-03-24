import 'package:aula_8_gerenciando_estados_gerais/contracts/observable.dart';
import 'package:flutter/material.dart';

class ObservableBuilder extends StatefulWidget {
  final Observable observable;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) builder;
  const ObservableBuilder({
    super.key,
    required this.observable,
    required this.builder,
    this.child,
  });

  @override
  State<ObservableBuilder> createState() => _ObservableBuilderState();
}

class _ObservableBuilderState extends State<ObservableBuilder> {
  @override
  void initState() {
    widget.observable.addListener(rebuild);
    super.initState();
  }

  void rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.observable.removeListener(rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}
