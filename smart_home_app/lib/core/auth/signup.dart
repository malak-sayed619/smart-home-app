import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("sign up")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appLogo(),

              appTextField("Enter Username"),
              appTextField("Enter Email"),
              appTextField("Enter Password"),
              appTextField("Confirm Password"),

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
          child: Text('create account', style: TextStyle(color: Colors.white)),
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
      Icons.person_add,
      size: 100,
      color: Color.fromARGB(255, 4, 67, 33),
    );
  }
}
