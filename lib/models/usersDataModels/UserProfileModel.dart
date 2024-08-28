import 'package:job_app/models/usersDataModels/Certificates.dart';
import 'package:job_app/models/usersDataModels/Edaction.dart';

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
  List<Edaction>? edaction;
  List<Certificates>? certificates;
  List<String?>? portfolioImages;
  final String profileImage;
  final String? videoUrl;
  final String? cvText;

  Profile(
      {required this.fullname,
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
        this.edaction,
        this.certificates,
        this.portfolioImages,
        required this.profileImage,
        required this.videoUrl,
        required this.cvText});

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
      selectedJobTypes: map['selectedJobTypes'],
      selectedJobTimes: map['selectedJobTimes'],
      experiences: map['experiences'],
      edaction: map['edaction'],
      certificates: map['certificates'],
      portfolioImages: map['portfolioImages'],
      profileImage: map['profileImage'],
      videoUrl: map['videoUrl'],
      cvText: map['cvText'],
    );
  }
}
