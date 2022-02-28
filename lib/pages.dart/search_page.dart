part of 'pages.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<DataCubit>().fetchingData();
        Navigator.of(context).pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black.withOpacity(0.04)),
                        child: GestureDetector(
                          onTap: () {
                            context.read<DataCubit>().fetchingData();
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value) {
                            context
                                .read<DataCubit>()
                                .fetchingSearchedData(value);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchPage()));
                          },
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: "Masukkan id post",
                            hintStyle:
                                const TextStyle(color: Color(0xFFADADAD)),
                            prefixIcon: const Visibility(
                              visible: true,
                              child: Icon(Icons.search),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<DataCubit, DataState>(
                  builder: (context, state) {
                    if (state is DataSearchedLoaded) {
                      return Container(
                        margin: const EdgeInsets.only(top: 0, left: 20),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              child: Text(state.data!.id.toString()),
                            ),
                            const SizedBox(width: 16),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * 24 -
                                  70 -
                                  16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${state.data!.title} - userId : ${state.data!.userId}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Text(
                                    state.data!.body ?? "",
                                    style: const TextStyle(
                                        color: Colors.black38, fontSize: 12),
                                    maxLines: 4,
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is DataLoadedError) {
                      return Center(child: Text(state.message.toString()));
                    } else {
                      return const SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 50,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
