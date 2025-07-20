import 'package:basic_form/domain/repository/user_repository.dart';
import 'package:basic_form/presentation/model/common_response.dart';
import 'package:basic_form/presentation/model/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_form_data_event.dart';
part 'add_form_data_state.dart';

class AddFormBloc extends Bloc<AddFormEvent, AddFormDataState> {
  final UserRepository userRepository;

  AddFormBloc(this.userRepository) : super(AddFormDataInitialState()) {
    on<SubmitFormEvent>(_onSubmitFormEvent);
    on<GetStateCommonList>(_onGetStateCommonList);
    on<GetDistrictCommonList>(_onGetDistrictCommonList);
  }

  Future<void> _onSubmitFormEvent(
      SubmitFormEvent event,
      Emitter<AddFormDataState> emit,
      ) async {
    emit(AddFormDataLoading());
    try {
      // Simulate API/form submission delay
      await Future.delayed(Duration(seconds: 1));
      emit(AddFormDataSuccess(event.user));
    } catch (e) {
      emit(AddFormDataError('Failed to submit form'));
    }
  }

  Future<void> _onGetStateCommonList(
      GetStateCommonList event,
      Emitter<AddFormDataState> emit,
      ) async {
    emit(AddFormDataLoading());
    try {
      final states = await userRepository.getStateNameList();
      emit(StateListLoaded(states));
    } catch (e) {
      emit(AddFormDataError('Failed to load states'));
    }
  }

  Future<void> _onGetDistrictCommonList(
      GetDistrictCommonList event,
      Emitter<AddFormDataState> emit,
      ) async {
    emit(AddFormDataLoading());
    try {
      final districts = await userRepository.getStateDistrictList();
      emit(DistrictListLoaded(districts));
    } catch (e) {
      emit(AddFormDataError('Failed to load districts'));
    }
  }
}
