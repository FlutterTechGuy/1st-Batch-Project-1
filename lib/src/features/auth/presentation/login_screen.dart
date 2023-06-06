import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/features/auth/presentation/register_screen.dart';
import 'package:flutter_interview_test/src/features/auth/providers/auth_provider.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/todo_view_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailCtrl,
                        validator: (p) {
                          if (p!.isEmpty) {
                            return "Filed can't be empty";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p)) {
                            return "enter a valid email";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      TextFormField(
                        controller: passwordCtrl,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                    ],
                  )),
              TextButton(
                onPressed: () async {
                  String email = emailCtrl.text.trim();
                  String pass = passwordCtrl.text.trim();
                  if (formKey.currentState!.validate()) {
                    final res = await context
                        .read<AuthProvider>()
                        .login(email: email, password: pass);

                    if (res == 'OK') {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const TodoViewScreen()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(res)));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter all the details")));
                  }
                },
                child: const Text(
                  "Login ",
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final res = await context
                        .read<AuthProvider>()
                        .forgotPassword(email: emailCtrl.text.trim());
                    if (res == 'OK') {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Email link send to ${emailCtrl.text.trim()}")));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(res)));
                    }
                  }
                },
                child: const Text(
                  "Forgot password?",
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
                child: const Text(
                  "New user?",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
