import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/services/authentication.dart';

int totalOrder;

Future<void> addProductToCart(
    String productId,
    String uid,
    String productName,
    int productPrice,
    String productImg,
    int productQty,
    int levelOrderUser) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference carts = firestore.collection("carts");
  var itemCart = {
    'productId': productId,
    'userId': uid,
    'productName': productName,
    'productPrice': productPrice,
    'productImg': productImg,
    'productQty': productQty,
    'productStatus': "cart"
  };

  String orderCollection = "Order " + levelOrder.toString();
  carts.doc(uid).collection(orderCollection).add(itemCart);

  print("Product " + productId + " succesfully added to cart by " + uid);

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
  carts.doc(uid).set({
    "userId": uid,
    "userName": name,
    "userEmail": email,
    "currentTotalOrder": total
  });
  setTotalOrder();
  print("total " + total.toString());
}

Future<void> setTotalOrder() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference carts = firestore.collection("carts");
  QuerySnapshot snapShot = await carts.where("userId", isEqualTo: userId).get();
  snapShot.docs.forEach(
    (data) {
      totalOrder = data["currentTotalOrder"];
    },
  );
}
