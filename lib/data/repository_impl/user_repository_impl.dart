import 'package:basic_form/domain/repository/user_repository.dart';
import 'package:basic_form/presentation/model/common_response.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<List<CommonResponse>> getStateNameList() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      CommonResponse(id: 1, comboValue: 'Delhi', title: 'Delhi', languageId: 1, parentId: 1),
      CommonResponse(id: 2, comboValue: 'Haryana', title: 'Haryana', languageId: 1, parentId: 2),
      CommonResponse(id: 3, comboValue: 'Uttar Pradesh', title: 'Uttar Pradesh', languageId: 1, parentId: 3),
      CommonResponse(id: 4, comboValue: 'Punjab', title: 'Punjab', languageId: 1, parentId: 4),
    ];
  }

  @override
  Future<List<CommonResponse>> getStateDistrictList(int stateId) async {
    await Future.delayed(Duration(milliseconds: 500));

    final List<CommonResponse> allDistricts = [
      // Delhi
      CommonResponse(parentId: 1, comboValue: 'New Delhi', title: 'New Delhi'),
      CommonResponse(parentId: 1, comboValue: 'South Delhi', title: 'South Delhi'),

      // Haryana
      CommonResponse(parentId: 2, comboValue: 'Gurgaon', title: 'Gurgaon'),
      CommonResponse(parentId: 2, comboValue: 'Faridabad', title: 'Faridabad'),

      // Uttar Pradesh
      CommonResponse(parentId: 3, comboValue: 'Lucknow', title: 'Lucknow'),
      CommonResponse(parentId: 3, comboValue: 'Kanpur', title: 'Kanpur'),

      // Punjab
      CommonResponse(parentId: 4, comboValue: 'Amritsar', title: 'Amritsar'),
      CommonResponse(parentId: 4, comboValue: 'Ludhiana', title: 'Ludhiana'),
    ];

    return allDistricts.where((district) => district.parentId == stateId).toList();
  }

  @override
  @override
  Future<List<CommonResponse>> getGenderList() async {
    await Future.delayed(Duration(milliseconds: 300));
    return [
      CommonResponse(id: 1, comboId: 101, comboValue: 'Male', title: 'Male'),
      CommonResponse(id: 2, comboId: 102, comboValue: 'Female', title: 'Female'),
      CommonResponse(id: 3, comboId: 103, comboValue: 'Other', title: 'Other'),
    ];
  }

  @override
  Future<List<CommonResponse>> getCourseList() async {
    await Future.delayed(Duration(milliseconds: 300));
    return [
      CommonResponse(id: 1, comboId: 201, comboValue: 'Math', title: 'Math'),
      CommonResponse(id: 2, comboId: 202, comboValue: 'Science', title: 'Science'),
      CommonResponse(id: 3, comboId: 203, comboValue: 'History', title: 'History'),
      CommonResponse(id: 4, comboId: 204, comboValue: 'Art', title: 'Art'),
    ];
  }

}
