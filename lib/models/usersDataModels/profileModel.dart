class Profile {
  final List<String> selectedJobTypes;
  final List<String> selectedJobTimes;
  final String jobTitle;
  final String companyName;
  final String startDate;
  final String endDate;
  final String jobNature;
  final String educationLevel;
  final String university;
  final String college;
  final String graduationDate;
  final String briefDescription;
  final String cvFileUrl; 

  Profile({
    required this.selectedJobTypes,
    required this.selectedJobTimes,
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    required this.jobNature,
    required this.educationLevel,
    required this.university,
    required this.college,
    required this.graduationDate,
    required this.briefDescription,
    required this.cvFileUrl,
  });
}
