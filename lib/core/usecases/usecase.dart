import 'package:equatable/equatable.dart';
import 'package:test_project/core/error/failures.dart';
import 'package:test_project/core/utils/either.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
