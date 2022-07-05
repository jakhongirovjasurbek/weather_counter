import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/counter/presentation/bloc/counter_bloc.dart';

class CounterWidget extends StatelessWidget {
  final CounterBloc counterBloc;
  const CounterWidget({
    required this.counterBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: counterBloc,
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  'You have pushed the button this many times:',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
