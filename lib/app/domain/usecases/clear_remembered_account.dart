// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/app_repository.dart';

class ClearRememberedAccount extends UseCase<bool, NoParams> {
  final AppRepository repository;
  ClearRememberedAccount({
    required this.repository,
  });
  @override
  Future<Either<Failure, bool>?> call(NoParams params) {
    return repository.clearRememberedAccount(params);
  }
}
