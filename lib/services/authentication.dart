import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection("users");

String name;
String email;
String imageUrl;
String phone;
String userId;
String address;
String errorMessageRegister;
String errorMessageLogin;
bool emailAccount;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    // assert(user.phoneNumber != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    phone = user.phoneNumber;

    // Only taking the first part of the name, i.e., First Name
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    CollectionReference users = firestore.collection("users");
    userId = user.uid;
    /**
     * Memfilter userId jika value userId sudah ada pada collection (pernah ditambahkan),
     * maka tidak perlu ditambahkan lagi
     */
    users.add({
      'username': name,
      'userId': _auth.currentUser.uid,
      'userEmail': email,
      'userNumber': phone,
    });
    print('signInWithGoogle succeeded: $user');
    return '$user';
  }
  return null;
}

Future<void> signUpWithEmail(String _username, String _email, String _password,
    String _phone, String _address) async {
  await Firebase.initializeApp();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  try {
    UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    User user = authResult.user;
    name = _username;
    email = _email;
    imageUrl =
        "https://www.seekpng.com/png/detail/41-410093_circled-user-icon-user-profile-icon-png.png";
    emailAccount = true;
    userId = user.uid;
    address = _address;

    //untuk menambahkan data user pada collection firestore
    users.add({
      'username': _username,
      'userId': _auth.currentUser.uid,
      'userEmail': _email,
      'userAddress': _address,
      'userNumber': _phone,
    });
    return user;

    // print(result);
  } on PlatformException catch (error) {
    var message = "Please Check Your Internet Connection ";
    if (error.message != null) {
      message = error.message;
    }
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.blue));
  } catch (error) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.blue));

    print(error);
  }
}

Future<User> signInWithEmailAndPassword(String _email, String _password) async {
  await Firebase.initializeApp();

  try {
    UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    final User user = authResult.user;

    //QuerySnapshot yang digunakan untuk mengambil data dari collection "users"
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("users").get();

    //melakukan penyeleksian data user dari collection "users" dengan melakukan perulangan
    userSnapShot.docs.forEach(
      (data) {
        //ketika data sesi uid yang digunakan bernilai sama dengan nilai dari field userId dari collection "users"
        if (user.uid == data["userId"]) {
          //maka variabel nama bernilai username dimana yang userId hasil dari seleksi
          name = data["username"];
        }
      },
    );
    email = _email;
    imageUrl =
        "https://www.seekpng.com/png/detail/41-410093_circled-user-icon-user-profile-icon-png.png";
    userId = user.uid;
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<void> signOutEmailAccount() async {
  await _auth.signOut();
  print("User with Email Account Signed Out");
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Signed Out");
}
