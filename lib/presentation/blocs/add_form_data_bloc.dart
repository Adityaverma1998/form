import 'package:basic_form/domain/repository/user_repository.dart';
import 'package:basic_form/presentation/model/common_response.dart';
import 'package:basic_form/presentation/model/form_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_form_data_event.dart';
part 'add_form_data_state.dart';

class AddFormBloc extends Bloc<AddFormEvent, AddFormDataState> {
  final UserRepository userRepository;

  List<CommonResponse> _states = [];
  List<CommonResponse> _districts = [];
  List<CommonResponse> _genders = [];
  List<CommonResponse> _courses = [];

  CommonResponse? _selectedState;
  CommonResponse? _selectedDistrict;
  CommonResponse? _selectedGender;
  List<CommonResponse> _selectedSubjects = [];

  AddFormBloc(this.userRepository) : super(AddFormDataInitialState()) {
    on<LoadInitialDataEvent>(_onLoadInitialData);
    on<SelectStateEvent>(_onSelectState);
    on<SelectDistrictEvent>(_onSelectDistrict);
    on<SelectGenderEvent>(_onSelectGender);
    on<SelectSubjectsEvent>(_onSelectSubjects);
    on<SubmitFormEvent>(_onSubmitFormEvent);
  }

  Future<void> _onLoadInitialData(
      LoadInitialDataEvent event, Emitter<AddFormDataState> emit) async {
    emit(AddFormDataLoading());
    try {
      _states = await userRepository.getStateNameList();
      _genders = await userRepository.getGenderList();
      _courses = await userRepository.getCourseList();
      emit(_buildCombinedState());
    } catch (e) {
      emit(AddFormDataError('Failed to load initial data: $e'));
    }
  }

  Future<void> _onSelectState(
      SelectStateEvent event, Emitter<AddFormDataState> emit) async {
    _selectedState = event.selectedState;
    _selectedDistrict = null;

    _districts = [];
    if (event.selectedState.parentId != null) {
      _districts = await userRepository.getStateDistrictList(event.selectedState.parentId!);
    }
    print("check district $_districts");
    emit(_buildCombinedState());
  }

  void _onSelectDistrict(
      SelectDistrictEvent event, Emitter<AddFormDataState> emit) {
    _selectedDistrict = event.selectedDistrict;
    emit(_buildCombinedState());
  }

  void _onSelectGender(
      SelectGenderEvent event, Emitter<AddFormDataState> emit) {
    _selectedGender = event.selectedGender;
    emit(_buildCombinedState());
  }

  void _onSelectSubjects(
      SelectSubjectsEvent event, Emitter<AddFormDataState> emit) {
    _selectedSubjects = event.selectedSubjects.toSet().toList();
    emit(_buildCombinedState());
  }

  Future<void> _onSubmitFormEvent(
      SubmitFormEvent event, Emitter<AddFormDataState> emit) async {
    emit(AddFormDataLoading());
    try {
      await Future.delayed(Duration(seconds: 1)); // Simulated delay
      emit(AddFormDataSuccess(event.user));
    } catch (e) {
      emit(AddFormDataError('Failed to submit form: $e'));
    }
  }

  AddFormDataState _buildCombinedState() {
    return StateAndDistrictsLoaded(
      states: _states,
      districts: _districts,
      genders: _genders,
      courses: _courses,
      selectedState: _selectedState,
      selectedDistrict: _selectedDistrict,
      selectedGender: _selectedGender,
      selectedSubjects: _selectedSubjects,
    );
  }
}
