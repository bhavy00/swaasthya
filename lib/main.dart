import 'package:flutter/material.dart';
import 'package:swaasthya/pages/login_page.dart';
import 'package:swaasthya/pages/welcome_page.dart';
import 'package:swaasthya/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/utils/providers/logged_in_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedIn = ref.read(loggedInProvider);
    //print(loggedIn);
    return MaterialApp(
      title: 'Swaasthya',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      home: loggedIn ? const WelcomePage() : const LoginPage(),
    );
  }
}
