import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
import '../widgets/square_image.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register(BuildContext context) async{

    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator(color: Colors.teal,));
    });

    try {
      if(passwordController.text==confirmPasswordController.text) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      }

    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.teal,
              ),
              const SizedBox(height: 50,),
              const Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(color: Colors.black,fontSize: 16),
              ),
              const SizedBox(height: 24,),
              MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),
              MyTextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('Forget Password?',style: TextStyle(color: Colors.grey.shade600),),
                  ),
                ],
              ),
              MyButton(
                text: 'Register',
                onTap: () => register(context),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness:1,color: Colors.grey.shade400,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('or Continue With'),
                    ),
                    Expanded(child: Divider(thickness:1,color: Colors.grey.shade400,))
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareImage(imagePath: 'assets/images/google.png'),
                  SizedBox(width: 24,),
                  SquareImage(imagePath: 'assets/images/apple-logo.png')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
