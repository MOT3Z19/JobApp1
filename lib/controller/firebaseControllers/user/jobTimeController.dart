
import 'package:get/get.dart';

class JobTimeController extends GetxController {
  var jobTimes = <JobTime>[
    JobTime(name: 'متفرغ كلياً', imagePath: 'assets/images/profile_icons/jobTime_icon/half.jpg'),
    JobTime(name: 'مرتبط بدراسة', imagePath: 'assets/images/profile_icons/jobTime_icon/work.jpg'),
    JobTime(name: 'مرتبط بدوام جزئي', imagePath: 'assets/images/profile_icons/jobTime_icon/face.jpg'),
  ].obs;

  List<String> getSelectedJobTimes() {
    return jobTimes.where((jobTime) => jobTime.isSelected).map((jobTime) => jobTime.name).toList();
  }

  void toggleJobTimeSelection(JobTime jobTime) {
    jobTime.isSelected = !jobTime.isSelected;
    update();
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

