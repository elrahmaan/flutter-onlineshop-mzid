import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/services/authentication.dart';

class Database {
  static Future<void> addProductToCart(
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

    carts.doc(uid).set({"userId": uid, "userName": name, "userEmail": email});
    String orderCollection = "Order " + levelOrder.toString();
    carts.doc(uid).collection(orderCollection).add(itemCart);
    print("Product " + productId + " succesfully added to cart by " + uid);
  }
}
