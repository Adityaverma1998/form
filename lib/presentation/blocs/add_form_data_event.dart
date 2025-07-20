part of 'add_form_data_bloc.dart';

abstract class AddFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadInitialDataEvent extends AddFormEvent {}

class SelectStateEvent extends AddFormEvent {
  final CommonResponse selectedState;

  SelectStateEvent(this.selectedState);

  @override
  List<Object?> get props => [selectedState];
}

class SelectDistrictEvent extends AddFormEvent {
  final CommonResponse selectedDistrict;

  SelectDistrictEvent(this.selectedDistrict);

  @override
  List<Object?> get props => [selectedDistrict];
}

class SelectGenderEvent extends AddFormEvent {
  final CommonResponse selectedGender;

  SelectGenderEvent(this.selectedGender);

  @override
  List<Object?> get props => [selectedGender];
}

class SelectSubjectsEvent extends AddFormEvent {
  final List<CommonResponse> selectedSubjects;

  SelectSubjectsEvent(this.selectedSubjects);

  @override
  List<Object?> get props => [selectedSubjects];
}

class SubmitFormEvent extends AddFormEvent {
  final User user;

  SubmitFormEvent(this.user);

  @override
  List<Object?> get props => [user];
}
