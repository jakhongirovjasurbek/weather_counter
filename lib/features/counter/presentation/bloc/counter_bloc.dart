import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:test_project/assets/constants/app_constants.dart';
import 'package:test_project/core/error/failures.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(
          const CounterState(
            status: FormzStatus.pure,
            counterValue: 0,
          ),
        ) {
    on<IncrementDecrementCounter>((event, emit) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final currentCounterValue = state.counterValue;
      final counterAddtion = event.isIncrementDecrementValueTwo ? 2 : 1;
      try {
        if ((event.isIncrementRequested &&
                currentCounterValue + counterAddtion > MAX_COUNTER_VALUE) ||
            (!event.isIncrementRequested &&
                currentCounterValue - counterAddtion < MIN_COUNTER_VALUE)) {
          throw ServerFailure(
            errorMessage:
                'Counter value cannot be less than $MIN_COUNTER_VALUE or more than $MAX_COUNTER_VALUE',
          );
        } else {
          if (event.isIncrementRequested) {
            print('Increment done');
            emit(state.copyWith(
              status: FormzStatus.submissionSuccess,
              counterValue: currentCounterValue + counterAddtion,
            ));
          } else {
            print('Decrement done');
            emit(state.copyWith(
              status: FormzStatus.submissionSuccess,
              counterValue: currentCounterValue - counterAddtion,
            ));
          }
        }
      } on ServerFailure catch (e) {
        print('Error occured');
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        event.onFailure(e.errorMessage);
      }
    });
  }
}
