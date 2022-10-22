class SubCategory {
  SubCategory({
    required this.catID,
    required this.title,
    required this.status,
  });

  final String catID;
  final String title;
  final bool status;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sub_cat_id': catID,
      'title': title,
      'status': status,
    };
  }

  // ignore: sort_constructors_first
  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      catID: map['sub_cat_id'] ?? '',
      title: map['title'] ?? '',
      status: map['status'] ?? true,
    );
  }
}
