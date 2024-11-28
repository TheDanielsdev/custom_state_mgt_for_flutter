import 'package:custom_state_mgt/provider.dart';
import 'package:custom_state_mgt/state_mgt_tool.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(seconds: 2),
            curve: Curves.linear,
            child: EzConsumer<PuppyProv>(
                provider: provider,
                builder: () => Image(
                      image: const AssetImage('assets/images/Winking Face.png'),
                      width: provider.count,
                    )),
          ),
          ElevatedButton(
              onPressed: () {
                provider.increment();
              },
              child: const Text('Feed'))
        ],
      ),
    );
  }
}
