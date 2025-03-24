import 'package:aula_8_gerenciando_estados_gerais/contracts/observable_state.dart';
import 'package:aula_8_gerenciando_estados_gerais/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState {
  T _state;

  @override
  T get state => _state;

  set state(T newState) {
    if (newState == _state) return;
    _state = newState;
    notifyCallbacks();
  }

  StateObservable(this._state);
}
