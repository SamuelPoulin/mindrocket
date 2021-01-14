import 'package:flutter/material.dart';
import 'package:flutter_workshop/pages/mainPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 75,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mindrocket',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log in to Mindrocket',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username or email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).accentColor,
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
