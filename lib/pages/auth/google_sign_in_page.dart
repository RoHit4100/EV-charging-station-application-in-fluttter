import 'package:fl_speedcharge/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInPage extends StatefulWidget {
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  _GoogleSignInPage createState() => _GoogleSignInPage();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
]);

class _GoogleSignInPage extends State<GoogleSignInPage> {
  late GoogleSignInAccount currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        currentUser = account!;
      });
      if (currentUser != null) {
        print(
            "User is already authenticated as ${currentUser}"); // ignore: avoid_print
      }
      _googleSignIn.signInSilently();
    });
  }

  Future<void> handleSignIn() async {
    // Trigger the Google Authentication flow
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    } finally {
      if (_googleSignIn.currentUser != null) {
        print("User is already authenticated as ${_googleSignIn.currentUser}");
      }
    }
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
  }

  Widget buildBody(context) {
    GoogleSignInAccount user = currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          ElevatedButton(
            onPressed: handleSignOut,
            child: const Text('SIGN OUT'),
          ),
        ],
      );
    } else {
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: handleSignIn,
            child: const Text('SIGN IN'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: buildBody(context),
      ) 
    );
  }
}
