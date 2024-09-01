class Course {
  String? courseName;
  String? courseDays;
  String? courseHours;
  String? isCertified;
  String? courseLevel;
  String? courseType;
  String? coursePrice;
  String? courseLocation;
  String? courseDescription;
  String? videoLink;


  Course({
    required this.courseName,
    required this.courseHours,
    required this.courseDays,
    required this.isCertified,
    required this.courseLevel,
    required this.courseType,
    required this.coursePrice,
    required this.courseLocation,
    required this.courseDescription,
    required this.videoLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
      'courseHours': courseHours,
      'courseDays': courseDays,
      'isCertified': isCertified,
      'courseLevel': courseLevel,
      'courseType': courseType,
      'coursePrice': coursePrice,
      'courseLocation': courseLocation,
      'courseDescription': courseDescription,
      'videoLink': videoLink,

    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseName: map['courseName'],
      courseHours: map['courseHours'] ,
      isCertified: map['isCertified'],
      courseLevel: map['courseLevel'],
      courseDays: map['courseDays'],
      courseType: map['courseType'],
      coursePrice: map['coursePrice'],
      courseLocation: map['courseLocation'],
      courseDescription: map['courseDescription'],
      videoLink: map['videoLink'],


    );
  }
}
