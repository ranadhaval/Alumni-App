import 'package:alumni/Pages/CreateProfile/Model/Request/form_request.dart';
import 'package:alumni/Pages/CreateProfile/Model/Response/form_response.dart';
import 'package:alumni/Pages/CreateProfile/Provider/form_data_provider.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FormResponseData {
  FormRes createProfileRes = FormRes();
  // List<EducationDetailsRequest> educationDetails = [];
  // List<ProfessionalDetailsRequest> professionalDetails = [];
  bool isLoading = false;

  String? errorMessage;

  final storage = GetStorage();
  createProfile(
      {required PersonalDetailsRequest personalDetails,
      //   required String? dob,
      // required int phone,
      // required String bio,
      // required String contactWay,
      // required String street,
      // required String country,
      // required String city,
      // required String state,
      // required int zip,
      required List<EducationDetailsRequest> educationDetails,
      required List<ProfessionalDetailsRequest> professionalDetails}) async {
    FormRequest formRequest = FormRequest(
        educationDetails: educationDetails,
        professionalDetails: professionalDetails,
        personalDetails: personalDetails
        // PersonalDetailsRequest(
        //     address: AddressRequest(
        //         state: state,
        //         city: city,
        //         country: country,
        //         zip: zip,
        //         street: street),
        //     dob: dob,
        //     phone: phone,
        //     bio: bio,
        //     contactWay: contactWay)

        );

    print(educationDetails.length);
    print(professionalDetails.length);
    print(personalDetails.contactWay);

    await FormDataProvider().getFormData(
      accessToken: storage.read("Token"),
      formRequest: formRequest,
      onSuccess: (ResponseModel responseModel) async {
        isLoading = true;
        if (responseModel.statusCode == 200) {
          print("enter bro");
          await Future.delayed(const Duration(seconds: 4), () {
            createProfileRes = FormRes.fromJson(responseModel.result);
          });
        }
      },
      onError: (ResponseModel responseModel) {
        errorMessage = responseModel.message;
      },
    );

    await Future.delayed(const Duration(seconds: 3), () {});
  }
}
