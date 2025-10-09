import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  final myController = TextEditingController(); // input func
  String? name;
  bool _obscurePassword = true;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  //text input
  @override
  void dispose() {
    // clear after dispose
    myController.dispose();
    super.dispose();
  }

  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile picture with edit button
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      child: _profileImage == null
                          ? const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: InkWell(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // input fields
              TextField(
                controller: myController,
                onChanged: (value) => name = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Jeremiah F. Alfred",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              // Text(name!),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: "jeremiah.alfred",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              const SizedBox(height: 12),
              // TextField(
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(
              //     hintText: "+231 770 000 000",
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     labelText: 'Phone Number',
              //     prefixIcon: Icon(Icons.phone),
              //   ),
              // ),
              IntlPhoneField(
                languageCode: 'en',
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "770 000 000",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Phone Number',
                  suffixIcon: Icon(Icons.phone),
                ),
                initialCountryCode: 'LR', // default country
                onChanged: (phone) {
                  print(phone.completeNumber); // e.g. +12025550123
                },
                onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                readOnly: true, // user cannot type manually
                onTap: () => _selectDate(context), // open date picker on tap
              ),
              const SizedBox(height: 12),
              TextField(
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "jeremiah.alfred@gtbank.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Update Button
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
                  onPressed: () {
                    setState(() {
                      print(Text(myController.text));
                    });
      
                    // ✅ Navigate to HomePage after login
                    Navigator.pushReplacementNamed(context, '/home');
      
                    // TODO: Add save logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile saved ✅")),
                    );
                  },
      
                  child: const Text(
                    "Update Profile",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
