import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/models/food_model.dart';
import '../routes/app_pages.dart';
import '../modules/home/controllers/home_controller.dart';

class HomeSearchDelegate extends SearchDelegate {
  HomeSearchDelegate(this.controller);
  final HomeController controller;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<List<Food>>(
      stream: controller.searchFood(query),
      builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data;
                  if (data == null) {
                    return const SizedBox();
                  } else if (data[index].nama.toLowerCase().contains(
                        query.toLowerCase(),
                      )) {
                    return Card(
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        isThreeLine: true,
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_FOOD,
                              arguments: data[index]);
                        },
                        title: Text(
                          " ${snapshot.data?[index].nama}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingAll(5.r),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.r,
                                    vertical: 5.r,
                                  ),
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        color: Colors.white,
                                        size: 10.r,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "${snapshot.data?[index].waktuPembuatan.toString()} minutes",
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.r,
                                    vertical: 5.r,
                                  ),
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                      color: getColor(
                                          snapshot.data?[index].jenis ?? "")),
                                  child: Text(
                                    "${snapshot.data?[index].jenis}",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            5.verticalSpace,
                          ],
                        ).paddingAll(5.r),
                        trailing: Image(
                          image: CachedNetworkImageProvider(
                            snapshot.data?[index].images ?? "",
                          ),
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<List<Food>>(
      stream: controller.searchFood(query),
      builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data;
                  if (data == null) {
                    return const SizedBox();
                  } else if (data[index].nama.toLowerCase().contains(
                        query.toLowerCase(),
                      )) {
                    return Card(
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        isThreeLine: true,
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_FOOD,
                              arguments: data[index]);
                        },
                        title: Text(
                          " ${snapshot.data?[index].nama}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingAll(5.r),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.r,
                                    vertical: 5.r,
                                  ),
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        color: Colors.white,
                                        size: 10.r,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "${snapshot.data?[index].waktuPembuatan.toString()} minutes",
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.r,
                                    vertical: 5.r,
                                  ),
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                      color: getColor(
                                          snapshot.data?[index].jenis ?? "")),
                                  child: Text(
                                    "${snapshot.data?[index].jenis}",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            5.verticalSpace,
                          ],
                        ).paddingAll(5.r),
                        trailing: Image(
                          image: CachedNetworkImageProvider(
                            snapshot.data?[index].images ?? "",
                          ),
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
      },
    );
  }

  Color getColor(String jenis) {
    if (jenis == "Makanan") {
      return Colors.orange;
    } else if (jenis == "Minuman") {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
}
