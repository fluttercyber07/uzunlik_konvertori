import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzunlik_konvertori/pages/hajm_page.dart';
import 'package:uzunlik_konvertori/pages/soha_page.dart';
import 'package:uzunlik_konvertori/pages/uzunlik_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Birlik konverteri",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xff2EFF2E),
            padding: EdgeInsets.symmetric(horizontal: 20),
            dividerHeight: 1.5,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black.withOpacity(0.6),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(
                text: "Uzunlik",
              ),
              Tab(
                text: "Soha",
              ),
              Tab(
                text: "Hajm",
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: const TabBarView(
          children: [
            UzunlikPage(),
            SohaPage(),
            HajmPage(),
          ],
        ),
      ),
    );
  }
}
