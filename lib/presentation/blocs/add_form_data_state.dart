part of 'add_form_data_bloc.dart';

abstract class AddFormDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddFormDataInitialState extends AddFormDataState {}

class AddFormDataLoading extends AddFormDataState {}

class AddFormDataSuccess extends AddFormDataState {
  final User user;

  AddFormDataSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AddFormDataError extends AddFormDataState {
  final String message;

  AddFormDataError(this.message);

  @override
  List<Object?> get props => [message];
}

class StateAndDistrictsLoaded extends AddFormDataState {
  final List<CommonResponse> states;
  final List<CommonResponse> districts;
  final List<CommonResponse> genders;
  final List<CommonResponse> courses;
  final CommonResponse? selectedState;
  final CommonResponse? selectedDistrict;
  final CommonResponse? selectedGender;
  final List<CommonResponse> selectedSubjects;

  StateAndDistrictsLoaded({
    required this.states,
    required this.districts,
    required this.genders,
    required this.courses,
    this.selectedState,
    this.selectedDistrict,
    this.selectedGender,
    this.selectedSubjects = const [],
  });

  @override
  List<Object?> get props => [
    states,
    districts,
    genders,
    courses,
    selectedState,
    selectedDistrict,
    selectedGender,
    selectedSubjects,
  ];
}
