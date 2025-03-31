import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:finance_manager/ui/auth/widgets/sign_in.dart';
import 'package:finance_manager/ui/auth/widgets/sign_up.dart';
import 'package:finance_manager/ui/auth/bloc/auth_bloc.dart';
import 'package:finance_manager/data/services/auth_service.dart';
import 'package:finance_manager/data/storage/cache_storage.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.auth_screen),
        ),
        body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthSuccess) {
                final CacheStorage cache = await CacheStorage.getInstance();
                await cache.saveAuthData(
                  userId: state.authResponse['userId'],
                  token: state.authResponse['token'],
                );

                context.pushReplacement('/home');
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _isSignIn ? const SignInWidget() : const SignUpWidget(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignIn = !_isSignIn;
                      });
                    },
                    child: Text(
                      _isSignIn
                          ? AppLocalizations.of(context)!.sign_up_text
                          : AppLocalizations.of(context)!.sign_in_text,
                    ),
                  ),
                ],
              ),
            )
          )
        )
    );
  }
}
