part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final FormzStatus status;
  final int counterValue;
  const CounterState({
    required this.status,
    required this.counterValue,
  });

  CounterState copyWith({
    int? counterValue,
    FormzStatus? status,
  }) =>
      CounterState(
        counterValue: counterValue ?? this.counterValue,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [counterValue, status];
}
