import 'package:sharemore/models/userModel.dart';
import 'package:sharemore/utilities/network_handler.dart';

NetworkHandler networkHandler = NetworkHandler();
Future<userModel> getUser() async {
  userModel temp_user = userModel();
  var res = await networkHandler.get("/user/get");
  temp_user = userModel(
    id: res["msg"]["_id"],
    username: res["msg"]["username"],
    email: res["msg"]["email"],
    profile_picture: res["msg"]["profile_picture"],
    createdAt: res["msg"]["createdAt"],
  );
  return Future.delayed(Duration.zero, () => temp_user);
}
