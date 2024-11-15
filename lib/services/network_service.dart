import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/constants.dart';
import '../models/product.dart';
import '../models/cart.dart';

class NetworkService {
  final String _baseUrl = Constants.apiUrl;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token');
  }

  // GET products
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products/'));

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // GET cart
  Future<List<Cart>> fetchCarts() async {
    final response = await http.get(Uri.parse('$_baseUrl/carts/'));

    if (response.statusCode == 200) {
      final List<dynamic> cartJson = json.decode(response.body);
      return cartJson.map((json) => Cart.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load carts');
    }
  }

  // SignIn
  Future<void> storeTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/token/'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access'];
      final refreshToken = data['refresh'];
      await storeTokens(accessToken, refreshToken);
      return accessToken;
    } else {
      throw Exception('Failed to login');
    }
  }
}
