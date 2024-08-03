class JobType {
  String name;
  bool isSelected;

  JobType({required this.name, required this.isSelected});

  Map<String, dynamic> toJson() => {
    'name': name,
    'isSelected': isSelected,
  };

  factory JobType.fromJson(Map<String, dynamic> json) => JobType(
    name: json['name'],
    isSelected: json['isSelected'],
  );
}
