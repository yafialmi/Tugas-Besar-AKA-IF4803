import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manajemen_gudang/colors/color.dart';
import 'package:manajemen_gudang/models/item.dart';

class DashboardController extends GetxController {
  final CollectionReference barangCollection = FirebaseFirestore.instance
      .collection('barang');
  RxList<ItemModel> barangList = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBarang();
  }

  Future getBarang() async {
    barangCollection.snapshots().listen((event) {
      barangList.value = event.docs
          .map((doc) => ItemModel.fromDocumentSnapshot(doc))
          .toList();
    });
  }

  // ===============================
  // 1️⃣ BUBBLE SORT ITERATIF
  // ===============================
  void sortKategoriIteratif() {
    final stopwatch = Stopwatch()..start();

    List<ItemModel> data = List.from(barangList);
    int n = data.length;

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (data[j].stok > data[j + 1].stok) {
          final temp = data[j];
          data[j] = data[j + 1];
          data[j + 1] = temp;
        }
      }
    }

    stopwatch.stop();
    Get.snackbar(
      "INFO!",
      "Waktu eksekusi algoritma iteratif: ${stopwatch.elapsedMicroseconds} ms",
      backgroundColor: AppColor.danger,
      colorText: AppColor.text,
      isDismissible: true,
      margin: EdgeInsets.all(12),
      snackPosition: SnackPosition.BOTTOM,
    );


    barangList.value = data;
  }

  // ===============================
  // 2️⃣ BUBBLE SORT REKURSIF
  // ===============================
  void sortKategoriRekursif() {
    final stopwatch = Stopwatch()..start();

    List<ItemModel> data = List.from(barangList);
    sortKategoriRekursifAsc(data, data.length);

    stopwatch.stop();
    Get.snackbar(
      "INFO!",
      "Waktu eksekusi algoritma rekursif: ${stopwatch.elapsedMicroseconds} ms",
      backgroundColor: AppColor.danger,
      colorText: AppColor.text,
      isDismissible: true,
      margin: EdgeInsets.all(12),
      snackPosition: SnackPosition.BOTTOM,
    );
    barangList.value = data;
  }

  void sortKategoriRekursifAsc(List<ItemModel> data, int n) {
    if (n <= 1) return;

    for (int i = 0; i < n - 1; i++) {
      if (data[i].nama.compareTo(data[i + 1].nama) > 0) {
        final temp = data[i];
        data[i] = data[i + 1];
        data[i + 1] = temp;
      }
    }

    sortKategoriRekursifAsc(data, n - 1);
  }
}
