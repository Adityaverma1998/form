import 'package:basic_form/presentation/model/common_response.dart';

abstract class UserRepository{

  Future<List<CommonResponse>> getStateNameList();
  Future<List<CommonResponse>> getStateDistrictList();
}