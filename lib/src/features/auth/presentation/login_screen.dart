import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/features/auth/helpers/auth_ui_helpers.dart';
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
                            return 'This field is required';
                          }
                          if (p.length < 4) {
                            return 'Not a valid email';
                          }

                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Email'),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
                child: const Text(
                  "New user?",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
