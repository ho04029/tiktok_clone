import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Text('user'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.gear, size: Sizes.size20),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                foregroundColor: Colors.blue,
                foregroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsv_pZL9XVHMiLKMnV89B1LauRL2t1nis-LeK96R_yOtlAjBF8s1LSpMJHVPoFFrq1wlg&usqp=CAU",
                ),
                child: Text("user"),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "user",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size16,
                    color: Colors.blue.shade500,
                  ),
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: Sizes.size48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "97",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          "following",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      color: Colors.grey.shade400,
                      indent: Sizes.size10,
                      endIndent: Sizes.size10,
                    ),
                    Column(
                      children: [
                        Text(
                          "10.5M",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          "followers",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      color: Colors.grey.shade400,
                      indent: Sizes.size10,
                      endIndent: Sizes.size10,
                    ),
                    Column(
                      children: [
                        Text(
                          "149.3M",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          "Likes",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.v14,
              FractionallySizedBox(
                widthFactor: 0.33,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.size12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.size4),
                    ),
                  ),
                  child: Text(
                    'follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Gaps.v14,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                child: Text("hmm...", textAlign: TextAlign.center),
              ),
              Gaps.v14,
              Row(
                children: [FaIcon(FontAwesomeIcons.link, size: Sizes.size18)],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
