
import 'package:get/get.dart';

class JobTimeController extends GetxController {
  var jobTimes = <JobTime>[
    JobTime(name: 'دوام كامل', imagePath: 'assets/images/profile_icons/jobTime_icon/full.jpg',isSelected: true),
    JobTime(name: 'دوام جزئي', imagePath: 'assets/images/profile_icons/jobTime_icon/half.jpg'),
    JobTime(name: 'عقد عمل', imagePath: 'assets/images/profile_icons/jobTime_icon/face.jpg'),
    JobTime(name: 'تدريب عملي', imagePath: 'assets/images/profile_icons/jobTime_icon/work.jpg'),
    JobTime(name: 'فريلانسر', imagePath: 'assets/images/profile_icons/jobTime_icon/freelancer.jpg'),
    JobTime(name: 'أعمال حرة', imagePath: 'assets/images/profile_icons/jobTime_icon/others.jpg'),
  ].obs;

  List<String> getSelectedJobTimes() {
    return jobTimes.where((jobTime) => jobTime.isSelected).map((jobTime) => jobTime.name).toList();
  }

  void toggleJobTimeSelection(int index, bool value) {
    jobTimes[index].isSelected = value;
    jobTimes.refresh();
  }
}


class JobTime {
  final String name;
  final String imagePath;
  bool isSelected;

  JobTime({
    required this.name,
    required this.imagePath,
    this.isSelected = false,
  });
}

