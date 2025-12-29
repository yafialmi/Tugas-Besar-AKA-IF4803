import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manajemen_gudang/colors/color.dart';
import 'package:manajemen_gudang/models/item.dart';

class DashboardController extends GetxController {
  final CollectionReference barangCollection = FirebaseFirestore.instance
      .collection('barang');
  RxList<ItemModel> barangList = <ItemModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getBarang();
  }

  Future getBarang() async {
    try {
      isLoading.value = true;
      barangCollection.snapshots().listen((event) {
        barangList.value = event.docs
            .map((doc) => ItemModel.fromDocumentSnapshot(doc))
            .toList();
      });
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading.value = false;
    }
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
  void sortKategoriRekursifWrapper() {
    final stopwatch = Stopwatch()..start();

    List<ItemModel> data = List.from(barangList);
    sortKategoriRekursif(data, data.length);

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

  void sortKategoriRekursif(List<ItemModel> data, int n) {
    if (n <= 1) return;

    for (int i = 0; i < n - 1; i++) {
      if (data[i].stok > data[i + 1].stok) {
        final temp = data[i];
        data[i] = data[i + 1];
        data[i + 1] = temp;
      }
    }

    sortKategoriRekursif(data, n - 1);
  }

  Future<void> deleteAllBarang() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collection = firestore.collection('barang');

      final snapshot = await collection.get();

      if (snapshot.docs.isEmpty) {
        Get.snackbar(
          "Info",
          "Tidak ada data untuk dihapus",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final batch = firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();

      barangList.clear();

      Get.snackbar(
        "Berhasil",
        "Semua data barang berhasil dihapus",
        backgroundColor: AppColor.success,
        colorText: AppColor.text,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      Get.snackbar(
        "Gagal",
        e.toString(),
        backgroundColor: AppColor.danger,
        colorText: AppColor.text,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(12),
      );
    }
  }

  Future<int> getTotalBarang() async {
    final aggregateQuery = await FirebaseFirestore.instance
        .collection('barang')
        .count()
        .get();

    return aggregateQuery.count!;
  }
}
