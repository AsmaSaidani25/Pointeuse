import 'dart:html';
import 'dart:async';

class OnlineService {
  static late Stream<bool> _onlineStateStream;

  OnlineService() {
    _onlineStateStream = _listenToOnlineStatus();
  }

  Stream<bool> _listenToOnlineStatus() {
    final controller = StreamController<bool>();
    window.onOnline.listen((event) => controller.add(true));
    window.onOffline.listen((event) => controller.add(false));
    return controller.stream;
  }

  static Stream<bool> onlineState() {
    return _onlineStateStream;
  }
}
