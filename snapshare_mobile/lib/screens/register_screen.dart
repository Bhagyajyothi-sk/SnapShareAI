import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final AuthService authService =
      AuthService();

  final TextEditingController
      nameController =
      TextEditingController();

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  bool isLoading = false;

  Future<void> register() async {

    final name =
        nameController.text.trim();

    final email =
        emailController.text.trim();

    final password =
        passwordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text('Please fill all fields'),
        ),
      );

      return;
    }

    try {

      setState(() {
        isLoading = true;
      });

      final success =
          await authService.register(
        name: name,
        email: email,
        password: password,
      );

      setState(() {
        isLoading = false;
      });

      if (success) {

        ScaffoldMessenger.of(context)
            .showSnackBar(

          const SnackBar(
            content: Text(
              'Registration successful',
            ),
          ),
        );

        Navigator.pop(context);

      } else {

        ScaffoldMessenger.of(context)
            .showSnackBar(

          const SnackBar(
            content: Text(
              'Registration failed',
            ),
          ),
        );
      }

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  InputDecoration buildInputDecoration({

    required String hint,

    required IconData icon,
  }) {

    return InputDecoration(

      hintText: hint,

      prefixIcon: Icon(
        icon,
        color: Colors.grey.shade600,
      ),

      filled: true,

      fillColor: Colors.white,

      contentPadding:
          const EdgeInsets.symmetric(
        vertical: 22,
      ),

      border: OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(
          22,
        ),

        borderSide: BorderSide.none,
      ),

      enabledBorder:
          OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(
          22,
        ),

        borderSide: BorderSide(
          color:
              Colors.grey.shade200,
        ),
      ),

      focusedBorder:
          OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(
          22,
        ),

        borderSide: const BorderSide(
          color: Color(0xFF6366F1),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF8FAFC),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(
            24,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              Row(
                children: [

                  Container(

                    padding:
                        const EdgeInsets.all(
                      14,
                    ),

                    decoration: BoxDecoration(

                      gradient:
                          const LinearGradient(
                        colors: [

                          Color(
                            0xFF6366F1,
                          ),

                          Color(
                            0xFF8B5CF6,
                          ),
                        ],
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Text(
                    'SnapShare AI',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              const Text(
                'Create Account ✨',

                style: TextStyle(
                  fontSize: 40,
                  fontWeight:
                      FontWeight.bold,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                'Start using intelligent AI-powered automatic photo sharing.',

                style: TextStyle(
                  fontSize: 17,
                  color:
                      Colors.grey.shade600,

                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              Container(

                padding:
                    const EdgeInsets.all(
                  26,
                ),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    32,
                  ),

                  boxShadow: [

                    BoxShadow(
                      color: Colors
                          .black
                          .withOpacity(
                        0.04,
                      ),

                      blurRadius: 24,

                      offset:
                          const Offset(
                        0,
                        12,
                      ),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    TextField(
                      controller:
                          nameController,

                      decoration:
                          buildInputDecoration(
                        hint: 'Full Name',
                        icon: Icons.person,
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      controller:
                          emailController,

                      decoration:
                          buildInputDecoration(
                        hint: 'Email',
                        icon: Icons.email,
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      controller:
                          passwordController,

                      obscureText: true,

                      decoration:
                          buildInputDecoration(
                        hint: 'Password',
                        icon: Icons.lock,
                      ),
                    ),

                    const SizedBox(height: 30),

                    isLoading

                        ? const Center(
                            child:
                                CircularProgressIndicator(),
                          )

                        : PrimaryButton(
                            title: 'Create Account',
                            onPressed:
                                register,
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}