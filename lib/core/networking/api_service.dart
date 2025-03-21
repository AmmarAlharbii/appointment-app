import 'package:appointment_app/core/networking/api_constants.dart';
import 'package:appointment_app/feature/auth/login/data/models/login_request_body.dart';
import 'package:appointment_app/feature/auth/login/data/models/login_response.dart';
import 'package:appointment_app/feature/auth/signup/data/model/signup_request_body.dart';
import 'package:appointment_app/feature/auth/signup/data/model/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody body);
}
