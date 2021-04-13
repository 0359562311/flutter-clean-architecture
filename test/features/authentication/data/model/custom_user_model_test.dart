import 'package:flutter_app_clean_architecture/features/authentication/data/model/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("fromJson", (){
    test("should succeed", (){
      CustomUserModel model = CustomUserModel.fromJson({
        'uid':"uid"
      });
      expect(model, CustomUserModel(uid: "uid"));
      expect(model, isA<CustomUser>());
    });

    test("should fail", (){
      CustomUserModel model = CustomUserModel.fromJson({
        'uid':"uid"
      });
      // expect(model, CustomUserModel(uid: "uid", name: "tan"));
      assert(model != CustomUserModel(uid: "uid", name: "tan"));
    });
  });

  group("toJson", (){
    test("should succeed", (){
      var map = CustomUserModel(uid: "uid").toJson();
      expect(map, {'uid': 'uid', 'name': null, 'phone': null});
      // verify
    });
  });
}