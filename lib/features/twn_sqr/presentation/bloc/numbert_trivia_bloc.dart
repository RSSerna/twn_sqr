// ignore_for_file: constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:twn_sqr/core/error/failures.dart';
import 'package:twn_sqr/core/usecases/usecase.dart';
import 'package:twn_sqr/core/util/input_converter.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/number_trivia.dart';
import 'package:twn_sqr/features/twn_sqr/domain/usecases/get_concrete_number_trivia.dart';
import 'package:twn_sqr/features/twn_sqr/domain/usecases/get_random_number_trivia.dart';

part 'numbert_trivia_event.dart';
part 'numbert_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {required this.getConcreteNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(const EmptyState([])) {
    on<GetTriviaForConcreteNumberEvent>((event, emit) async {
      final inputEither =
          await inputConverter.stringToUnsignedInteger(event.numberString);

      inputEither.fold((error) {
        emit(ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE));
      }, (integer) async {
        emit(const LoadingState([]));
        final failureOrTrivia =
            await getConcreteNumberTrivia(Params(number: integer));
        // .then((value) => _eitherLoadedOrErrorState(emit, value));

        _eitherLoadedOrErrorState(emit, failureOrTrivia);
      });
    });

    on<GetTriviaForRandomNumberEvent>((event, emit) async {
      emit(const LoadingState([]));
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());
      _eitherLoadedOrErrorState(emit, failureOrTrivia);
    });
  }

  void _eitherLoadedOrErrorState(Emitter<NumberTriviaState> emit,
      Either<Failure, NumberTrivia> failureOrTrivia) {
    emit(failureOrTrivia.fold((error) {
      return ErrorState(error: _mapFailureToMessage(error));
    }, (trivia) {
      return LoadedState(trivia: trivia);
    }));
  }

  String _mapFailureToMessage(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure _:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
