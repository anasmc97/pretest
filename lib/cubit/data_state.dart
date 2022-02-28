part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoaded extends DataState {
  List<Data>? listData;
  DataLoaded({this.listData});
}

class DataLoadedError extends DataState {
  String? message;
  DataLoadedError({this.message});
}

class DataSearchedLoaded extends DataState {
  Data? data;
  DataSearchedLoaded({this.data});
}
