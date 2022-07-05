part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementDecrementCounter extends CounterEvent {
  final bool isIncrementRequested;
  final bool isIncrementDecrementValueTwo;
  final ValueChanged<String> onFailure;
  const IncrementDecrementCounter({
    required this.isIncrementRequested,
    required this.isIncrementDecrementValueTwo,
    required this.onFailure,
  });

  @override
  List<Object> get props => [
        isIncrementRequested,
        isIncrementDecrementValueTwo,
      ];
}
