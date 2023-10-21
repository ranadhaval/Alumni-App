import 'package:alumni/Pages/Sign%20in/Model/Request/signin_request.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/get_school_branches.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/signin_response.dart';
import 'package:alumni/Pages/Sign%20in/Provider/signin_provider.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:get_storage/get_storage.dart';

class SigninResponseData {
  SigninRes signinRes = SigninRes();
  GetStorage storage = GetStorage();
  String? errorMessage;
  GetSchoolBranches getSchoolBranches = GetSchoolBranches();
  String? getSchoolBranchesErrorMessage;

  getSigin({
    required String email,
    required String password,
  }) async {
    SigninReq signinReq = SigninReq(
      email: email,
      password: password,
    );
    // print("hyyy");
    print(email);
    print(password);

    try {
      await SigninProvider().getSignin(
          signinReq: signinReq,
          onSuccess: ((ResponseModel responseModel) async {
       

            if (responseModel.statusCode == 200) {
              await Future.delayed(const Duration(seconds: 4), () {
                signinRes = SigninRes.fromJson((responseModel.result));
                print("hyyy");
              });
              storage.write("Token", signinRes.token);
              storage.write("id", signinRes.data!.id.toString());
              print("id is :");
              print(storage.write("id", signinRes.data!.id.toString()));

              // getdata(signinRes, "success");
            } else {
              // getdata(signinRes, "200 + status code");
            }
          }),
          onError: ((ResponseModel responseModel) {
            errorMessage = responseModel.message.toString();
            // getdata(signinRes, errorMessage.toString());
          }));
    } catch (e) {
      print(e);
    }
    await Future.delayed(const Duration(seconds: 3), () {});
    // getdata(signinRes, "data truth");
  }

  getdata(signinRes_, string) {
    GetSchoolBranches getSchoolBranches = signinRes_;
    print("data gotten ${getSchoolBranches.success} stage : $string");
  }

  getBranches() async {
    await SigninProvider().getSchoolBranches(onSuccess: ((responseModel) async {
      if (responseModel.statusCode == 200) {
        // await Future.delayed(const Duration(seconds: 4), () async {
        getSchoolBranches =
            await GetSchoolBranches.fromJson((responseModel.result));
        await storage.write("SchoolBranches", getSchoolBranches);
        print(storage.read("SchoolBranches"));
        // });

        getdata(getSchoolBranches, "success");
      } else {
        getdata(getSchoolBranches, "200 + status code");
      }
    }), onError: ((responseModel) {
      getSchoolBranchesErrorMessage = responseModel.message.toString();
    }));
  }
}
