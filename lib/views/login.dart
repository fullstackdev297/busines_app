import 'package:flutter/material.dart';
import 'package:cannicheck/views/forgot.dart';

import '../service/http_service.dart';
import 'navigation_home.dart';

class LoginPage extends StatefulWidget {
  final Function toggle;
  const LoginPage(this.toggle, {Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _validateEmail = false;
  bool _validatePassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading ? Center(child: CircularProgressIndicator()) : Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Login",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Image.asset(
                  "assets/images/logo.jpg",
                  height: 250,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                _validateEmail ? Text('Email Value Can\'t Be Empty', style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                _validatePassword ? Text('Password Value Can\'t Be Empty', style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ForgotPassword()));
                    },
                    child: Text(
                      "Forgot Password ? ",
                      style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
                    )),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    setState(() {
                      emailController.text.isEmpty ? _validateEmail = true
                          : _validateEmail = false;
                      passwordController.text.isEmpty ? _validatePassword = true
                          : _validatePassword = false;
                    });
                    if(_validateEmail == false && _validatePassword == false){
                      isLoading = !isLoading;
                      print(emailController.text);
                      print(passwordController.text);
                      var user = await HttpService().login(emailController.text, passwordController.text);
                      if(user != null){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationHome(user, widget.toggle)));
                      } else{
                        setState(() {
                          isLoading = !isLoading;
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Text(
                        "Sign Up ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

