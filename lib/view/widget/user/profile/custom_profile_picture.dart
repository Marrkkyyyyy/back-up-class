import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomProfilePicture extends StatelessWidget {
  const CustomProfilePicture(
      {super.key, required this.profile, required this.name});
  final String profile;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 210,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.skyBlue,
          width: 5,
        ),
      ),
      child: ClipOval(
        child: profile == "null"
            ? CircleAvatar(
                backgroundColor: AppColor.mediumOrange,
                radius: 200,
                child: Text(
                  name.substring(0, 1),
                  style: const TextStyle(fontSize: 100, color: Colors.black54),
                ),
              )
            : CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl: profile,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.black26,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.black26,
                  ),
                ),
              ),
      ),
    );
  }
}
