import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Presentation/Screen/todo_home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options:const FirebaseOptions(
          apiKey: "AIzaSyALNBdR7tx9yeY88GeXdvkzvxhis0NXLe8",
          appId: "1:297408925197:web:609f69c8fef8a2c6b74f44",
          messagingSenderId: "297408925197",
          projectId: "todoapp-b103e"
      )
    );
  }
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoHomeScreen()
    );
  }
}
