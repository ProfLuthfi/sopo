// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginSimple extends StatefulWidget {
  const LoginSimple({Key? key}) : super(key: key);

  @override
  State<LoginSimple> createState() => _LoginSimpleState();
}

class _LoginSimpleState extends State<LoginSimple> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String _email = 'eimluthfi@gmail.com';
  String _password = '12345';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(context) {
    return Column(
      children: const [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("SOPO"),
        Text(
          "SOSIAL POST",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _inputField(context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
            controller: emailController,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            controller: passController,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Email : ${emailController.text}');
                print('Password : ${passController.text}');

                if (emailController.text == _email &&
                    passController.text == _password) {
                  print('Login Berhasil');
                  showCustomSnackBar(context, 'Login Berhasil', Colors.green);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else if (emailController.text != _email ||
                    passController.text != _password) {
                  print('Email or Password Invalid!');
                  showCustomSnackBar(
                      context, 'Email or Password Invalid', Colors.redAccent);
                }
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          )
        ],
      ),
    );
  }

  void showCustomSnackBar(
      BuildContext context, String message, Color backgroundColor) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50, // Menempatkan snackbar di paling atas
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
