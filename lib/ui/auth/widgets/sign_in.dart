import 'package:finance_manager/ui/auth/bloc/auth_bloc.dart';
import 'package:finance_manager/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.paddingMedium,
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email,
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
            ),
            obscureText: obscurePassword, 
          ),
          const SizedBox(height: Styles.spacingMedium),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    SignInEvent(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.sign_in),
              );
            },
          ),
        ],
      ),
    );
  }
}