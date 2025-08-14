// Dart imports:
import 'dart:async';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'app/app_observer.dart';
import 'app/presentation/widgets/app.dart';
import 'core/utils/logger.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final FirebaseApp app = await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform, name: "bunnynote");

      await di.init(firebaseApp: app);
      Bloc.observer = AppBlocObserver();
      runApp(const MyApp());
    },
    (error, stackTrace) => AppLogger.instance.e(error.toString()),
  );
}
