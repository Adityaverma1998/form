import 'dart:convert';

class CommonResponse {
  final int? id;
  final int? serialNo;
  final int? comboId;
  final String? flag;
  final String? comboValue;
  final String? title;
  final int? languageId;
  final int? parentId;   // <-- Added parentId

  const CommonResponse({
    this.id,
    this.serialNo,
    this.comboId,
    this.flag,
    this.comboValue,
    this.title,
    this.languageId,
    this.parentId,
  });

  CommonResponse copyWith({
    int? id,
    int? serialNo,
    int? comboId,
    String? flag,
    String? comboValue,
    String? title,
    int? languageId,
    int? parentId,
  }) {
    return CommonResponse(
      id: id ?? this.id,
      serialNo: serialNo ?? this.serialNo,
      comboId: comboId ?? this.comboId,
      flag: flag ?? this.flag,
      comboValue: comboValue ?? this.comboValue,
      title: title ?? this.title,
      languageId: languageId ?? this.languageId,
      parentId: parentId ?? this.parentId,
    );
  }

  factory CommonResponse.fromMap(Map<String, dynamic> map) {
    return CommonResponse(
      id: map['id'],
      serialNo: map['serial_no'],
      comboId: map['combo_id'],
      flag: map['flag'],
      comboValue: map['combo_value'],
      title: map['title'],
      languageId: map['language_id'],
      parentId: map['parent_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serial_no': serialNo,
      'combo_id': comboId,
      'flag': flag,
      'combo_value': comboValue,
      'title': title,
      'language_id': languageId,
      'parent_id': parentId,
    };
  }

  factory CommonResponse.fromJson(String source) =>
      CommonResponse.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'CommonResponse(id: $id, serialNo: $serialNo, comboId: $comboId, flag: $flag, comboValue: $comboValue, title: $title, languageId: $languageId, parentId: $parentId)';
  }
}
