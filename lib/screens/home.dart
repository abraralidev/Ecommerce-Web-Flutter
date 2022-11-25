// ignore_for_file: unused_element, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/porduct_models.dart';
import '../services/api_services.dart';
import 'DetailsScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<ProductModel>? productmodel = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      productmodel = (await ApiService().getproduct());
      Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {}));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Api'),
      ),
      body: ProductModel == null || productmodel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: productmodel!.length,
              // itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                productmodel![index].image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(productmodel![index].title!)),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Center(
                                    child: Text(
                                        "\$${productmodel![index].price}"))),
                            // Text(productmodel![index].rating.toString()),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(
                                    () => DetailsScreen(
                                      title: productmodel![index].title,
                                    ),
              
                                  );
                                },
                                child: const Text("Buy Now"))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
    );
  }
}
