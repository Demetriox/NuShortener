import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shortener_nu/providers/list_url_provider.dart';
import 'package:shortener_nu/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  FlutterNativeSplash.removeAfter(initialization);

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ListAliasURL>(
          create: (_) => ListAliasURL(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

void initialization(BuildContext context) async {
  //Load dependencies and more
  dotenv.load();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
