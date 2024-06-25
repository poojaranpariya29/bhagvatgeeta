import 'package:departure/contoller/provider.dart';
import 'package:departure/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonProvider(),
        )
      ],
      child: Consumer<JsonProvider>(builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: (theme.istheme == true)
              ? ThemeData.dark()
              : ThemeData.light(useMaterial3: true),
          home: SplashScreen(),
        );
      }),
    );
  }
}
