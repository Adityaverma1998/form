import 'package:basic_form/presentation/model/common_response.dart';

abstract class UserRepository{

  Future<List<CommonResponse>> getStateNameList();
  Future<List<CommonResponse>> getStateDistrictList(int id);
  Future<List<CommonResponse>> getGenderList();
  Future<List<CommonResponse>> getCourseList();
}