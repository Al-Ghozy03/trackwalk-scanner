import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/widget/customCheckBox.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  late String Username, password, url;
  Widget _buildLogo(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Container(
              height: width * 0.3,
              child: Image(
                image: AssetImage('assets/Mandalika.png'),
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }

  Widget _buildUrlRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.url,
        onChanged: (value) {
          setState(() {
            url = value;
          });
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: Icon(
              Iconsax.global,
              color: Colors.grey.shade300,
            ),
            labelText: 'URL'),
      ),
    );
  }

  Widget _buildUsernameRow() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            Username = value;
          });
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: Icon(
              Iconsax.user,
              color: Colors.grey.shade300,
            ),
            labelText: 'Username'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        
        keyboardType: TextInputType.text,
        obscureText: hidePassword,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: hidePassword
          
              ? IconButton(
                  onPressed: _togglePassword, icon: Icon(Icons.visibility_off))
              : IconButton(
                  onPressed: _togglePassword, icon: Icon(Icons.visibility)),
          
          hintText: "Password",
          border: InputBorder.none,
          prefixIcon: Icon(
            Iconsax.key,
            color: Colors.grey.shade300,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  void _togglePassword() {
    print(hidePassword);
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  Widget _buildRememberSettingButton() {
    return Padding(
      padding: const EdgeInsets.only(left:18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Custom_check(),
          TextButton(
            onPressed: () {},
            child: Text("Remember Settings"),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20, top: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 40,
                  fontFamily: "PopinSemi"),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 3),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                _buildUrlRow(),
                _buildUsernameRow(),
                _buildPasswordRow(),
                SizedBox(
                  height: height * 0.01,
                ),
                _buildRememberSettingButton(),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade900,
                      Colors.blue.shade800
                      // Color(0x00000002f80ed),
                      // Color(0x00000004E92),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(context),
                  _buildContainer(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
