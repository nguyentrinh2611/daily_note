// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/sc_user.dart';
import '../repositories/app_repository.dart';

class RememberAccount extends UseCase<bool, SCUser> {
  final AppRepository repository;
  RememberAccount({
    required this.repository,
  });
  @override
  Future<Either<Failure, bool>?> call(SCUser params) {
    return repository.rememberAccount(
      username: params.username,
      password: params.password,
      uid: params.uid ?? "",
    );
  }
}
