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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  hintText: 'Confrim Password',
                ),
              ),
              TextButton(
                onPressed: () async {
                  String email = emailCtrl.text.trim();
                  String pass = passwordCtrl.text.trim();
                  if (AuthHelper.checkUserInputs(
                      email: email, password: pass)) {
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter all the details")));
                  }
                },
                child: Text(
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
