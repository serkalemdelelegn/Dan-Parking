// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:danparking/constants/constants.dart';
import 'package:danparking/homescreen.dart';
// import 'package:pinput/pinput.dart';

import 'models/UserModel.dart';

// ignore: camel_case_types
class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

// ignore: camel_case_types
class _Login_pageState extends State<Login_page> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedinuser = UserModel();

  Future SignIn() async {
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user!.uid)
    //     .get()
    //     .then((value)
    //  {
    // this.loggedinuser = UserModel.fromMap(value.data());
    print(loggedinuser.username);

    if (loggedinuser.password == _passwordController.text.trim()) {
      // Fluttertoast.showToast(
      //     msg: "LogedIn successfully",
      //     backgroundColor: Colors.white,
      //     textColor: Colors.green);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // Fluttertoast.showToast(
      //     msg: "Incorrect Password",
      //     backgroundColor: Colors.white,
      //     textColor: Colors.green);
    }

    setState(() {});
    // }
    // );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.asset('assets/Images/logo.png'),
                const SizedBox(height: 30),
                const Text(
                  'Welcome ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 35, color: blue),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("You Were Missed",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: blue)),
                const SizedBox(height: 25),
                Form(
                    key: _formkey,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _phoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Phone Number";
                                }

                                if (!(value.isEmpty) &&
                                    !RegExp(r"^[09]+[0-9]*$").hasMatch(value)) {
                                  return "Enter correct phone";
                                }
                                //return null;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: "Phone"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                if (!(value.isEmpty) && value.length < 6) {
                                  return "minimem password length required is 6";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "PassWord"),
                            ),
                          ),
                        ),
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: (() {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      }

                      SignIn();
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account ",
                      style:
                          TextStyle(color: golden, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Container(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _currentaddressController = TextEditingController();

  final _phoneController = TextEditingController();

  String text = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool checkpassword() {
    if (_passwordController.text.trim() == _repasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _repasswordController.dispose();
    _usernameController.dispose();
    _currentaddressController.dispose();

    _phoneController.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  AdduserDetails() async {
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // User? user = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel();

    // userModel.uid = user!.uid;

    userModel.username = _usernameController.text.trim();
    userModel.password = _passwordController.text.trim();
    userModel.currentaddress = _currentaddressController.text.trim();
    userModel.phone = _phoneController.text.trim();

    // await firebaseFirestore
    //     .collection("users")
    //     .doc(user.uid)
    //     .set(userModel.toMap());
    // Fluttertoast.showToast(
    //     msg: "Account created successfully",
    //     backgroundColor: Colors.white,
    //     textColor: Colors.green);
    print('user created succesfully');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.asset('assets/Images/logo.png'),
                const SizedBox(height: 30),
                GestureDetector(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.white,
                          boxShadow: [],
                        ),
                        child: const Icon(
                          Icons.person,
                          color: golden,
                          size: 80.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                        child: const Icon(
                          Icons.add_circle,
                          color: blue,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ImageUpload(
                    //               Userid:
                    //                   FirebaseAuth.instance.currentUser!.uid,
                    //             )));
                    print('upload image');
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                const Text("Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: blue)),
                const SizedBox(height: 25),
                Form(
                    key: _formkey,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter User Name";
                                }
                                if (!(value.isEmpty) && value.length < 4) {
                                  return "minimem username length required is 6";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "User name"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _currentaddressController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Current Address";
                                }
                                if (!(value.isEmpty) && value.length < 2) {
                                  return "minimem currentaddress length required is 6";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Current Address"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter phone";
                                }

                                if (!(value.isEmpty) &&
                                    !RegExp(r"^[09]+[0-9]*$").hasMatch(value)) {
                                  return "Enter correct phone";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: "Phone"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /*     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Email";
                                }

                                if (!(value.isEmpty) &&
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(value)) {
                                  return "Enter a valid email address";
                                }
                                //return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Email"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), */
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _repasswordController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                if (!(value.isEmpty) && value.length < 6) {
                                  return "minimem password length required is 6";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "PassWord"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                if (!(value.isEmpty) && value.length < 6) {
                                  return "minimem password length required is 6";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Re Enter Password"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ])),
                Text(text),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: (() {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      }

                      AdduserDetails();
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account ",
                      style:
                          TextStyle(color: golden, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login_page()));
                        },
                        child: Container(
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  color: golden,
                ),
                /*    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton(Buttons.Google, onPressed: () {
                      print('Signed with Google');
                    }),
                  ],
                ), */
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  color: golden,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton(Buttons.Email, mini: true, onPressed: () {
                      print('Signed with Email');
                    }),
                    SignInButton(Buttons.Facebook, mini: true, onPressed: () {
                      print('Signed with FaceBook');
                    }),
                    SignInButton(Buttons.LinkedIn, mini: true, onPressed: () {
                      print('Signed with Linkdin');
                    }),
                    SignInButton(Buttons.GitHub, mini: true, onPressed: () {
                      print('Signed with Github');
                    })
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}

class FirstSignUp extends StatefulWidget {
  const FirstSignUp({super.key});
  static String verificationcode = '';
  @override
  State<FirstSignUp> createState() => _FirstSignUpState();
}

class _FirstSignUpState extends State<FirstSignUp> {
  TextEditingController countryController = TextEditingController();
  var phone = '';

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+251";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/melalogo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: blue),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        phone = value;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: golden,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        //   await FirebaseAuth.instance.setSettings(
                        //     appVerificationDisabledForTesting: true);

                        /// remove are you robot
                        // await FirebaseAuth.instance.verifyPhoneNumber(
                        //   phoneNumber: '${countryController.text + phone}',
                        //   verificationCompleted:
                        //       (PhoneAuthCredential credential) {},
                        //   timeout: const Duration(seconds: 60),
                        //   verificationFailed: (FirebaseAuthException e) {},
                        //   codeSent: (String verificationId, int? resendToken) {
                        //     FirstSignUp.verificationcode = verificationId;
                        //     print(verificationId);
                        //   },
                        //   codeAutoRetrievalTimeout: (String verificationId) {},
                        // );
                      } catch (e) {
                        print('objec,t');
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Verify()));
                      // Navigator.pushNamed(context, '/');
                    },
                    child: const Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  // FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 56,
    //   height: 56,
    //   textStyle: TextStyle(
    //       fontSize: 20,
    //       color: Color.fromRGBO(30, 60, 87, 1),
    //       fontWeight: FontWeight.w600),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    // );

    // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    //   borderRadius: BorderRadius.circular(8),
    // );

    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     color: Color.fromRGBO(234, 239, 243, 1),
    //   ),
    // );
    var code = '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/melalogo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              // Pinput(
              //   length: 6,
              //   // defaultPinTheme: defaultPinTheme,
              //   // focusedPinTheme: focusedPinTheme,
              //   // submittedPinTheme: submittedPinTheme,
              //   onChanged: (value) {
              //     code = value;
              //   },
              //   showCursor: true,
              //   onCompleted: (pin) => print(pin),
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: golden,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        // PhoneAuthCredential credential =
                        //     PhoneAuthProvider.credential(
                        //         verificationId: FirstSignUp.verificationcode,
                        //         smsCode: code);

                        // Sign the user in (or link) with the credential
                        // await auth.signInWithCredential(credential);
                        // print(auth.currentUser!.uid);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_page()));
                      } catch (e) {
                        print(' verofgication not matched');
                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
