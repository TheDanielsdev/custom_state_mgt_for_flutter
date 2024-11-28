import 'package:custom_state_mgt/state_mgt_tool.dart';

final provider = PuppyProv();

class PuppyProv extends EzProvider {
  var count = 100.0;

  void increment() {
    count += 25;
    if (count > 400) {
      count = 100;
    }
    notify(runtimeType);
  }
}
