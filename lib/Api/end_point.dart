class EndPoint {
  static const baseUrl = 'http://restapi.adequateshop.com';

  static const login = baseUrl + '/api/authaccount/login';

  static const categories = 'https://fakestoreapi.com/products/categories';

  static getProducts(String? category) =>
      'https://fakestoreapi.com/products/category/$category';
}
