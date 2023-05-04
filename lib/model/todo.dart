import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  String name;
  String regno;
  String clas;
  String mobile;
  String dept;
  Student({
    required this.name,
    required this.regno,
    required this.clas,
    required this.mobile,
    required this.dept,
  });

  Student copyWith({
    String? name,
    String? regno,
    String? clas,
    String? mobile,
    String? dept,
  }) {
    return Student(
      name: name ?? this.name,
      regno: regno ?? this.regno,
      clas: clas ?? this.clas,
      mobile: mobile ?? this.mobile,
      dept: dept ?? this.dept,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'regno': regno,
      'clas': clas,
      'mobile': mobile,
      'dept': dept,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] as String,
      regno: map['regno'] as String,
      clas: map['clas'] as String,
      mobile: map['mobile'] as String,
      dept: map['dept'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(name: $name, regno: $regno, clas: $clas, mobile: $mobile, dept: $dept)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.regno == regno &&
        other.clas == clas &&
        other.mobile == mobile &&
        other.dept == dept;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        regno.hashCode ^
        clas.hashCode ^
        mobile.hashCode ^
        dept.hashCode;
  }
}
