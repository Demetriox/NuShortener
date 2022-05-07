part of 'list_url_logic.dart';

class ListShortUrlState extends StatelessWidget {
  final _ListShortUrlController state;
  const ListShortUrlState(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('listViewUrl'),
      itemCount: state.widget._urlList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  state.widget._urlList[index].links.short,
                  style: kInfoList,
                ),
              ),
              IconButton(
                onPressed: () {
                  state.displaySnack(
                      const SnackBar(
                        content: Text('Copied'),
                      ),
                      index);
                },
                icon: const Icon(Icons.copy),
              )
            ],
          ),
        );
      },
    );
  }
}
