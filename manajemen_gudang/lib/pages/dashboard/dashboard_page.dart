import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manajemen_gudang/colors/color.dart';
import 'package:manajemen_gudang/pages/dashboard/dashboard_controller.dart';
import 'package:manajemen_gudang/widgets/form.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Manajemen Barang Gudang',
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
            FormFieldWidgets(
              errorMessage: '',
              labelText: 'Cari Barang',
              hintText: 'Cari Barang',
              controller: TextEditingController(),
            ),
            HeaderItems(),
            Obx(() {
              if (controller.itemList.isEmpty) {
                return const Center(child: Text("Daftar bacaan kosong!"));
              }
              return Expanded(child: ListItem(controller: controller));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        child: Icon(Icons.add, color: AppColor.text),
        onPressed: () {
          Get.toNamed('/create');
        },
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
      itemCount: controller.itemList.length,
      itemBuilder: (context, index) {
        final item = controller.itemList[index];
        return Card(
          elevation: 4,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            tileColor: Colors.white,
            enableFeedback: true,
            title: Text(item.nama, style: TextStyle(color: AppColor.textBlack)),
            trailing: IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah kamu yakin ingin menghapus ${item.nama}?",
                  textConfirm: "Ya",
                  textCancel: "Tidak",
                  confirmTextColor: AppColor.text,
                  buttonColor: AppColor.primary,
                  onConfirm: () => controller.deleteItem(item.id),
                );
              },
              icon: Icon(Icons.delete, color: AppColor.danger),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColor.primary),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        );
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
            Text('Aksi', style: TextStyle(color: AppColor.text, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
