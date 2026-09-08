import 'package:flutter/material.dart';
import 'package:project_1_flutter/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://owzictcomkslqcalehxw.supabase.co",
    publishableKey: "sb_publishable_TNbhL7TeJR_9vOshugUuFw_nDwaoE5F",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: (false),
      home: const HomeScreen(),
    );
  }
}
