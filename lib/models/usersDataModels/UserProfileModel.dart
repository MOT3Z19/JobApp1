
import 'ExperienceModel.dart';

class Profile {
  final String? fullname;
  final String? bornPlace;
  final String? bornDate;
  final String? stutasMarr;
  final String? phoneNumber;
  final String? email;
  final String? money;
  final String? gender;
  final String? OpentoWork;
  final String? OntheWork;
  final String? WorkPlace;
  final String? Transfar;
  final String? Language;
  final String? Skills;
  final String? showedProfile;
 List<String> selectedJobTypes;
 List<String>? selectedJobTimes;
   List<Experience>? experiences;
  final String? educationLevel;
  final String? university;
  final String? college;
  final String? graduationDate;
  final String? evaluation;
  final String? nameCourse;
  final String? typeCourse;
  final String? timeCourse;
  final String? AgnecyCoutse;
   List<String?>? portfolioImages;
  final String profileImage;
  final String? videoUrl;
  final String? cvText;

  Profile({
    required this.fullname,
    required this.bornPlace,
    required this.bornDate,
    required this.stutasMarr,
    required this.phoneNumber,
    required this.email,
    required this.money,
    required this.gender,
    required this.OpentoWork,
    required this.OntheWork,
    required this.WorkPlace,
    required this.Transfar,
    required this.Language,
    required this.Skills,
    required this.showedProfile,
   required this.selectedJobTypes,
    this.selectedJobTimes,
     this.experiences,
    required this.educationLevel,
    required this.university,
    required this.college,
    required this.graduationDate,
    required this.evaluation,
    required this.nameCourse,
    required this.timeCourse,
    required this.typeCourse,
    required this.AgnecyCoutse,
     this.portfolioImages,
    required this.profileImage,
    required this.videoUrl,
    required this.cvText
  });
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      fullname: map['fullname'],
      bornPlace: map['bornPlace'],
      bornDate: map['bornDate'],
      stutasMarr: map['stutasMarr'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      money: map['money'],
      gender: map['gender'],
      OpentoWork: map['OpentoWork'],
      OntheWork: map['OntheWork'],
      WorkPlace: map['WorkPlace'],
      Transfar: map['Transfar'],
      Language: map['Language'],
      Skills: map['Skills'],
      showedProfile: map['showedProfile'],
    //   selectedJobTypes: map['selectedJobTypes'],
    //  selectedJobTimes: map['selectedJobTimes'],
      //experiences: map['experiences'],
      educationLevel: map['educationLevel'],
      university: map['university'],
      college: map['college'],
      graduationDate: map['graduationDate'],
      evaluation: map['evaluation'],
      nameCourse: map['nameCourse'],
      timeCourse: map['timeCourse'],
      typeCourse: map['typeCourse'],
      AgnecyCoutse: map['AgnecyCoutse'],
     // portfolioImages: map['portfolioImages'],
      profileImage: map['profileImage'],
      videoUrl: map['videoUrl'],
      cvText: map['cvText'],
      selectedJobTypes: ['selectedJobTypes'],

    );
  }


}