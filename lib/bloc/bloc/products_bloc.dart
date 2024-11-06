import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_appui/model/product_model.dart';
import 'package:meta/meta.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsLoadedEvent>(_productsLoadedEvent);
  }

  FutureOr<void> _productsLoadedEvent(
      ProductsLoadedEvent event, Emitter<ProductsState> emit) {
    try {
      List<ProductModel> products = [
        ProductModel(
            productImage: "assets/images/sony.png",
            name: "Sony WH-1000XM4",
            description:
                "Wireless Industry Leading Noise\nCanceling Overhead \nHeadphones",
            productheight: 150,
            price: "\$ 299.99"),
        ProductModel(
            productImage: "assets/images/beats2.png",
            name: "Sony WH-1000XM4",
            description:
                "Wireless Industry Leading Noise\nCanceling Overhead \nHeadphones",
            productheight: 100,
            price: "\$ 299.99"),
      ];

      final mobilesAccessories = [
        ProductModel(
            productImage: "assets/images/samsung.png",
            name: "Galaxy S21 Ultra",
            description:
                "Wireless Industry Leading Noise\nCanceling Overhead \nHeadphones",
            productheight: 100,
            price: "\$ 599.99"),
        ProductModel(
            productImage: "assets/images/charger.png",
            name: "Super Fast USB C",
            description:
                "Charger Kit compatible \nsamsung Note 10 20 plus / S21\n S21 Ultra",
            productheight: 100,
            price: "\$ 99.99"),
      ];

      emit(ProductLoaded(products, mobilesAccessories));
    } catch (e) {}
  }
}
