part of 'add_form_data_bloc.dart';


abstract class AddFormEvent{}

class SubmitFormEvent extends AddFormEvent{
  final User user;
  SubmitFormEvent(this.user);
}

class GetStateCommonList extends AddFormEvent{}
class GetDistrictCommonList extends AddFormEvent{}