
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tonjoo/core/params/failure_param.dart';

abstract class UseCase<Type, Equatable> {
  Future<Either<Failure, Type>> call(Equatable params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}