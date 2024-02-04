import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class DrugItem {
  final int id;
  final int DrugCategoryID;
  final String name;
  final String description;
  final int quantity;
  DrugItem({
    required this.id,
    required this.DrugCategoryID,
    required this.name,
    required this.description,
    required this.quantity,
  });

  DrugItem copyWith({
    int? id,
    int? DrugCategoryID,
    String? name,
    String? description,
    int? quantity,
  }) {
    return DrugItem(
      id: id ?? this.id,
      DrugCategoryID: DrugCategoryID ?? this.DrugCategoryID,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'DrugCategoryID': DrugCategoryID,
      'name': name,
      'description': description,
      'quantity': quantity,
    };
  }

  factory DrugItem.fromMap(Map<String, dynamic> map) {
    return DrugItem(
      id: map['id'] as int,
      DrugCategoryID: map['DrugCategoryID'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DrugItem.fromJson(String source) =>
      DrugItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DrugItem(id: $id, DrugCategoryID: $DrugCategoryID, name: $name, description: $description, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant DrugItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.DrugCategoryID == DrugCategoryID &&
        other.name == name &&
        other.description == description &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        DrugCategoryID.hashCode ^
        name.hashCode ^
        description.hashCode ^
        quantity.hashCode;
  }
}
