import '../base/app_core.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> pages;

  final ValueNotifier<int> selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.pages,
  });

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.selectedIndex.value,
    );
    _tabController.addListener(() {
      widget.onTabChanged(_tabController.index);
    });
    widget.selectedIndex.addListener(() {
      _tabController.index = widget.selectedIndex.value;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          color: Colors.transparent,
          child: TabBar(
            onTap: (value) {
              widget.selectedIndex.value = value;
            },
            indicatorPadding: Space.vertical.v10,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.primaryColor.withValues(alpha: 0.5),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              color: AppColors.white,
              fontSize: AppSize.fontSize.bl,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.red,
              fontSize: AppSize.fontSize.bl,
            ),
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(80),
              color: AppColors.primaryColor,
            ),
            labelPadding: Space.horizontal.h5,
            controller: _tabController,
            tabs: List.generate(
              widget.tabs.length,
              (index) => Tab(text: widget.tabs[index]),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: List.generate(
              widget.tabs.length,
              (index) => Container(
                child: widget.pages[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


/*
Expanded(
              child: CustomTabBar(
                tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
                selectedIndex: Globals.selectedIndex,
                onTabChanged: (index) {
                  Globals.selectedIndex.value = index;
                },
                pages: const [
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                ],
              ),
            ),
 */