// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../models/porduct_models.dart';
import '../services/api_services.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.title});
  final String? title;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
  Widget build(
    BuildContext context,
  ) {
    var index =
        productmodel!.indexWhere((element) => element.title == widget.title);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body:  ProductModel == null || productmodel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                productmodel![index].image!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              productmodel![index].title!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              productmodel![index].description!,
              style: const TextStyle(
                fontSize: 20,
                
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                                const Text(
                  "Item Price",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${productmodel![index].price!}",
                  style: const TextStyle(
                    fontSize: 20,

                  ),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
