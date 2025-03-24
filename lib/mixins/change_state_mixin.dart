import 'package:aula_8_gerenciando_estados_gerais/controllers/change_state.dart';
import 'package:flutter/material.dart';

import '../controllers/state_observable.dart';

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {
  final List<ChangeState> _changeStates = [];

  void useChangeState(ChangeState changeState) {
    changeState.addListener(_callBack);
    _changeStates.add(changeState);
  }

  StateObservable<S> useStateObservable<S>(S state) {
    final stateObservable = StateObservable<S>(state);
    stateObservable.addListener(_callBack);
    _changeStates.add(stateObservable);
    return stateObservable;
  }

  void _callBack() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    for (ChangeState changedState in _changeStates) {
      changedState.removeListener(_callBack);
    }
    super.dispose();
  }
}
