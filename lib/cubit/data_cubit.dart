import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pretest/models/models.dart';
import 'package:pretest/services/services.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  void fetchingData() async {
    List<Data>? dataResponse = await DataServices.getData(
        "https://jsonplaceholder.typicode.com/posts/");
    if (dataResponse == []) {
      emit(DataLoadedError(message: "Error Unknown"));
    } else {
      emit(DataLoaded(listData: dataResponse));
    }
  }

  void fetchingSearchedData(String idPost) async {
    Data? dataResponse = await DataServices.getSearchedData(
        "https://jsonplaceholder.typicode.com/posts/", idPost);
    if (dataResponse.id == null) {
      emit(DataLoadedError(message: "Error Unknown"));
    } else {
      emit(DataSearchedLoaded(data: dataResponse));
    }
  }
}
