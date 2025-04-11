import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/services/auth/auth_services.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_textfield.dart';
import 'package:chat_app/widgets/square_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void userLogin(BuildContext context) async{
    
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(color: Colors.teal,));
    });

    final authService = AuthService();
    authService.loginService(context, emailController.text, passwordController.text);

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
                text: 'Login',
                onTap: () => userLogin(context),
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
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterScreen()));},
                        child: Text('Register now',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
