import 'package:flutter/material.dart';

class _EzLocator {
  static final _EzLocator _instance = _EzLocator._();
  _EzLocator._();
  factory _EzLocator() => _instance;

  Map<Type, List<EzConsumer>> map = {};

  List<EzConsumer>? find(Type type) {
    return map[type];
  }

  void put(Type type, EzConsumer widget) {
    List<EzConsumer>? list = map[type];
    if (list == null) {
      list = [];
      map[type] = list;
    }
    list.add(widget);
  }
}

class EzConsumer<T extends EzProvider> extends StatefulWidget {
  final T provider;
  final Widget Function() builder;

  EzConsumer({
    super.key,
    required this.provider,
    required this.builder,
  }) {
    _EzLocator().put(provider.runtimeType, this);
  }
  late EzConsumerState _state;

  @override
  EzConsumerState createState() {
    _state = EzConsumerState();
    return _state;
  }
}

class EzConsumerState extends State<EzConsumer> {
  bool state = false;

  void changeState() {
    setState(() {
      state = !state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.builder();
  }
}

abstract class EzProvider {
  void notify(Type type) {
    List<EzConsumer>? widgets = _EzLocator().find(type);
    if (widgets != null) {
      for (EzConsumer w in widgets) {
        w._state.changeState();
      }
    }
  }
}
