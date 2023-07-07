class Product {
  final String id,
      productName,
      productCode,
      image,
      unitPrice,
      quantity,
      totalPrice,
      createdDate;
  Product(this.id, this.productName, this.productCode, this.image,
      this.unitPrice, this.quantity, this.totalPrice, this.createdDate);
  factory Product.toJson(Map<String, dynamic> pFJ) {
    return Product(
        pFJ['_id'],
        pFJ['ProductName'],
        pFJ['ProductCode'],
        pFJ['Img'],
        pFJ['UnitPrice'],
        pFJ['Qty'],
        pFJ['TotalPrice'],
        pFJ['CreatedDate']);
  }
}
