import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:mad2_browsepage/browse_page.dart';
import 'package:mad2_home/homepage.dart';
import 'package:mad2_browsepage/browse_page.dart';
import 'package:mad2_shop/shop_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  PageController pageController = PageController();

  @override
  void initState() {
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          /*title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _bottomBarController.openSheet(),
              child: const Text('Open sheet'),
            ),
            ElevatedButton(
              onPressed: () => _bottomBarController.closeSheet(),
              child: const Text('Close sheet'),
            ),
            ElevatedButton(
              onPressed: () => _bottomBarController.toggleSheet(),
              child: const Text('Toggle sheet'),
            ),
          ],
        ),*/
        ),*/
        extendBody: true,
        body: PageView(
          controller: pageController,
          children: [
            Container(child: HomePage()),
            Container(
              child: BrowsePage(),
            ),
            Container(
              child: ShopPage(),
            ),
            Text("Hello"),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomBarWithSheet(
            controller: _bottomBarController,
            mainActionButtonTheme: MainActionButtonTheme(
              color: Color(0xFF13C9B3),
            ),
            bottomBarTheme: const BottomBarTheme(
              heightOpened: 630,
              heightClosed: 67,
              mainButtonPosition: MainButtonPosition.middle,
              itemIconColor: Color.fromARGB(157, 46, 58, 89),
              itemIconSize: 27,
              itemTextStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10.0,
              ),
              selectedItemTextStyle: TextStyle(
                color: Color(0xFF2E3A59),
                fontSize: 10.0,
              ),
              selectedItemIconColor: Color(0xFF2E3A59),
              decoration: BoxDecoration(
                color: Color.fromRGBO(241, 244, 248, 1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
            ),
            onSelectItem: (index) => pageController.animateToPage(index,
                duration: const Duration(milliseconds: 1),
                curve: Curves.easeIn),
            sheetChild: Center(
              child: Text(
                "QR Code Scanner Functionality",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            items: const [
              BottomBarWithSheetItem(
                icon: Icons.home_filled,
              ),
              BottomBarWithSheetItem(
                icon: Icons.calendar_view_month_outlined,
              ),
              BottomBarWithSheetItem(
                icon: Icons.shopping_basket_outlined,
              ),
              BottomBarWithSheetItem(
                icon: Icons.explore,
              ),
            ],
          ),
        ));
  }
}
