class ProfileCompany {
  String companyName;
  String companyAddress;
  String establishmentDate;
  String businessType;
  String employeeCount;
  String companyDescription;
  String cvFileUrl;
  bool visible;

  ProfileCompany({
    required this.companyName,
    required this.companyAddress,
    required this.establishmentDate,
    required this.businessType,
    required this.employeeCount,
    required this.companyDescription,
    required this.cvFileUrl,
    required this.visible,
  });

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'companyAddress': companyAddress,
      'establishmentDate': establishmentDate,
      'businessType': businessType,
      'employeeCount': employeeCount,
      'companyDescription': companyDescription,
      'cvFileUrl': cvFileUrl,
      'visible': visible,
    };
  }

  factory ProfileCompany.fromMap(Map<String, dynamic> map) {
    return ProfileCompany(
      companyName: map['companyName'],
      companyAddress: map['companyAddress'],
      businessType: map['businessType'],
      employeeCount: map['employeeCount'],
      companyDescription: map['companyDescription'],
      cvFileUrl: map['cvFileUrl']??'',
      establishmentDate: map['establishmentDate'],
      visible: map['visible'],
    );
  }
}
