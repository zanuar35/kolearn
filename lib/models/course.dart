// ignore_for_file: non_constant_identifier_names

class Course {
  Course({
    required this.Success,
    required this.Message,
    required this.data,
  });
  late final bool Success;
  late final String Message;
  late final List<Data> data;

  Course.fromJson(Map<dynamic, dynamic> json) {
    Success = json['Success'];
    Message = json['Message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['Success'] = Success;
    _data['Message'] = Message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.courseName,
    required this.title,
    required this.category,
    required this.isSubmited,
  });
  late final int id;
  late final String courseName;
  late final String title;
  late final String category;
  late final int isSubmited;

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    title = json['title'];
    category = json['category'];
    isSubmited = json['is_submited'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['id'] = id;
    _data['course_name'] = courseName;
    _data['title'] = title;
    _data['category'] = category;
    _data['is_submited'] = isSubmited;
    return _data;
  }
}
