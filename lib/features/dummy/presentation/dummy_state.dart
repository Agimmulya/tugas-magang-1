import '../model/dummy_model.dart';

abstract class DummyState {}

class DummyFootballLoadSuccess extends DummyState {
  final List<SampleModel> listFootball;

  DummyFootballLoadSuccess(this.listFootball);
}

class DummyFootballLoading extends DummyState {}

class DummyFootballIdle extends DummyState {}

class DummyFootballError extends DummyState {}
