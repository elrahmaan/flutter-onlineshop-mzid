import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/services/authentication.dart';

int totalOrder;

Future<void> addProductToCart(
    String productId,
    String productName,
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
    'productPrice': productPrice,
    'productImg': productImg,
    'productSize': productSize,
    'productQty': productQty,
    'productCost': productCost,
  };

  String orderCollection = "Order " + levelOrder.toString();
  carts.doc(userId).collection(orderCollection).add(itemCart);

  print("Product " + productId + " succesfully added to cart by " + userId);

  /**
   * menghitung total keseluruhan dari produk yang ditambahkan ke keranjang
   */
  int total = 0;
  QuerySnapshot snapShot =
      await carts.doc(userId).collection(orderCollection).get();

  snapShot.docs.forEach(
    (data) {
      total = total + data["productPrice"];
    },
  );
  // totalCart = total;
  carts.doc(userId).set({
    "userId": userId,
    "userName": name,
    "userEmail": email,
    "currentTotalOrder": total
  });
  setTotalOrder();
  print("total " + total.toString());
}

Future<void> setTotalOrder() async {
  CollectionReference carts = FirebaseFirestore.instance.collection("carts");
  QuerySnapshot snapShot = await carts.where("userId", isEqualTo: userId).get();
  snapShot.docs.forEach(
    (data) {
      totalOrder = data["currentTotalOrder"];
    },
  );
}
