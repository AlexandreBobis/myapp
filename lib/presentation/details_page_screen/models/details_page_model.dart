  class DetailsPageModel {}

  class Product {
    final int? id;
    final String? image;
    final String? name;
    final String? dlc;
    final int? quantity;
    final String? category;
    final String? conservationConditions;

    Product({
      this.id,
      this.image,
      this.name,
      this.dlc,
      this.quantity,
      this.category,
      this.conservationConditions,
    });

    factory Product.fromJson(Map<String, dynamic> json) {
      return Product(
        id: json['id'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        dlc: json['dlc'] as String?,
        quantity: json['quantity'] as int?,
        category: json['category'] as String?,
        conservationConditions: json['conservation_conditions'] as String?,
      );
    }
  }