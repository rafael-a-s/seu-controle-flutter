import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class TwoInputParams<Input1, Input2> extends Equatable {
  final Input1 input1;
  final Input2 input2;

  const TwoInputParams(this.input1, this.input2);

  @override
  List<Object> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
