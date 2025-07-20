part of 'add_form_data_bloc.dart';

abstract class AddFormDataState {}

class AddFormDataInitialState extends AddFormDataState {}

class AddFormDataLoading extends AddFormDataState {}

class AddFormDataSuccess extends AddFormDataState {
  final User user;

  AddFormDataSuccess(this.user);
}

class AddFormDataError extends AddFormDataState {
  final String message;

  AddFormDataError(this.message);
}

/// State when state list is loaded
class StateListLoaded extends AddFormDataState {
  final List<CommonResponse> states;

  StateListLoaded(this.states);
}

/// State when district list is loaded
class DistrictListLoaded extends AddFormDataState {
  final List<CommonResponse> districts;

  DistrictListLoaded(this.districts);
}
