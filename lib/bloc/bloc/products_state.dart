// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductLoaded extends ProductsState {
  final List<ProductModel> products;
  final List<ProductModel> mobilesAccessories;

  ProductLoaded(
    this.products,
    this.mobilesAccessories,
  );
}

