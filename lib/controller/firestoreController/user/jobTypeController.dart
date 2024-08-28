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
      JobType(icon:  'assets/images/profile_icons/jobType_icon/pin.jpg',name: 'التصميم', isSelected: false),
      JobType(icon:  'assets/images/profile_icons/jobType_icon/dev.jpg',name: 'البرمجة والتطوير', isSelected: true),
      JobType(icon:  'assets/images/profile_icons/jobType_icon/managers.jpg',name: 'ادارة الأعمال والمشاريع', isSelected: true),
      JobType(icon:  'assets/images/profile_icons/jobType_icon/marketing.jpg',name: 'التسويق', isSelected: false),
      JobType(icon:  'assets/images/profile_icons/jobType_icon/settings.jpg',name: 'الصيانة', isSelected: true),
      JobType(icon:  'assets/images/profile_icons/jobType_icon/other.jpg',name: 'اخرى', isSelected: false),
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
  String? icon;

  JobType({
    required this.name,
    this.icon,
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

