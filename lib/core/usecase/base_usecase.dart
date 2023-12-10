import 'package:either_dart/either.dart';
import 'package:wather_app/core/error/failure.dart';

abstract class BaseUseCase<T>{

  Future<Either<Failure,T>>call();

}

abstract class BaseUseCaseWithParameter<T,A>{

  Future<Either<Failure,T>>call(A id);

}