import 'package:get/get.dart';
import 'package:manajemen_gudang/models/item.dart';

class DashboardController extends GetxController {
  late final RxList<ItemModel> itemList = RxList([
    ItemModel(id: '1', nama: 'Laptop Dell', stok: '5'),
    ItemModel(id: '2', nama: 'Mouse Logitech', stok: '15'),
    ItemModel(id: '3', nama: 'Keyboard Mechanical', stok: '8'),
  ]);

  void deleteItem(String id) {
    itemList.removeWhere((item) => item.id == id);
  }
}
