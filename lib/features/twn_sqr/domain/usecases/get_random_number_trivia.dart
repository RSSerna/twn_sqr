import 'package:dartz/dartz.dart';
import 'package:twn_sqr/core/error/failures.dart';
import 'package:twn_sqr/features/twn_sqr/domain/repositories/number_trivia_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) {
    return numberTriviaRepository.getRandomNumberTrivia();
  }
}
