class ProductModel{
  final String title;
  final String description;
  final double cost;
  final String image;

  ProductModel(this.title, this.description, this.cost, this.image);

  static ProductModel fromJson(jsonData) {
    return ProductModel(
        jsonData['title'], 
        jsonData['description'], 
        double.parse(jsonData['cost']), 
        //jsonData['image']);
        "https://i.pinimg.com/736x/9f/f8/4c/9ff84cbbbf4950d61fb1fedd2e826ff9--good-morning-vase.jpg");
  }

}
