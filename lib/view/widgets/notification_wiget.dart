import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/responsive.dart';
import 'notification_list.dart';

void showNotifications(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(14),
        child: SizedBox(
          width: responsiveWidth(context, 430),
          height: responsiveHeight(context, 630),
          child: DefaultTabController(
            length: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFbdc3cb),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TabBar(
                        dividerColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 65),
                        isScrollable: false,
                        indicatorColor: Color(0xFF25AE4B),
                        labelColor: Color(0xFF25AE4B),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "All"),
                          Tab(text: "Unread"),
                          Tab(text: "Read"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Expanded(
                  child: TabBarView(
                    children: [
                      NotificationsList(type: "all"),
                      NotificationsList(type: "unread"),
                      NotificationsList(type: "read"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
