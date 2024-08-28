class Edaction {
  String university;
  String college;
  String graduationDate;
  String selectedDegree;

  Edaction({
    required this.university,
    required this.college,
    required this.graduationDate,
    required this.selectedDegree,
  });

  Map<String, dynamic> toMap() {
    return {
      'university': university,
      'college': college,
      'graduationDate': graduationDate,
      'selectedDegree': selectedDegree,
    };
  }
}
