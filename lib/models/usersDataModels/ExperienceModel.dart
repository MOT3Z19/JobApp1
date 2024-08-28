class Experience {
  String jobTitle;
  String companyName;
  String startDate;
  String endDate;

  Experience({
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobTitle': jobTitle,
      'companyName': companyName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
