import 'package:flutter/material.dart';

import 'frontpage.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => TabBarDemoState();
}

class TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
  List<Widget>tabs=[
    Frontpage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            // 1.Default Tabbar with full width tabbar indicator
            TabBar(
              controller: tabController,
              tabs: tabs,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              unselectedLabelColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.tab,
            ),



            // 10.Custom Tabbar with transparent selected bg and solid selected text
            TabBar(
              controller: tabController,
              tabs: tabs,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,

              indicator: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightBlue.withOpacity(0.6),
                    Colors.greenAccent.withOpacity(0.6)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.redAccent),
            ),
          ]
              .map((item) => Column(
            /// Added a divider after each item to let the tabbars have room to breathe
            children: [
              item,
              const Divider(
                color: Colors.transparent,
              )
            ],
          ))
              .toList(),
        ),
      ),
    );
  }
}

class MaterialDesignIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const MaterialDesignIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return MaterialDesignIndicatorPainter(
      indicatorHeight: indicatorHeight,
      indicatorColor: indicatorColor,
    );
  }
}

class MaterialDesignIndicatorPainter extends BoxPainter {
  final double indicatorHeight;
  final Color indicatorColor;

  MaterialDesignIndicatorPainter({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(
      offset.dx,
      (configuration.size!.height - indicatorHeight) + offset.dy,
    ) &
    Size(configuration.size!.width, indicatorHeight);
    final Paint paint = Paint()..color = indicatorColor;
    canvas.drawRect(rect, paint);
  }
}