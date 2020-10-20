import 'dart:async';
import 'package:flutter/material.dart';
import 'package:star_in_me_app/authentication/signup.dart';
import 'package:star_in_me_app/screens/thankyou_screen.dart';
import 'animations/fadeanimations.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:email_validator/email_validator.dart';
import 'forgot_password.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin fbLogin = new FacebookLogin();


class LoginPage extends StatefulWidget {
  static final String loginPageId = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  bool _isChecked = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String email, pass;

  bool _secureText = true;
  void toggle() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FadeAnimation(
            2.0,
            ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Center(
                              child: Text(
                            'Welcome Back',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Stay connected, be informed and keep',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                'inspiring.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            enableSuggestions: true,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter your Email ID";
                              } else if (!EmailValidator.validate(value)) {
                                return "Enter a Valid Email ID";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: passController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      toggle();
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black12,
                                  )),
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) =>
                                value.length < 6 ? 'Password too short.' : null,
                            onChanged: (value) {
                              pass = value;
                            },
                            obscureText: _secureText,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Checkbox(
                                  value: _isChecked,
                                  tristate: false,
                                  onChanged: (bool isChecked) {
                                    setState(() {
                                      _isChecked = isChecked;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Remember password',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                child: Text('Forgot Password? ',
                                    style: TextStyle(color: Colors.black38)),
                                onTap: () => Navigator.pushNamed(
                                    context, ForgotPassword.forgotPassword),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: RaisedButton(
                                splashColor: Colors.lightBlueAccent,
                                elevation: 10.0,
                                highlightElevation: 30.0,
                                child: const Text('LOGIN'),
                                color: Colors.deepPurple[500],
                                textColor: Colors.white,
                                onPressed: () async {
                                  bool isUser;
                                  UserCredential userCredential;
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    try {
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email: email, password: pass);
                                      print(user);
                                      if (user != null) {
                                        Navigator.pushNamed(
                                            context, ThankYou.thankYouPage);
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        isUser = false;
                                      }
                                      print('${e.code}');
                                    } catch (e) {
                                      print(e.toString());
                                    } finally {
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      if (!isUser) {
                                        Navigator.pushNamed(
                                            context, SignupPage.signUpPageId);
                                      }
                                    }
                                  }
                                },
                              )),
                          SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'No account? ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Material(
                                  color: Colors.white.withOpacity(0.0),
                                  child: InkWell(
                                    child: Text('Sign up now!',
                                        style: TextStyle(
                                            color: Colors.purple[700],
                                            fontSize: 15.0)),
                                    onTap: () => Navigator.pushNamed(
                                        context, SignupPage.signUpPageId),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text('Login with',
                                style: TextStyle(color: Colors.purple[700])),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 30.0,
                                  child: FittedBox(
                                    child: Image.asset(
                                      'images/linkedin_logo.png',
                                      height: 10.0,
                                      width: 10.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              GestureDetector(
                                onTap: () async {
                                  final user = await _signInWithGoogle();
                                  final snapShot = await _firestore.collection('users').doc(user.email).get();
                                  if(snapShot == null || !snapShot.exists){
                                    setState(() {
                                      googleSignIn.signOut();
                                      Navigator.pushReplacementNamed(context, SignupPage.signUpPageId);
                                    });

                                  }
                                  else{
                                    Navigator.pushReplacementNamed(context, ThankYou.thankYouPage,arguments: {'name':user.displayName});
                                  }
                                },
                                child: Container(
                                  height: 30.0,
                                  child: FittedBox(
                                    child: Image.asset(
                                      'images/google_logo.png',
                                      height: 10.0,
                                      width: 10.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              GestureDetector(
                                onTap: () {
                                  //TODO: generate a release key hash from developers.facebook.com for production
                                  facebookLogin(context).then((user) {
                                    if (user != null) {
                                      print('Logged in successfully.');
                                      print(user.displayName);
                                      Navigator.pushReplacementNamed(
                                          context, ThankYou.thankYouPage, arguments: {'name':user.displayName});
                                    } else {
                                      print('Error while Login.');
                                    }
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  child: FittedBox(
                                    child: Image.asset(
                                      'images/facebook_logo.png',
                                      height: 10.0,
                                      width: 10.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            )),
      ),
    );
  }
}

Future<User> _signInWithGoogle() async {
  bool isSignedIn = await googleSignIn.isSignedIn();
  print(isSignedIn);
  if (isSignedIn) {
    final user = _auth.currentUser;
    return user;
  } else {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final result = await _auth.signInWithCredential(credential);
    final User user = result.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = _auth.currentUser;
    assert(currentUser.uid == user.uid);

    print(currentUser.email);

    return user;
  }
}

Future<User> facebookLogin(BuildContext context) async {
  User currentUser;
  // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  // remove above comment then facebook login will take username and pasword for login in Webview
  try {
    final FacebookLoginResult facebookLoginResult =
    await fbLogin.logIn(['email', 'public_profile']);
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken facebookAccessToken =
          facebookLoginResult.accessToken;
      final AuthCredential credential = FacebookAuthProvider.getCredential(
           facebookAccessToken.token);
      final User user = (await _auth.signInWithCredential(credential)).user;
     assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      _firestore.collection("users").doc(currentUser.email).set({
        "name": currentUser.displayName, "email": currentUser.email
      });
      return currentUser;

    }
  } catch (e) {
    print(e);
  }
  return currentUser;
}