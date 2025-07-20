import 'package:basic_form/domain/repository/user_repository.dart';
import 'package:basic_form/presentation/model/common_response.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<List<CommonResponse>> getStateNameList() async {
    await Future.delayed(Duration(seconds: 1));  // Simulate API delay

    return [
      CommonResponse(
        id: 1,
        serialNo: 1,
        comboId: 301,
        flag: 'active',
        comboValue: 'Delhi',
        title: 'Delhi',
        languageId: 1,
      ),
      CommonResponse(
        id: 2,
        serialNo: 2,
        comboId: 302,
        flag: 'active',
        comboValue: 'Haryana',
        title: 'Haryana',
        languageId: 1,
      ),
      CommonResponse(
        id: 3,
        serialNo: 3,
        comboId: 303,
        flag: 'active',
        comboValue: 'Uttar Pradesh',
        title: 'Uttar Pradesh',
        languageId: 1,
      ),
      CommonResponse(
        id: 4,
        serialNo: 4,
        comboId: 304,
        flag: 'active',
        comboValue: 'Punjab',
        title: 'Punjab',
        languageId: 1,
      ),
    ];
  }

  @override
  @override
  Future<List<CommonResponse>> getStateDistrictList() async {
    await Future.delayed(Duration(seconds: 1));  // Simulate API delay

    return [
      // Delhi Districts
      CommonResponse(
        id: 1,
        serialNo: 1,
        comboId: 401,
        flag: 'active',
        comboValue: 'New Delhi',
        title: 'New Delhi',
        languageId: 1,
      ),
      CommonResponse(
        id: 2,
        serialNo: 2,
        comboId: 402,
        flag: 'active',
        comboValue: 'Central Delhi',
        title: 'Central Delhi',
        languageId: 1,
      ),
      CommonResponse(
        id: 3,
        serialNo: 3,
        comboId: 403,
        flag: 'active',
        comboValue: 'South Delhi',
        title: 'South Delhi',
        languageId: 1,
      ),
      CommonResponse(
        id: 4,
        serialNo: 4,
        comboId: 404,
        flag: 'active',
        comboValue: 'North Delhi',
        title: 'North Delhi',
        languageId: 1,
      ),

      // Haryana Districts
      CommonResponse(
        id: 5,
        serialNo: 5,
        comboId: 405,
        flag: 'active',
        comboValue: 'Gurgaon',
        title: 'Gurgaon',
        languageId: 1,
      ),
      CommonResponse(
        id: 6,
        serialNo: 6,
        comboId: 406,
        flag: 'active',
        comboValue: 'Faridabad',
        title: 'Faridabad',
        languageId: 1,
      ),
      CommonResponse(
        id: 7,
        serialNo: 7,
        comboId: 407,
        flag: 'active',
        comboValue: 'Panipat',
        title: 'Panipat',
        languageId: 1,
      ),
      CommonResponse(
        id: 8,
        serialNo: 8,
        comboId: 408,
        flag: 'active',
        comboValue: 'Rohtak',
        title: 'Rohtak',
        languageId: 1,
      ),

      // Uttar Pradesh Districts
      CommonResponse(
        id: 9,
        serialNo: 9,
        comboId: 409,
        flag: 'active',
        comboValue: 'Lucknow',
        title: 'Lucknow',
        languageId: 1,
      ),
      CommonResponse(
        id: 10,
        serialNo: 10,
        comboId: 410,
        flag: 'active',
        comboValue: 'Kanpur',
        title: 'Kanpur',
        languageId: 1,
      ),
      CommonResponse(
        id: 11,
        serialNo: 11,
        comboId: 411,
        flag: 'active',
        comboValue: 'Noida',
        title: 'Noida',
        languageId: 1,
      ),
      CommonResponse(
        id: 12,
        serialNo: 12,
        comboId: 412,
        flag: 'active',
        comboValue: 'Varanasi',
        title: 'Varanasi',
        languageId: 1,
      ),

      // Punjab Districts
      CommonResponse(
        id: 13,
        serialNo: 13,
        comboId: 413,
        flag: 'active',
        comboValue: 'Amritsar',
        title: 'Amritsar',
        languageId: 1,
      ),
      CommonResponse(
        id: 14,
        serialNo: 14,
        comboId: 414,
        flag: 'active',
        comboValue: 'Ludhiana',
        title: 'Ludhiana',
        languageId: 1,
      ),
      CommonResponse(
        id: 15,
        serialNo: 15,
        comboId: 415,
        flag: 'active',
        comboValue: 'Jalandhar',
        title: 'Jalandhar',
        languageId: 1,
      ),
      CommonResponse(
        id: 16,
        serialNo: 16,
        comboId: 416,
        flag: 'active',
        comboValue: 'Patiala',
        title: 'Patiala',
        languageId: 1,
      ),
    ];
  }


}
