import '../models/counter_model.dart';

class CounterController {
  final CounterModel _model;

  CounterController(this._model);

  int get count => _model.count;

  void incrementCounter() {
    _model.increment();
  }
} 