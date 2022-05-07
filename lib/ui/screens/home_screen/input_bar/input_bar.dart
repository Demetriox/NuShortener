part of 'input_bar_logic.dart';

class InputBarURLState extends StatelessWidget {
  final _InputBarURLController state;
  const InputBarURLState(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 6,
            child: TextFormField(
              key: const Key("insertUrltxt"),
              controller: state.urltxt,
            )),
        IconButton(
          key: const Key("tapToInsertxt"),
          onPressed: () async {
            state.createShortURL();
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}
