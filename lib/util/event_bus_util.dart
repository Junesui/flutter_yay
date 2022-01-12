import 'package:event_bus/event_bus.dart';

class EventBusUtil {
  static late EventBus eventBus;

  // 单例 【EventBusUtil/EventBus】
  factory EventBusUtil() => _eventBusUtil;
  static final EventBusUtil _eventBusUtil = EventBusUtil._();
  EventBusUtil._() {
    eventBus = EventBus();
  }

  // 注册监听
  static listen<T extends MyEvent>(Function(T e) onData) {
    EventBusUtil();
    eventBus.on<T>().listen(onData);
  }

  // 发送事件
  static fire<T extends MyEvent>(T e) {
    EventBusUtil();
    eventBus.fire(e);
  }
}

/// 自定义事件的父类
abstract class MyEvent {}

/// 首页回到顶部
class HomeBackToTopEvent extends MyEvent {}
