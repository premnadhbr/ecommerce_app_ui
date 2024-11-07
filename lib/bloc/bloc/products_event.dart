part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsLoadedEvent extends ProductsEvent {}

final class ProductSelectedEvent extends ProductsEvent {
  final int id;

  ProductSelectedEvent({required this.id});
}

final class ProductUpdateButtonClicked extends ProductsEvent {
  final String title;
  final String price;
  final String details;
  final int id;

  ProductUpdateButtonClicked(
      {required this.title,
      required this.price,
      required this.details,
      required this.id});
}
