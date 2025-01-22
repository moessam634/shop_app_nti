import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      required this.description,
      required this.rate});

  final String image;
  final String price;
  final String title;
  final String description;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeApp.s60),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500, // Subtle shadow
                  blurRadius: 6,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(SizeApp.s60.r)),
              child: Card(
                color: Colors.white,
                child: Image.network(image),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeApp.s16.h, horizontal: SizeApp.s16.w),
            child: Column(
              spacing: SizeApp.s8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\$ $price", style: redBold30()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: blackBold20(),
                      ),
                    ),
                    Row(
                      children: [
                        Text(rate, style: blackBold20()),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  StringApp.description,
                  style: blackBold26(),
                ),
                Text(description, style: grey20()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
