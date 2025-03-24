import 'package:aula_8_gerenciando_estados_gerais/controllers/change_state.dart';

class CounterState extends ChangeState{
  int counter = 0;

  void increment(){
    counter++;
    notifyCallbacks();
  }
}