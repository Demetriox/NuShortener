import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shortener_nu/providers/list_url_provider.dart';
import 'package:shortener_nu/ui/screens/home_screen/input_bar/input_bar_logic.dart';

void main() {
  const inputController = InputBarURL();
  late final input = InputBarURLState(inputController.createState()).state;

  ListAliasURL urlProvider =
      Provider.of<ListAliasURL>(input.context, listen: false);

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
  });
  group(
    "This to test the home screen wich has the URL shortener",
    (() {
      test("Check the list is empty", () {
        if (input.mounted) {
          expect(urlProvider.getUrlList().length, 0);
        }
      });
      test('update list', () async {
        TestWidgetsFlutterBinding.ensureInitialized();

        //  final mockHTTPClient = MockClient((request) async {
        //   // Create sample response of the HTTP call //
        //   final response = {
        //     "text":
        //         "22834 is the feet above sea level of the highest mountain
        //         in the Western Hemisphere, Mount Aconcagua in Argentina.",
        //     "number": 22834,
        //     "found": true,
        //     "type": "trivia"
        //   };
        //   return Response(jsonEncode(response), 200);
        // });

        //Set Value
        if (input.mounted) {}
        // URLShortenerAPI shortAPI = URLShortenerAPI();
        // await shortAPI.shortenerURL('www.google.com');
        // ListAliasURL urlProvider =
        //     Provider.of<ListAliasURL>(input.context, listen: false);

        expect(urlProvider.getUrlList().length, 1);
      });
    }),
  );
}
