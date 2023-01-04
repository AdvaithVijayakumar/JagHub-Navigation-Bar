import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:mad2_browsepage/browse_page.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
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
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
          Container(color: Colors.red),
        ],
      ),
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          itemIconColor: Colors.grey,
          itemTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 10.0,
          ),
        ),
        onSelectItem: (index) => pageController.animateToPage(index,
            duration: const Duration(milliseconds: 1000), curve: Curves.easeIn),
        sheetChild: Center(
          child: Text(
            "QR Code Scanner Functionality",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.home, label: 'Home'),
          BottomBarWithSheetItem(icon: Icons.search, label: 'Search'),
          BottomBarWithSheetItem(icon: Icons.leaderboard, label: 'Leaderboard'),
          BottomBarWithSheetItem(icon: Icons.explore, label: 'Explore'),
        ],
      ),
    );
  }
}
