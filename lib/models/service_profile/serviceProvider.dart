class ServiceProfile {
  final String name;
  final String serviceType;
 // final String serviceDescription;
  final String serviceFee;
  final String workLocation;
  final String phoneNumber;
  final String imageUrl;

  ServiceProfile({
    required this.name,
    required this.serviceType,
    //required this.serviceDescription,
    required this.serviceFee,
    required this.workLocation,
    required this.phoneNumber,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'serviceType': serviceType,
     // 'serviceDescription': serviceDescription,
      'serviceFee': serviceFee,
      'workLocation': workLocation,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
    };
  }

  factory ServiceProfile.fromMap(Map<String, dynamic> map) {
    return ServiceProfile(
      name:  map['name']??'',
      serviceType: map['serviceType']??'',
    //  serviceDescription:  map['serviceDescription']??'',
      serviceFee:  map['serviceFee']??'',
      workLocation:  map['workLocation']??'',
      phoneNumber:  map['phoneNumber']??'',
      imageUrl:  map['imageUrl']??'',
    );
  }
}
