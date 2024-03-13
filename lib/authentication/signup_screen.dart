import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uberdriverapp/authentication/login_screen.dart';
import 'package:uberdriverapp/methods/common_methods.dart';
import 'package:uberdriverapp/pages/dashboard.dart';
import 'package:uberdriverapp/widgets/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController vehicleNameTextEditingController = TextEditingController();
  TextEditingController vehicleColorTextEditingController = TextEditingController();
  TextEditingController vehicleNumberTextEditingController = TextEditingController();
  TextEditingController driverLicenseNumberTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIsInternetAvailable() {
    cMethods.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/avatarman.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: ()
                {
                  chooseImageFromGallery();
                },
                child: const Text(
                  "Select Image",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Your Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Your E-mail",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: phoneNumberTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Your Phone Number",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        prefixText: "+880 ", // Add the desired prefix
                        prefixStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "Your Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: vehicleNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Car Model Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: vehicleColorTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Car Color",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: vehicleNumberTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Car Number Plate No",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: driverLicenseNumberTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Your License Number",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        checkIsInternetAvailable();
                        checkInfoValidation();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 10,
                          )),
                      child: const Text("Sign Up"),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const LogInScreen()));
                },
                child: const Text(
                  "Already have an account? Login Here",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkInfoValidation() {
    // ignore: prefer_interpolation_to_compose_strings
    if (userNameTextEditingController.text.trim().length < 3) {
      cMethods.displaySnackBar("Username must be 4 letter", context);
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(emailTextEditingController.text.trim())) {
      cMethods.displaySnackBar("Enter valid email address", context);
    } else if (phoneNumberTextEditingController.text.trim().length < 10) {
      cMethods.displaySnackBar("Phone number must be 11 digit", context);
    } else if (passwordTextEditingController.text.trim().length < 5) {
      cMethods.displaySnackBar("Password must be 6 characters", context);
    } else if (!passwordTextEditingController.text
        .trim()
        .contains(RegExp(r'[A-Z]'))) {
      cMethods.displaySnackBar("Must use Uppercase", context);
    } else if (!passwordTextEditingController.text
        .trim()
        .contains(RegExp(r'[a-z]'))) {
      cMethods.displaySnackBar("Must use Lowercase", context);
    } else if (!passwordTextEditingController.text
        .trim()
        .contains(RegExp(r'[0-9]'))) {
      cMethods.displaySnackBar("Must use Digit", context);
    } else if (!passwordTextEditingController.text
        .trim()
        .contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      cMethods.displaySnackBar("Must use Special Character", context);
    } else {
      registerUser();
    }
  }

  void registerUser() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            const LoadingDialog(messageText: "Registering your account.."),
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      );

      final User? userFirebase = userCredential.user;

      if (userFirebase == null) {
        cMethods.displaySnackBar("User registration failed.", context);
        return;
      }

      Navigator.pop(context);

      DatabaseReference usersRef = FirebaseDatabase.instance
          .ref()
          .child("drivers")
          .child(userFirebase.uid);
      Map userDataMap = {
        "name": userNameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": "0" + phoneNumberTextEditingController.text.trim(),
        "id": userFirebase.uid,
        "blockStatus": "no",
      };

      usersRef.set(userDataMap);
      Navigator.push(context, MaterialPageRoute(builder: (c) => Dashboard()));
    } catch (error) {
      Navigator.pop(context); // Dismiss the loading dialog in case of an error
      cMethods.displaySnackBar("Error: $error", context);
    }

    /*  void registerUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          const LoadingDialog(messageText: "Registering your account.."),
    );

    final User? userFirebase = (
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((errorMsg) 
            {
              Navigator.pop(context);
              cMethods.displaySnackBar(errorMsg.toString(), context);
    })).user;

    if (!context.mounted) return;
    Navigator.pop(context);

    DatabaseReference usersRef =
        FirebaseDatabase.instance.ref().child("users").child(userFirebase!.uid);
    Map userDataMap = {
      "name": userNameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "phone": phoneNumberTextEditingController.text.trim(),
      "id": userFirebase.uid,
      "blockStatus": "no",
    };

    usersRef.set(userDataMap);
    Navigator.push(context, MaterialPageRoute(builder: (c) => HomePage()));
  } */
  }

  void chooseImageFromGallery() {

  }
}
