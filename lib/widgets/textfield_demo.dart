import 'package:flutter/material.dart';
class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}
class _TextFieldDemoState extends State<TextFieldDemo> {
  bool isVisible = false;
  var mailController = TextEditingController();
  var passwordController = TextEditingController();

  void showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(milliseconds: 1000),
        )
    );
  }

  final FocusScopeNode focusScopeNode = FocusScopeNode();
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            if (!focusScopeNode.hasPrimaryFocus) {
              focusScopeNode.unfocus();
            }
          },
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Icon(Icons.account_circle,size: 128),
              const SizedBox(height: 24),
              TextField(
                controller: mailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: 'Email',
                  helperText: 'Enter your email',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: passwordController,
                obscureText: isVisible,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility)
                  ),
                  labelText: 'Password',
                  helperText: 'Enter your password',
                  border: const OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
                  onPressed: (){
                    String mail = mailController.text.trim();
                    String password = passwordController.text.trim();
                    if(mail == 'some@gmail.com' && password == '1234'){
                      showSnackBar('Authenticated');
                    }else{
                      mailController.clear();
                      passwordController.clear();
                      showSnackBar('Invalid Email or Password');
                    }
                  },
                  child: const Text('Sign In')
              )
            ],
          ),
        ),
      ),
    );
  }
}
