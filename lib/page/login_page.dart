import 'package:flutter/material.dart';
import 'package:reminderapps/page/homepage.dart';
import 'package:reminderapps/common/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[100],
          title: const Center(child: Text("Login Page")),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Icon(
                Icons.person,
                size: 100,
                color: Colors.blueAccent[100],
              ),
              TextFormField(
                validator: (val) {
                  if (!val.isValidEmail) return "Enter valid email";
                },
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (val) {
                  if (!val.isNotNull) return "Enter password";
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: _login,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      borderRadius: BorderRadius.circular(16)),
                  height: 50,
                  width: 100,
                  child: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
