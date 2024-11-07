// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductError extends ProductsState {
  final String message;

  ProductError({required this.message});
}

class ProductLoaded extends ProductsState {
  final List<Product> products;

  ProductLoaded(
    this.products,
  );
}

final class ProductDetails extends ProductsState {
  final Product product;

  ProductDetails({required this.product});
}

final class ProductUpdateDoneState extends ProductsState{}