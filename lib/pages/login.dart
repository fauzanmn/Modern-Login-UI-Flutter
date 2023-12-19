import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern_login_ui/components/alternative_login.dart';
import 'package:modern_login_ui/components/my_button.dart';
import 'package:modern_login_ui/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // controller textfield
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign in method
  void userSignIn() async {
    // // show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    // try to sign in
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    // // pop loading circle
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // icon
                const SizedBox(height: 5),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 40),
                // welcome back, you've been missed
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 25),
                // textfield username/email
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                  TextInputType: TextInputType.emailAddress,
                  TextInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                // textfield password
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                  TextInputType: TextInputType.text,
                  TextInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 10),
                // forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Button Sign in
                MyButton(
                  onTap: userSignIn,
                ),
                const SizedBox(height: 40),
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Or continue with",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // google & apple
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlternativeLogin(imagePath: "assets/images/google.png"),
                    SizedBox(width: 20),
                    AlternativeLogin(imagePath: "assets/images/apple.png"),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
                // not a member? register
              ],
            ),
          ),
        ),
      ),
    );
  }
}
