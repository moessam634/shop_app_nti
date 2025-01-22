import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/feature/add_cart/cubit/add_cart_cubit.dart';

import '../../model/model/laptop_model.dart';

class LapCartBody extends StatelessWidget {
  const LapCartBody({
    super.key,
    required this.laptopModel,
  });

  final LaptopModel laptopModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              laptopModel.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Name and Company
          Text(
            laptopModel.name,
          ),
          const SizedBox(height: 8),
          Text(
            "By ${laptopModel.company}",
          ),
          const SizedBox(height: 16),
          // Price
          Text(
            "\$${laptopModel.price.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            "Description:",
          ),
          const SizedBox(height: 8),
          Text(
            laptopModel.description,
          ),
          const SizedBox(height: 16),
          // Category and Status
          Row(
            children: [
              Chip(
                label: Text(laptopModel.category),
                backgroundColor: Colors.blue.shade100,
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(laptopModel.status),
                backgroundColor: laptopModel.status == "Available"
                    ? Colors.green.shade100
                    : Colors.red.shade100,
              ),
              IconButton(onPressed: (){
                AddCartCubit.get(context).addCartData;
              }, icon: Icon(CupertinoIcons.cart))
            ],
          ),
          const SizedBox(height: 16),
          // Stock Information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Stock:",
              ),
              Text(
                laptopModel.countInStock > 0
                    ? "${laptopModel.countInStock} units available"
                    : "Out of stock",
                style: TextStyle(
                  color:
                      laptopModel.countInStock > 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
