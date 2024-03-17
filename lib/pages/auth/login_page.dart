import 'package:dotted_line/dotted_line.dart';
import 'package:fl_speedcharge/helper/language_constant.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String verify = '';
  static String uName = '';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  // String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  late GoogleSignInAccount currentUser;

  // @override
  // void initState() {
  //   super.initState();
  //   _googleSignIn.onCurrentUserChanged.listen((account) {
  //     setState(() {
  //       currentUser = account!;
  //     });
  //     if (currentUser != null) {
  //       print(
  //           "User is already authenticated as ${currentUser}"); // ignore: avoid_print
  //     }
  //     _googleSignIn.signInSilently();
  //   });

  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the Google Authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      return await _auth.signInWithCredential(credential);
    }

    return null;
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> handleSignIn() async {
    // Trigger the Google Authentication flow
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      (error);
    } finally {
      if (_googleSignIn.currentUser != null) {
        ("User is already authenticated as ${_googleSignIn.currentUser}");
      }
    }
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            heightSpace10,
            Text(
              translation(context).login1,
              style: blackBold25,
              textAlign: TextAlign.center,
            ),
            heightSpace40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation(context).mobileNo,
                    style: blackSemiBold16,
                    textAlign: TextAlign.center,
                  ),
                  MyContainerWithChild(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {},
                      onInputValidated: (bool value) {
                        var phone = value ? number.phoneNumber : '';
                        (phone);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        trailingSpace: false,
                      ),
                      cursorColor: primaryColor,
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: blackSemiBold16,
                      initialValue: number,
                      textFieldController: _phoneNumberController,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(),
                      inputBorder: InputBorder.none,
                      onSaved: (PhoneNumber number) {
                        ('On Saved: $number');
                      },
                      hintText: translation(context).enterMobileNo,
                      spaceBetweenSelectorAndTextField: 5,
                      textStyle: dashLineSemiBold16,
                    ),
                  ),
                  Text(
                    translation(context).weAreSending,
                    style: redSemiBold16,
                  ),
                  heightSpace50,
                  PrimaryButton(
                    title: translation(context).login1,
                    onTap: () async {
                      ('Phone number: ${_phoneNumberController.text}');
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${_phoneNumberController.text}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {
                          ('Error message: ${e.message}');
                        },
                        codeSent: (verificationId, int? resendToken) {
                          LoginPage.verify = verificationId;
                          Navigator.pushNamed(context, '/RegisterPage', arguments: {
                            'phone': _phoneNumberController.text,
                          });
                        },
                        codeAutoRetrievalTimeout: (verificationId) {},
                      );
                    },
                  ),
                  heightSpace50,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const DottedLine(
                        lineThickness: 2,
                        dashColor: dashLineColor,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: const Color(0xffFFFFFF),
                        child: Text(translation(context).orLogin),
                      ),
                    ],
                  ),
                  heightSpace40,
                  Row(
                    children: [
                      widthSpace5,
                      Expanded(
                        child: SizedBox(
                          width: 130,
                          height: 60,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                              backgroundColor: const Color.fromARGB(255, 47, 70, 139),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(
                              Icons.arrow_circle_right,
                              size: 30,
                            ), // Add the required 'icon' argument here
                            label: Image.asset(google),
                            onPressed: () async {
                              Navigator.pushNamed(context, '/RegisterPage');
                              try {
                                final UserCredential? userCredential =
                                    await _signInWithGoogle();
                                if (userCredential != null) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                      context, '/BottomNavigation');
                                }
                              } catch (error) {
                                ("Error during Google Sign-In: $error");
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  heightSpace20
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly',
// ]);
