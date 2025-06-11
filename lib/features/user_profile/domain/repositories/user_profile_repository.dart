// Package imports:
import 'package:bunnynote/features/user_profile/domain/usecases/set_user_profile.dart';
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../core/error/failures.dart';
import '../entities/user_profile.dart';
import '../usecases/get_user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfile>> getUserProfile({
    required GetUserProfileParams params,
  });
  Future<Either<Failure, UserProfile>> setUserProfile({
    required SetUserProfileParams params,
  });
}
