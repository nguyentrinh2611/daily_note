// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:bunnynote/core/error/failures.dart';
import 'package:bunnynote/core/usecases/usecase.dart';
import 'package:bunnynote/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../app/domain/entities/sc_user.dart';

class LoginWithUsernameAndPw implements UseCase<SCUser, SCUser> {
  final LoginRepository repository;
  LoginWithUsernameAndPw({
    required this.repository,
  });
  @override
  Future<Either<Failure, SCUser>?> call(SCUser params) async {
    return repository.loginWithUsernameAndPw(username: params.username, password: params.password);
  }
}
