import 'package:get/get.dart';

class JobTypeController extends GetxController {
  var jobTypes = <JobType>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadJobTypes();
  }

  void loadJobTypes() {
    jobTypes.value = [
      JobType(name: 'التصميم', isSelected: false),
      JobType(name: 'البرمجة والتطوير', isSelected: true),
      JobType(name: 'ادارة الأعمال والمشاريع', isSelected: true),
      JobType(name: 'التسويق', isSelected: false),
      JobType(name: 'الصيانة', isSelected: true),
      JobType(name: 'اخرى', isSelected: false),
    ];
  }

  void toggleJobTypeSelection(int index, bool value) {
    jobTypes[index].isSelected = value;
    jobTypes.refresh();
  }



}


class JobType {
  String name;
  bool isSelected;

  JobType({
    required this.name,
    this.isSelected = false,
  });

  // Convert to map for storing in Firebase or passing to another screen
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
    };
  }

  // Create from map for retrieving data
  factory JobType.fromMap(Map<String, dynamic> map) {
    return JobType(
      name: map['name'],
      isSelected: map['isSelected'],
    );
  }

}







