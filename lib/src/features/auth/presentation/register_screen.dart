import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/features/auth/helpers/auth_ui_helpers.dart';
import 'package:flutter_interview_test/src/features/auth/presentation/login_screen.dart';
import 'package:flutter_interview_test/src/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordCtrl2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Filed can't be empty";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "enter a valid email";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Filed can't be empty";
                        }
                        if (value.length < 6) {
                          return "Password too weak";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordCtrl2,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Filed can't be empty";
                        }
                        if (value.length < 6) {
                          return "Password too weak";
                        }
                        if (passwordCtrl.text.trim() != value) {
                          return "Password didn't match!";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  String email = emailCtrl.text.trim();
                  String pass = passwordCtrl.text.trim();
                  if (_formKey.currentState!.validate()) {
                    final res = await context
                        .read<AuthProvider>()
                        .register(email: email, password: pass);

                    if (res == 'OK') {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(res)));
                    }
                  }
                },
                child: const Text(
                  "Register ",
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text("Already a user ? "),
              )
            ],
          ),
        ),
      ),
    );
  }
}
