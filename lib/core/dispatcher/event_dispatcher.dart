import 'package:simubank/simubank.dart';

class EventDispatcher {
  static final _instance = EventDispatcher._internal();

  EventDispatcher._internal();

  factory EventDispatcher() => _instance;

  final _listeners = <StreamController<dynamic>>[];

  void registerListener(StreamController<dynamic> listener) {
    _listeners.add(listener);
  }

  void dispatchEvent(dynamic event) {
    for (final listener in _listeners) {
      listener.add(event);
    }
  }
}
