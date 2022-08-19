import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ocg/pages/account_page.dart';
import 'package:ocg/pages/login_page.dart';
import 'package:ocg/pages/splash_page.dart';
import 'package:ocg/pages/choice_page.dart';
import 'package:ocg/pages/create_game_page.dart';
import 'package:ocg/pages/search_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: '',
    anonKey: '',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        // '/about': (_) => const
        '/login': (_) => const LoginPage(),
        '/choice': (_) => const ChoicePage(),
        '/create': (_) => const CreateGamePage(),
        '/search': (_) => const SearchPage(),
        '/play': (_) => const ChoicePage(),
        '/account': (_) => const AccountPage(),
      },
    );
  }
}
