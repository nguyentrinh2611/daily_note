// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../app/domain/entities/sc_user.dart';
import '../../../../core/error/failures.dart';

abstract class ChangePwRepository {
  Future<Either<Failure, SCUser>> changPw({required SCUser newUser});
}
