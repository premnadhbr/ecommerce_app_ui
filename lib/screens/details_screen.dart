// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_appui/widgets/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_appui/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel product;
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(173, 168, 239, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.heart),
          ),
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
                                child: Image.asset(
                                  product.productImage,
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
                                image: product.productImage,
                              ),
                              const SizedBox(
                                  height: 10), // Small gap between items
                              ColoredContainer(
                                isSelected: true,
                                color: Colors.blueAccent,
                                image: product.productImage,
                              ),
                              const SizedBox(
                                  height: 10), // Small gap between items
                              ColoredContainer(
                                isSelected: false,
                                color: Colors.pinkAccent,
                                image: product.productImage,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(product.price,
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(39, 75, 191, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                    const SizedBox(height: 15),
                    Text(product.name,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        )),
                    const SizedBox(height: 10),
                    Text("About the item",
                        style: GoogleFonts.aBeeZee(color: Colors.grey)),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Chip(
                          elevation: 0,
                          side: BorderSide.none,
                          color: const WidgetStatePropertyAll(
                              Color.fromRGBO(237, 238, 254, 1)),
                          label: Text(
                            "Full specification",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Reviews",
                          style: GoogleFonts.aBeeZee(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Sony WH-1000XM4 Wireless Industry Leading Noise Canceling Overhead Headphones with Mic for Phone-Call and Alexa Voice Control, Black",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/map.jpg",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aghmashenebeli Ave 75",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "1 item is in the way",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 0.35,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
                    const SizedBox(
                      width: 10,
                    ),
                    Text("ADD TO CART",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
