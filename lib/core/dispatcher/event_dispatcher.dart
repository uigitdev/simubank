import 'package:simubank/simubank.dart';

class EventDispatcher {
  static final _instance = EventDispatcher._internal();

  EventDispatcher._internal();

  factory EventDispatcher() => _instance;

  final _eventController = StreamController<dynamic>.broadcast();

  void dispatchEvent(dynamic event) {
    if (!_eventController.isClosed) {
      _eventController.add(event);
    }
  }

  Stream<dynamic> get stream => _eventController.stream;
}
