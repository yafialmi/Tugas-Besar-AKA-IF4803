import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manajemen_gudang/colors/color.dart';
import 'package:manajemen_gudang/controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          'Manajemen Barang',
          style: TextStyle(color: AppColor.text, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 8,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Obx(() {
              if (controller.barangList.isEmpty) {
                return const Center(child: Text("Daftar barang kosong!"));
              }
              return Column(
                children: [
                  FutureBuilder<int>(
                    future: controller.getTotalBarang(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("Loading...");
                      }
                      return Text(
                        "Total Barang: ${snapshot.data}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),

                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => controller.getBarang()
                            ..whenComplete(
                              () => Get.snackbar(
                                "INFO!",
                                "Data kembali semula",
                                backgroundColor: AppColor.danger,
                                colorText: AppColor.text,
                                isDismissible: true,
                                margin: EdgeInsets.all(12),
                                snackPosition: SnackPosition.BOTTOM,
                              ),
                            ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Default',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.sortKategoriIteratif(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Iteratif',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.sortKategoriRekursifWrapper(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Rekursif',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
            HeaderItems(),

            Obx(() {
              if (controller.barangList.isEmpty) {
                return const Center(child: Text("Daftar barang kosong!"));
              }
              return Expanded(child: ListItem(controller: controller));
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: AppColor.danger,
            child: Icon(Icons.delete, color: AppColor.text),
            onPressed: () {
              Get.defaultDialog(
                title: "INFORMASI",
                middleText: "Tindakan ini akan menghapus SEMUA data barang.",
                textConfirm: "YA, HAPUS",
                textCancel: "BATAL",
                confirmTextColor: AppColor.text,
                buttonColor: AppColor.danger,
                onConfirm: () {
                  Get.back();
                  controller.deleteAllBarang();
                },
              );
            },
          ),
          SizedBox(width: 25),
          FloatingActionButton(
            backgroundColor: AppColor.primary,
            child: Icon(Icons.add, color: AppColor.text),
            onPressed: () {
              Get.toNamed('/create');
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.controller});

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.barangList.length,
      itemBuilder: (context, index) {
        final item = controller.barangList[index];
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Card(
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              tileColor: Colors.white,
              enableFeedback: true,
              subtitle: Text("No.Barang: ${index + 1}"),
              title: Text(
                item.nama,
                style: TextStyle(color: AppColor.textBlack),
              ),
              trailing: Text(
                item.stok.toString(),
                style: TextStyle(color: AppColor.textBlack, fontSize: 18),
              ),
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          );
        }
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5);
      },
    );
  }
}

class HeaderItems extends StatelessWidget {
  const HeaderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nama Barang',
              style: TextStyle(color: AppColor.text, fontSize: 18),
            ),
            Text('Stok', style: TextStyle(color: AppColor.text, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
