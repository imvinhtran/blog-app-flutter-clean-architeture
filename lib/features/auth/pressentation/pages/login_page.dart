import 'package:blog_clean_architecture/features/auth/pressentation/pages/signup_page.dart';
import 'package:blog_clean_architecture/features/auth/pressentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
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
              isObscureText: true,
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            //Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize:
                    const Size(200, 50), // Set the width and height here
              ),
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              ),
              child: RichText(
                text: const TextSpan(
                  text: 'I dont have account? ',
                  children: [
                    TextSpan(
                      text: 'Sign In',
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
    );
  }
}
