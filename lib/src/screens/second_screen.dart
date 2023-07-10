import 'package:flutter/material.dart';
import 'package:suitmedia_msib_test/src/screens/third_screen.dart';
import 'package:suitmedia_msib_test/src/utils/app_text_style.dart';
import 'package:suitmedia_msib_test/src/widgets/navbar.dart';

class SecondScreen extends StatefulWidget {
  static const String routeName = '/second-screen';
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedName;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: const Navbar(title: "Second Screen"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: AppTextStyle.poppins.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          args.toString(),
                          style: AppTextStyle.poppins.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        selectedName ?? "No User Selected",
                        style: AppTextStyle.poppins.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          ThirdScreen.routeName,
                        ).then(
                          (value) => setState(
                            () => selectedName = value.toString(),
                          ),
                        ),
                        child: Text(
                          "Choose a User",
                          style: AppTextStyle.poppins.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
