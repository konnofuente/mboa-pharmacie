// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EquipmentItem {
  final int id;
  final int EquipementCategoryID;
  final String name;
  final String description;
  final int quantity;
  EquipmentItem({
    required this.id,
    required this.EquipementCategoryID,
    required this.name,
    required this.description,
    required this.quantity,
  });


  EquipmentItem copyWith({
    int? id,
    int? EquipementCategoryID,
    String? name,
    String? description,
    int? quantity,
  }) {
    return EquipmentItem(
      id: id ?? this.id,
      EquipementCategoryID: EquipementCategoryID ?? this.EquipementCategoryID,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'EquipementCategoryID': EquipementCategoryID,
      'name': name,
      'description': description,
      'quantity': quantity,
    };
  }

  factory EquipmentItem.fromMap(Map<String, dynamic> map) {
    return EquipmentItem(
      id: map['id'] as int,
      EquipementCategoryID: map['EquipementCategoryID'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentItem.fromJson(String source) => EquipmentItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EquipmentItem(id: $id, EquipementCategoryID: $EquipementCategoryID, name: $name, description: $description, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant EquipmentItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.EquipementCategoryID == EquipementCategoryID &&
      other.name == name &&
      other.description == description &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      EquipementCategoryID.hashCode ^
      name.hashCode ^
      description.hashCode ^
      quantity.hashCode;
  }
}
