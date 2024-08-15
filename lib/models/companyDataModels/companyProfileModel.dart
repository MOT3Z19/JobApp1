class ProfileCompany {
  final String companyName;
  final String companyAddress;
  final String establishmentDate;
  final String businessType;
  final String employeeCount;
  final String companyDescription;
  final String cvFileUrl;

  ProfileCompany({
    required this.companyName,
    required this.companyAddress,
    required this.establishmentDate,
    required this.businessType,
    required this.employeeCount,
    required this.companyDescription,
    required this.cvFileUrl,
  });

  factory ProfileCompany.fromMap(Map<String, dynamic> map) {
    return ProfileCompany(
      companyName: map['companyName'],
      companyAddress: map['companyAddress'],
      businessType: map['businessType'],
      employeeCount: map['employeeCount'],
      companyDescription: map['companyDescription'],
      cvFileUrl: map['cvFileUrl'],
      establishmentDate: map['establishmentDate'],
    );
  }
}
