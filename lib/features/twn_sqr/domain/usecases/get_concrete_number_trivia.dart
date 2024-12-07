import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:twn_sqr/core/error/failures.dart';
import 'package:twn_sqr/core/usecases/usecase.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) {
    return repository.getConcreteNumberTrivia(params.number);
  }

  // Future<Either<Failure, NumberTrivia>> execute({required int number}) async {
  //    return await repository.getConcreteNumberTrivia(number);
  // }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
