import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appLogo(),

              appTextField("Enter Email"),
              appTextField("Enter Password"),

              appButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 74, 20),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'go to list view test',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget appTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget appLogo() {
    return const Icon(
      Icons.home,
      size: 100,
      color: Color.fromARGB(255, 4, 67, 33),
    );
  }
}
