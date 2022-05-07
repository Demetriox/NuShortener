import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortener_nu/models/url_model.dart';
import 'package:shortener_nu/utils/constants/k_fonts.dart';
part 'list_url.dart';

class ListShortUrl extends StatefulWidget {
  final List<URLInfoModel> _urlList;
  const ListShortUrl(this._urlList, {Key? key}) : super(key: key);

  @override
  _ListShortUrlController createState() => _ListShortUrlController();
}

class _ListShortUrlController extends State<ListShortUrl> {
  TextEditingController urltxt = TextEditingController();

  @override
  Widget build(BuildContext context) => ListShortUrlState(this);

  //Display snack on click
  void displaySnack(SnackBar snack, index) {
    Clipboard.setData(ClipboardData(text: widget._urlList[index].links.short))
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(snack));
  }
}
