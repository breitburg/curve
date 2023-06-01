import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  runApp(const CurveApp());
}

class CurveApp extends StatelessWidget {
  const CurveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontSize: 13,
            color: CupertinoColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CurveSidebar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: CurveBrowserView(),
          ),
        ),
      ],
    );
  }
}

class CurveSidebar extends StatelessWidget {
  const CurveSidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      constraints: const BoxConstraints.tightFor(width: 228),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CurveAddressBar(),
                SizedBox(height: 8),
                CurveBookmarksBar(),
                SizedBox(height: 8),
                CurveBookmarksBar(),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              children: [
                ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.add,
                            size: 18,
                            color: CupertinoColors.systemGrey,
                          ),
                          SizedBox(width: 8),
                          Text('New Tab'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurveBookmarksBar extends StatelessWidget {
  const CurveBookmarksBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 4; i++) ...[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CupertinoColors.black.withOpacity(0.05),
                ),
              ),
            ),
          ),
          if (i < 3) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class CurveAddressBar extends StatelessWidget {
  const CurveAddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(height: 40),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.black.withOpacity(0.05),
      ),
      child: const Row(
        children: [
          Icon(
            CupertinoIcons.search,
            size: 16,
            color: CupertinoColors.systemGrey,
          ),
          SizedBox(width: 8),
          Expanded(
            child: CupertinoTextField.borderless(
              padding: EdgeInsets.zero,
              placeholder: 'Search or Enter URL...',
              placeholderStyle: TextStyle(color: CupertinoColors.systemGrey),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class CurveBrowserView extends StatelessWidget {
  const CurveBrowserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 2),
            color: CupertinoColors.black.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
