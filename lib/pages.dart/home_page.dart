part of 'pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<DataCubit>().fetchingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {
                    context.read<DataCubit>().fetchingSearchedData(value);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: "Masukkan id post",
                    hintStyle: const TextStyle(color: Color(0xFFADADAD)),
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
            ),
            BlocBuilder<DataCubit, DataState>(builder: (context, state) {
              if (state is DataLoaded) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.listData?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 0, left: 20, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              child: Text(state.listData![index].id.toString()),
                            ),
                            const SizedBox(width: 16),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width - 70 - 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${state.listData![index].title} - userId : ${state.listData![index].userId}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Text(
                                    state.listData![index].body ?? "",
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
                    });
              } else if (state is DataLoadedError) {
                return Text(state.message.toString());
              } else {
                return const SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50,
                );
              }
            })
          ],
        ),
      ),
    ));
  }
}
