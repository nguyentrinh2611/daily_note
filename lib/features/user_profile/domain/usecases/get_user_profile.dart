// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:bunnynote/core/error/failures.dart';
import 'package:bunnynote/core/usecases/usecase.dart';
import 'package:bunnynote/features/user_profile/domain/entities/user_profile.dart';
import 'package:bunnynote/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfile extends UseCase<UserProfile, GetUserProfileParams> {
  final UserProfileRepository repositoty;
  GetUserProfile({
    required this.repositoty,
  });
  @override
  Future<Either<Failure, UserProfile>?> call(GetUserProfileParams params) async {
    return repositoty.getUserProfile(params: params);
  }
}

class GetUserProfileParams extends DefaultParams {
  final String userId;
  const GetUserProfileParams({
    required this.userId,
  });
}
