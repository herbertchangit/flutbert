import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutbert/Setup/signIn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email, _password, _confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _confirmPasswordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'),),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: (input) {
                    if(input!.isEmpty){
                      return 'Please keyin your email ';}
                    return null;
                  },
                  onSaved: (input) => _email = input!,
                  decoration: const InputDecoration(labelText: 'Email'
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (input) {
                    if(input!.length < 6) {
                      return  'Your password needs to be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (input) => _password = input!,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  validator: (input) {
                    if(input!.length < 6) {
                      return  'Your confirm password needs to be at least 6 characters';
                    }

                    return null;
                  },
                  onSaved: (input) => _confirmPassword = input!,
                  decoration: const InputDecoration(labelText: 'Confirm password'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    if(_emailController.text.isNotEmpty && _passwordController.text != _confirmPasswordController.text){
                      final snackBar = SnackBar(
                        content: Text('${_emailController.text} : password does not match.'),
                        action: SnackBarAction(label: 'Ok', onPressed: (){},),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else {
                      signUp();
                    }},
                  child: const Text('Sign Up'),
                )
              ],
            ),
          )
      ),
    );
  }

  void signUp() async {
    //todo validate fields
    final formState = _formKey.currentState;
    if(formState!.validate()){
      //todo login to firebase
      formState.save();
      try{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.user?.sendEmailVerification();
        if(!mounted) return;
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        debugPrint(e.toString());
      }
    }
  }
}
