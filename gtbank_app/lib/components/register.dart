import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  static Widget _inputField(
    String hint,
    IconData icon, {
    bool obscure = false,
    TextInputType type = TextInputType.text,
    Widget? icons,
  }) {
    return TextField(
      obscureText: obscure,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: icons,
      ),
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const Icon(Icons.app_registration, size: 80, color: Colors.purple),
                const SizedBox(height: 20),
                const Text(
                  "Register Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // Full name
                RegisterScreen._inputField("Full name", Icons.person_outlined),
                const SizedBox(height: 15),

                // Username
                RegisterScreen._inputField("Username", Icons.person_outlined),
                const SizedBox(height: 15),

                // Email
                RegisterScreen._inputField(
                  "Email",
                  Icons.email_outlined,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),

                // Phone
                RegisterScreen._inputField(
                  "Phone",
                  Icons.phone,
                  type: TextInputType.phone,
                ),
                const SizedBox(height: 15),

                // Password
                RegisterScreen._inputField(
                  "Password",
                  Icons.lock_outline,
                  obscure: _obscurePassword,
                  icons: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // confirm Password
                RegisterScreen._inputField(
                  "Confirm password",
                  Icons.lock_outline,
                  obscure: _obscurePassword,
                  icons: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Register Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Colors.deepOrangeAccent, Colors.blue],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Back to login
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
