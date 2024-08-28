class Certificates {
  String coursesName;
  String coursesType;
  String coursesAgncy;
  String coursesTime;

  Certificates({
    required this.coursesName,
    required this.coursesType,
    required this.coursesAgncy,
    required this.coursesTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'coursesName': coursesName,
      'coursesType': coursesType,
      'coursesAgncy': coursesAgncy,
      'coursesTime': coursesTime,
    };
  }
}
