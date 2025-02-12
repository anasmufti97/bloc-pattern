import 'package:block_pattern_flutter_app/counter/counter_bloc.dart';
import 'package:block_pattern_flutter_app/switch/switch_bloc.dart';
import 'package:block_pattern_flutter_app/switch/switch_event.dart';
import 'package:block_pattern_flutter_app/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exmaple Two'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchBlock, SwitchState>(
                  buildWhen: (pre, next) => pre.switchValue != next.switchValue,
                  builder: (BuildContext context, state) {
                    return Switch(
                        value: state.switchValue,
                        onChanged: (newValue) {
                          context.read<SwitchBlock>().add(SwitchValueChangeEvent());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBlock, SwitchState>(
              // buildWhen: (pre, next) => pre.switchValue != next.switchValue,
              builder: (BuildContext context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );

              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBlock, SwitchState>(
              // buildWhen: (pre, next)=>pre.switchValue != next.switchValue,
              builder: (BuildContext context, state) {
                return Slider(value: state.sliderValue, onChanged: (value) {
                  print(state.sliderValue);

                  context.read<SwitchBlock>().add(SliderValueEvent(slider: value));

                });
              },
            )
          ],
        ),
      ),
    );
  }
}
