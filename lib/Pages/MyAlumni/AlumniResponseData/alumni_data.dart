import 'package:alumni/Pages/MyAlumni/Provider/alumni_id_provider.dart';
import 'package:alumni/Pages/MyAlumni/Response/alumni_profile_response.dart';
import 'package:alumni/Pages/MyAlumni/Response/feed_alumni_response.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:get_storage/get_storage.dart';

class AlumniResponse {
  AlumniIdRes alumniFeedIdRes = AlumniIdRes();

  GetStorage storage = GetStorage();

  String? errorMessage;

  Future<AlumniIdRes> getalumnires() async {
    return alumniFeedIdRes;
  }

  getAlumniIds() async {
    await AlumniIdProvider().getAlumniId(
        accessToken: storage.read("Token").toString(),
        onSuccess: ((ResponseModel responseModel) async {
          if (responseModel.statusCode == 200) {
            await Future.delayed(const Duration(seconds: 4), () async {
              alumniFeedIdRes = AlumniIdRes.fromJson((responseModel.result));
              print(alumniFeedIdRes.success);
            });
          }
        }),
        onError: ((ResponseModel responseModel) {
          errorMessage = responseModel.message.toString();
        }));
    print("object");
    await Future.delayed(const Duration(seconds: 3), () async {});
  }
}
