import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  final String type;

  const NotificationsList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Delayed Order:",
        "message":
            "\"We're sorry! Your order is running late. New ETA: 10:30 PM. Thanks for your patience!\"",
        "timestamp": "Last Wednesday at 9:42 AM",
        "isRead": false,
      },
      {
        "title": "Promotional Offer:",
        "message":
            "\"Craving something delicious? 🍕 Get 20% off on your next order. Use code: YUMMY20.\"",
        "timestamp": "Last Wednesday at 9:42 AM",
        "isRead": false,
      },
      {
        "title": "Out for Delivery:",
        "message":
            "\"Your order is on the way! 🚗 Estimated arrival: 15 mins. Stay hungry!\"",
        "timestamp": "Last Wednesday at 9:42 AM",
        "isRead": true,
      },
      {
        "title": "Order Confirmation:",
        "message":
            "\"Your order has been placed! 🍔 We're preparing it now. Track your order live!\"",
        "timestamp": "Last Wednesday at 9:42 AM",
        "isRead": true,
      },
      {
        "title": "Delivered:",
        "message": "\"Enjoy your meal! 🍽️ Your order has been delivered.\"",
        "timestamp": "Last Wednesday at 9:42 AM",
        "isRead": true,
      },
    ];

    final filteredNotifications =
        notifications.where((notification) {
          if (type == "unread") return notification["isRead"] as bool;
          if (type == "read") return notification["isRead"] as bool;
          return true;
        }).toList();

    return ListView.separated(
      itemCount: filteredNotifications.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final notification = filteredNotifications[index];
        return ListTile(
          title: Text(
            notification["title"] as String,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(notification["message"] as String),
          trailing: Text("9:42 AM", style: TextStyle(color: Colors.grey[600])),
        );
      },
    );
  }
}
