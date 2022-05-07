import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortener_nu/models/response_model.dart';
import 'package:shortener_nu/models/url_model.dart';
import 'package:shortener_nu/providers/list_url_provider.dart';
import 'package:shortener_nu/services/url_api.dart';
import 'package:shortener_nu/ui/widgets/dialog_pop.dart';
part 'input_bar.dart';

class InputBarURL extends StatefulWidget {
  const InputBarURL({Key? key}) : super(key: key);

  @override
  _InputBarURLController createState() => _InputBarURLController();
}

class _InputBarURLController extends State<InputBarURL> {
  TextEditingController urltxt = TextEditingController();

  @override
  Widget build(BuildContext context) => InputBarURLState(this);

  void createShortURL() async {
    ListAliasURL urlProvider =
        Provider.of<ListAliasURL>(context, listen: false);

    DialogUtils.showCustomDialog(context,
        title: "Creating...", okBtnFunction: () => {});

    //Cast of the value to URLInfo
    var dataShortURL = await URLShortenerAPI().shortenerURL(urltxt.text)
        as ResponseModel<URLInfoModel>;
    Navigator.of(context, rootNavigator: true).pop();

    if (dataShortURL.model == null) {
      //Failed to be created
      DialogUtils.showCustomDialog(context,
          title: "Failed ", okBtnFunction: () => {});
    }
    urlProvider.addUrl(dataShortURL.model as URLInfoModel);
    urltxt.text = "";
  }
}
