import 'user_model.dart';

class UserCollection {
  List<String> idList = [];
  List<UserModel> userList = [];

  UserCollection() {
    idList = [];
    userList = [];
  }

  int length() {
    return idList.length;
  }

  UserModel getUserAtIndex(int index) {
    UserModel user = userList[index];
    return UserModel.withData(
        name: user.getName,
        age: user.getAge,
        email: user.getEmail,
        pix: user.getPix,
        phoneNumber: user.getPhoneNumber);
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertUserOfId(String id, UserModel user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      // Update
      userList[index] = UserModel.withData(
          name: user.getName,
          age: user.getAge,
          email: user.getEmail,
          pix: user.getPix,
          phoneNumber: user.getPhoneNumber);
    } else {
      // Insert
      idList.add(id);
      userList.add(
        UserModel.withData(
            name: user.getName,
            age: user.getAge,
            email: user.getEmail,
            pix: user.getPix,
            phoneNumber: user.getPhoneNumber),
      );
    }
  }

  updateUserOfId(String id, UserModel user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList[index] = UserModel.withData(
          name: user.getName,
          age: user.getAge,
          email: user.getEmail,
          pix: user.getPix,
          phoneNumber: user.getPhoneNumber);
    }
  }

  deleteUserOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertUserOfId(String id, UserModel user) {
    idList.add(id);
    userList.add(
      UserModel.withData(
          name: user.getName,
          age: user.getAge,
          email: user.getEmail,
          pix: user.getPix,
          phoneNumber: user.getPhoneNumber),
    );
  }
}
