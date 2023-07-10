import 'package:flutter/material.dart';
import 'package:suitmedia_msib_test/src/screens/second_screen.dart';
import 'package:suitmedia_msib_test/src/utils/app_images.dart';
import 'package:suitmedia_msib_test/src/widgets/input_field.dart';

class FirstScreen extends StatelessWidget {
  static const String routeName = '/';

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController palindromeController = TextEditingController();

    void isPalindrome(String text) {
      final String textReversed =
          text.split('').reversed.join('').toLowerCase();
      if (text.toLowerCase() == textReversed) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text(
                "It's Palindrome",
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text(
                "Not Palindrome",
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      }
    }

    void onCheck() {
      if (formKey.currentState!.validate()) {
        isPalindrome(palindromeController.text);
      }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 33),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.bgGradient,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.icPhoto,
              width: 116,
              height: 116,
            ),
            const SizedBox(height: 51),
            Form(
              key: formKey,
              child: Column(
                children: [
                  InputField(
                    controller: nameController,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    controller: palindromeController,
                    hintText: "Palindrome",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => onCheck(),
                child: const Text(
                  "CHECK",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      SecondScreen.routeName,
                      arguments: nameController.text,
                    );
                  }
                },
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
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
