import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_appui/model/product_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsLoadedEvent>(_productsLoadedEvent);
    on<ProductSelectedEvent>(_productSelectedEvent);
    on<ProductUpdateButtonClicked>(_productUpdateButtonClicked);
  }

  FutureOr<void> _productsLoadedEvent(
      ProductsLoadedEvent event, Emitter<ProductsState> emit) async {
    try {
      final apiUrl = "https://dummyjson.com/products";
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        // Parse the list of products
        List<Product> products = (data['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();

        emit(ProductLoaded(products));
      } else {
        emit(ProductError(message: "Failed to load products"));
      }
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  FutureOr<void> _productSelectedEvent(
      ProductSelectedEvent event, Emitter<ProductsState> emit) async {
    try {
      final apiUrl = "https://dummyjson.com/products/${event.id}";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        Product product = Product.fromJson(data);

        emit(ProductDetails(product: product));
      } else {
        emit(ProductError(message: "Failed to load products"));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> _productUpdateButtonClicked(
      ProductUpdateButtonClicked event, Emitter<ProductsState> emit) async {
    final apiUrl = 'https://dummyjson.com/products/${event.id}';
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': event.title,
        'price': double.parse(event.price),
        'description': event.details,
      }),
    );

    if (response.statusCode == 200) {
      final updatedData = jsonDecode(response.body);
      Product updatedProduct = Product.fromJson(updatedData);
      print(updatedProduct.title);

      emit(ProductUpdateDoneState());
    } else {}
  }
}
