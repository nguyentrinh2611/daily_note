// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:bunnynote/core/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../../core/error/exceptions.dart';
import '../../../splash/data/models/sc_user_model.dart';

abstract class LoginRemoteDataSource {
  Future<SCUserModel> loginWithUsernameAndPw({
    required String username,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth fir;
  LoginRemoteDataSourceImpl({
    required this.fir,
  });
  @override
  Future<SCUserModel> loginWithUsernameAndPw({
    required String username,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await fir.signInWithEmailAndPassword(email: username, password: password);

      return SCUserModel(
          username: credential.user?.email ?? "",
          password: password,
          uid: credential.user?.uid ?? "");
    } on FirebaseAuthException catch (e) {
      AppLogger.instance.e(e);
      throw AuthException(errorCode: e.code);
    }
  }
}
