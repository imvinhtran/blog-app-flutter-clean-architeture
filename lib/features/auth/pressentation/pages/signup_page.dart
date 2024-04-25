import 'package:blog_clean_architecture/features/auth/pressentation/bloc/auth_bloc.dart';
import 'package:blog_clean_architecture/features/auth/pressentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

import 'package:blog_clean_architecture/features/auth/pressentation/pages/login_page.dart';
import 'package:blog_clean_architecture/features/auth/pressentation/widgets/auth_field.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sgin Up Page',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              AuthField(
                hintText: "Email",
                textEditingController: emailController,
                isObscureText: false,
              ),
              const SizedBox(height: 20),
              AuthField(
                hintText: "Password",
                textEditingController: passwordController,
                isObscureText: false,
              ),
              const SizedBox(height: 20),
              AuthField(
                hintText: "Confirm password",
                textEditingController: confirmPasswordController,
                isObscureText: true,
              ),
              SizedBox(height: 20),
              //Button
              AuthButton(
                buttonText: "Sign In.",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignUp(
                            email: emailController.text,
                            password: passwordController.text,
                            name: confirmPasswordController.text,
                          ),
                        );
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
