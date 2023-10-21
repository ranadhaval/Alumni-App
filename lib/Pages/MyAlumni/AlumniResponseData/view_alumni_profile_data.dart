import 'package:alumni/Pages/MyAlumni/Provider/alumni_id_provider.dart';
import 'package:alumni/Pages/MyAlumni/Response/alumni_profile_response.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:get_storage/get_storage.dart';

class ViewProfileData {
  GetStorage storage = GetStorage();
  String? viewError;
  ViewAlumniProfileRes viewAlumniProfileRes = ViewAlumniProfileRes();

  // for view response

  getViewAlumniIds({required String id}) async {
    await AlumniIdProvider().getViewAlumniProfile(
        id: id,
        accessToken: storage.read("Token").toString(),
        onSuccess: ((ResponseModel responseModel) async {
          if (responseModel.statusCode == 200) {
            await Future.delayed(const Duration(seconds: 1), () async {
              viewAlumniProfileRes =
                  ViewAlumniProfileRes.fromJson((responseModel.result));
            });
          }
        }),
        onError: ((ResponseModel responseModel) {
          viewError = responseModel.message.toString();
        }));

    await Future.delayed(const Duration(seconds: 1), () async {});
  }
}
