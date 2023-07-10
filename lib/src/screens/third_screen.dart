import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_msib_test/src/models/user_model.dart';
import 'package:suitmedia_msib_test/src/services/user_service.dart';
import 'package:suitmedia_msib_test/src/utils/app_colors.dart';
import 'package:suitmedia_msib_test/src/utils/app_text_style.dart';
import 'package:suitmedia_msib_test/src/widgets/navbar.dart';

class ThirdScreen extends StatefulWidget {
  static const String routeName = '/third-screen';

  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int currentPage = 1;
  int? totalPage;

  final List<User> users = [];
  late ScrollController scrollController;

  Future<void> getUsers() async {
    try {
      final UserModel users = await fetchUsers(page: currentPage);
      setState(() {
        totalPage = users.totalPages;
        currentPage = users.page;

        if (currentPage <= totalPage!) {
          this.users.addAll(users.data);
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (currentPage < totalPage!) {
        currentPage++;
        getUsers();
      }
    }
  }

  @override
  void initState() {
    getUsers();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Third Screen"),
      body: SafeArea(
        child: Column(
          children: [
            users.isNotEmpty
                ? Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          users.clear();
                          currentPage = 1;
                        });

                        return getUsers();
                      },
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          var user = users[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                context,
                                "${user.firstName} ${user.lastName}",
                              );
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  user.avatar,
                                ),
                              ),
                              title: Text(
                                "${user.firstName} ${user.lastName}",
                                style: AppTextStyle.poppins.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                user.email,
                                style: AppTextStyle.poppins.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.textLightColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text(
                        "User Data is Empty",
                        style: AppTextStyle.poppins.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
