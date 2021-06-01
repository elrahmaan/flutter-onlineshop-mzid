import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:online_shop/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = "";
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign up With",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF45D1FD),
              height: 2,
            ),
          ),
          Text(
            "YOUR EMAIL",
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF45D1FD),
              height: 1,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: emailController,
            validator: (value) => EmailValidator.validate(value)
                ? null
                : "Please enter a valid email",
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Color(0xFF45D1FD),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF45D1FD),
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xFF45D1FD), width: 2),
                ),
                prefixIcon:
                    Icon(Icons.email_outlined, color: Color(0xFF45D1FD)),
                filled: true,
                fillColor: Color(0xFF1B5163),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                )),
            onChanged: (value) {},
          ),
          SizedBox(
            height: 16,
          ),
          //Password
          TextFormField(
            validator: (value) {
              // add your custom validation here.
              if (value.isEmpty) {
                return 'Empty Field, Please enter some text';
              }
            },
            controller: passwordController,
            keyboardType: TextInputType.text,
            obscureText: !passwordVisible,
            style: TextStyle(
                color: Color(0xFF45D1FD),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF45D1FD),
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xFF45D1FD), width: 2),
                ),
                prefixIcon: Icon(Icons.lock, color: Color(0xFF45D1FD)),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  child: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color:
                        passwordVisible ? Color(0xFF45D1FD) : Color(0xFFE6E6E6),
                  ),
                ),
                filled: true,
                fillColor: Color(0xFF1B5163),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                )),
            onChanged: (value) {},
          ),
          SizedBox(
            height: 24,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(errorMessageRegister != null ? errorMessageRegister : "",
          //         style: TextStyle(
          //             fontSize: 15,
          //             color: Colors.red,
          //             fontWeight: FontWeight.bold)),
          //   ],
          // ),
          Container(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }
              // await AuthServices.signUp(
              //         emailController.text, passwordController.text)
              //     .then((result) {
              //   if (result != null) {
              //     String email = result.email;
              //     String name = "User";
              //     String image =
              //         "https://pmbak.aknpacitan.ac.id/images/user.png";
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return Profile_Screen(
              //               email: email, name: name, image: image);
              //         },
              //       ),
              //     );
              //   }
              // });
              ,
              color: Color(0xFF45D1FD),
              elevation: 9.0,
              splashColor: Colors.blue[200],
              child: Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),

          Text(
            "or Sign up With",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF45D1FD),
              height: 1,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          IconButton(
            onPressed: () {
              // signInWithGoogle().then((result) {
              //   if (result != null) {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return Profile_Screen();
              //         },
              //       ),
              //     );
              //   }
              // });
            },
            icon: Icon(
              Entypo.google__with_circle,
              size: 40,
              color: Color(0xFF45D1FD),
            ),
          ),
        ],
      ),
    );
  }
}