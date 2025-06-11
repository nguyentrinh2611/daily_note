// ignore_for_file: public_member_api_docs, sort_constructors_first

// Flutter imports:
import 'package:bunnynote/app/presentation/cubit/app_cubit.dart';
import 'package:bunnynote/features/home/presentation/pages/home_page.dart';
import 'package:bunnynote/features/login/domain/entities/login_page_arg.dart';
import 'package:bunnynote/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:

class Screen extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  const Screen({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listenWhen: (previous, current) {
        return previous.authState != current.authState;
      },
      listener: (context, state) {
        if (state.authState.isLoged == true) {
          Navigator.of(context).pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
        } else {
          if (ModalRoute.of(context)?.settings.name != LoginPage.routeName) {
            Navigator.of(context).pushNamedAndRemoveUntil<LoginPageArg>(
                LoginPage.routeName,
                arguments: LoginPageArg(password: "", username: ""),
                (route) => false);
          }
        }
      },
      child: builder.call(context),
    );
  }
}
