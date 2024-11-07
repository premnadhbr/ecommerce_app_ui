import 'package:ecommerce_appui/bloc/bloc/products_bloc.dart';
import 'package:ecommerce_appui/model/product_model.dart';
import 'package:ecommerce_appui/screens/detailsedit_page.dart';
import 'package:ecommerce_appui/widgets/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(173, 168, 239, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<ProductsBloc>(context).add(ProductsLoadedEvent());
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.heart),
          ),
          IconButton(
            onPressed: () {
              
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EditProductScreen(product: product);
                },
              ));
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 250,
                                height: 300,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(175, 165, 183, 0.5),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              ClipOval(
                                child: Image.network(
                                  product.thumbnail,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ColoredContainer(
                                isSelected: false,
                                color: Colors.greenAccent,
                                image: product.images.first,
                              ),
                              const SizedBox(height: 10),
                              ColoredContainer(
                                isSelected: true,
                                color: Colors.blueAccent,
                                image: product.images.last,
                              ),
                              const SizedBox(height: 10),
                              ColoredContainer(
                                isSelected: false,
                                color: Colors.pinkAccent,
                                image: product.images.first,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("\$${product.price}",
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(39, 75, 191, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                    const SizedBox(height: 15),
                    Text(product.title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        )),
                    const SizedBox(height: 10),
                    Text("About the item",
                        style: GoogleFonts.aBeeZee(color: Colors.grey)),
                    const SizedBox(height: 15),
                    Text(
                      product.description,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(thickness: 0.35),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(68, 9, 88, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.shopping_cart,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text("ADD TO CART",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
