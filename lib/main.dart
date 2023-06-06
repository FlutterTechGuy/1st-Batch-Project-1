// import 'package:flutter/material.dart';
// import 'package:flutter_interview_test/src/core/routes/routes.dart';
// import 'package:flutter_interview_test/src/features/todo/presentation/todo_view_screen.dart';
// import 'package:flutter_interview_test/src/features/todo/provider/todo_provider.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TodoProvider(),
//       child: MaterialApp(
//         onGenerateRoute: onGenerateRoute,
//         debugShowCheckedModeBanner: false,
//         home: TodoViewScreen(),
//         // home: const SwitchScreen(),
//         theme: ThemeData(
//             useMaterial3: true,
//             colorSchemeSeed: const Color.fromARGB(255, 0, 188, 94)),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/features/auth/providers/auth_provider.dart';
import 'package:flutter_interview_test/src/features/auth/providers/role_provider.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/todo_view_screen.dart';
import 'package:flutter_interview_test/src/features/todo/provider/provider.dart';
import 'package:provider/provider.dart';

import 'src/features/auth/presentation/login_screen.dart';

User? currentUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  currentUser = FirebaseAuth.instance.currentUser;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RoleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        ),
      ],
      child: MaterialApp(
        home: currentUser == null ? LoginScreen() : const TodoViewScreen(),
      ),
    );
  }
}
