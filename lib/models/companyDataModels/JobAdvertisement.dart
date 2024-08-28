class JobAdvertisement {
  String type;
  String gender;
  String experience;
  String jobType;
  String educationLevel;
  String skills;
  String employeeNum;
  String address;
  String workingHours;
  String salary;
  String notes;
  DateTime? timestamp;

  JobAdvertisement({
    required this.type,
    required this.gender,
    required this.experience,
    required this.jobType,
    required this.educationLevel,
    required this.skills,
    required this.employeeNum,
    required this.address,
    required this.workingHours,
    required this.salary,
    required this.notes,
    this.timestamp
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'gender': gender,
      'experience': experience,
      'jobType': jobType,
      'educationLevel': educationLevel,
      'skills': skills,
      'employeeNum': employeeNum,
      'address': address,
      'workingHours': workingHours,
      'salary': salary,
      'notes': notes,
      'timestamp': timestamp??DateTime.now(),
    };
  }

  factory JobAdvertisement.fromMap(Map<String, dynamic> map) {
    return JobAdvertisement(
      type:map['type'],
      gender:map['gender'],
      experience:map['experience'],
      jobType:map['jobType'],
      educationLevel:map['educationLevel'],
      skills:map['skills'],
      employeeNum:map['employeeNum'],
      address:map['address'],
      workingHours:map['workingHours'],
      salary:map['salary'],
      notes:map['notes'],
    );
  }



}
