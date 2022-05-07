import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortener_nu/providers/list_url_provider.dart';
import 'package:shortener_nu/ui/screens/home_screen/input_bar/input_bar_logic.dart';
import 'package:shortener_nu/ui/screens/home_screen/list_url/list_url_logic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Shortener'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const InputBarURL(),
          Consumer<ListAliasURL>(
            builder: (context, value, _) => ListShortUrl(
              value.getUrlList(),
            ),
          ),
        ]),
      ),
    );
  }
}
