import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/models/food_model.dart';

class HomeController extends GetxController {
  CollectionReference ref = FirebaseFirestore.instance.collection('food');

  final buttonText = [
    "All",
    "Makanan",
    "Minuman",
    "Kuah",
  ];

  final iconButton = [
    "assets/all.png",
    "assets/makanan.png",
    "assets/minuman.png",
    "assets/kuah.png",
  ];

  final selectedValueIndex = 0.obs;

  Stream<List<Food>> readRecipe(String jenis) {
    if (jenis != "All") {
      return ref.where('jenis', isEqualTo: jenis).snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Food.fromFirestore(doc)).toList());
    } else {
      return ref.snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Food.fromFirestore(doc)).toList());
    }
  }

  Stream<List<Food>> searchFood(String search) {
    return ref.where('nama', isGreaterThanOrEqualTo: search).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Food.fromFirestore(doc)).toList());
  }
}
