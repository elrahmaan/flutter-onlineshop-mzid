import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/services/authentication.dart';

Future<void> addProductToCart(
    String productId,
    String productName,
    String productCategory,
    String productImg,
    String productSize,
    int productPrice,
    int productQty,
    int productCost) async {
  CollectionReference carts = FirebaseFirestore.instance.collection("carts");
  var itemCart = {
    'productId': productId,
    'userId': userId,
    'productName': productName,
    'productCategory': productCategory,
    'productPrice': productPrice,
    'productImg': productImg,
    'productSize': productSize,
    'productQty': productQty,
    'productCost': productCost,
  };

  String orderCollection = "Order " + levelOrder.toString();
  carts.doc(userId).collection(orderCollection).doc(productId).set(itemCart);

  print("Product " + productId + " succesfully added to cart by " + userId);

  carts.doc(userId).set({
    "userId": userId,
    "userName": name,
    "userEmail": email,
  });
}

Future<void> deleteItemCart(String productId) async {
  CollectionReference carts = FirebaseFirestore.instance.collection("carts");
  String orderCollection = "Order " + levelOrder.toString();

  //menghapus data produk
  carts.doc(userId).collection(orderCollection).doc(productId).delete();
  print("item deleted");
}

Future<void> updateItemCart(
    String productId, int productQty, int productPrice) {
  CollectionReference carts = FirebaseFirestore.instance.collection("carts");
  String orderCollection = "Order " + levelOrder.toString();
  int productCost = productQty * productPrice;
  var updateData = {
    'productQty': productQty,
    'productCost': productCost,
  };
  carts
      .doc(userId)
      .collection(orderCollection)
      .doc(productId)
      .update(updateData);
}
