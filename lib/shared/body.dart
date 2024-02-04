import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/shared/tab_view_widgets/common_widget.dart';
import 'package:gmail_setting_ui/shared/tab_view_widgets/general.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late final _tabController;
  List _widgetList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _widgetList = const [
      General(),
      CommonWidget(),
      //remaining 6 widgets here
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.697,
      width: screenSize.width * 0.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.1,
            child: TabBar(
              isScrollable: true,
              dividerHeight: 0.00,
              indicatorColor: Colors.blue,
              labelStyle: const TextStyle(
                  overflow: TextOverflow.visible,
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              controller: _tabController,
              tabs: const [
                Tab(text: 'General'),
                Tab(text: 'Label'),
                Tab(text: 'Inbox'),
                Tab(text: 'Accounts and Import'),
                Tab(text: 'Filters and Blocked Addresses'),
                Tab(text: 'Forwarding and POP/IMAP'),
                Tab(text: 'Add-ons'),
                Tab(text: 'Chat and Meet'),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              _widgetList[0],
              _widgetList[1],
              _widgetList[1],
              _widgetList[1],
              _widgetList[1],
              _widgetList[1],
              _widgetList[1],
              _widgetList[1],
            ],
          ))
        ],
      ),
    );
  }
}
