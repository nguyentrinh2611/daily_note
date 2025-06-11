// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable

// Package imports:
import 'package:bunnynote/core/error/exceptions.dart';
import 'package:bunnynote/core/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ChangePwRemoteDataSource {
  Future<String> changePw({required String newPassword});
}

class ChangePwRemoteDataSourceImpl implements ChangePwRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  ChangePwRemoteDataSourceImpl({
    required this.firebaseAuth,
  });
  @override
  Future<String> changePw({required String newPassword}) async {
    final User? user = firebaseAuth.currentUser;
    if (user == null) {
      throw ServerException();
    } else {
      try {
        final result = await user.updatePassword(newPassword);
        return newPassword;
      } catch (e) {
        AppLogger.instance.e(e);
        throw (ServerException());
      }
    }
  }
}
