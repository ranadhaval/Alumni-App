import 'package:alumni/Pages/Signup/Provider/registration_provider.dart';
import 'package:alumni/Pages/Signup/request/regestartion_request.dart';
import 'package:alumni/Pages/Signup/response/regestration_response.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:get_storage/get_storage.dart';

class RegestrationResponseData {
  RegestrationRes regestrationRes = RegestrationRes();
  String? errorMessage;
  final storage = GetStorage();
  getRegister(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String school,
      required String passingClass,
      required String passingYear,
      required String classRollNumber,
      required int parentUserId,

      
      }) async {
    RegestrationReq regestrationReq = RegestrationReq(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        parentUserId: parentUserId,
        userDetails: UserDetails(
            school: school,
            passingClass: passingClass,
            passingYear: passingYear,
            classRollNumber: classRollNumber));

    RegisterProvider().getRegister(
        registerReq: regestrationReq,
        onSuccess: ((ResponseModel responseModel) async {
          if (responseModel.statusCode == 200) {
            await Future.delayed(const Duration(seconds: 4), () {
              regestrationRes = RegestrationRes.fromJson(responseModel.result);
            });
            await storage.write("RegistrationResponse", regestrationRes);
          }
        }),
        onError: ((ResponseModel responseModel) {
          errorMessage = responseModel.message.toString();
        }));
    await Future.delayed(const Duration(seconds: 3), () {});
  }
}
