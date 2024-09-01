class JobAdvertisement {
  String? type;
  String? companyName;
  String? companyImage;
  String? gender;
  String? experience;
  String? jobType;
  String? educationLevel;
  String? skills;
  String? employeeNum;
  String? address;
  String? workingHours;
  String? salary;
  String? notes;
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
    required this.companyName,
    required this.companyImage,
    required this.workingHours,
    required this.salary,
    required this.notes,
    this.timestamp
  });



  factory JobAdvertisement.fromMap(Map<String, dynamic> map) {
    return JobAdvertisement(
      type:map['specialization'],
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
      companyName: map['companyName'],
      companyImage: map['companyImage'],

    );
  }



}
