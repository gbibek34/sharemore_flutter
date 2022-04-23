import 'package:awesome_notifications/awesome_notifications.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(10000);
}

Future<void> createPostCreateNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: "basic_channel",
      title: "${Emojis.paper_books} New Post Created",
      body: "You have successfully created a new post!",
      notificationLayout: NotificationLayout.Default,
    ),
  );
}
