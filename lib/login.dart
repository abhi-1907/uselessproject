import 'package:flutter/material.dart';
import 'package:uselessproject/app.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFF6A1B9A)], // Deep purple gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "rAtE mE BuT wHyy???",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Italic', // Custom font
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 6,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'lib/assets/images/WhatsAppImage.jpeg',
                        width: screenWidth * 0.85,
                        height: screenWidth * 0.85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Leave a comment and let the chaos begin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto', // Use a standard font
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WholeApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.85),
                    shadowColor: Colors.black.withOpacity(0.3),
                  ),
                  child: Text(
                    "ENTER",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins', // Another custom font
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6A1B9A),
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

