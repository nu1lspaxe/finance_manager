import 'package:finance_manager/ui/auth/bloc/auth_bloc.dart';
import 'package:finance_manager/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obsecureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.paddingMedium,
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.username,
            ),
          ),
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
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
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
          TextField(
            controller: confirmPasswordController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.confirm_password,
              suffixIcon: IconButton(
                icon: Icon(
                  obsecureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obsecureConfirmPassword = !obsecureConfirmPassword;
                  });
                },
              ),
            ),
            obscureText: obsecureConfirmPassword,
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
                    SignUpEvent(
                      usernameController.text,
                      emailController.text,
                      passwordController.text,
                      confirmPasswordController.text,
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.sign_up),
              );
            },
          )
        ],
      ),
    );
  }
}