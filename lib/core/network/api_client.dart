import 'dart:convert';
import 'package:http/http.dart' as http;
import '../const/const_values.dart';
import '../util/secure_storage_helper.dart';

class ApiClient<T> {
  static Future<List<T>> getDataList<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    List<T> data = [];
    final response = await http.get(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      for (Map item in jsonBody) {
        data.add(fromJsonT!(item));
      }
      return data;
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> getData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.get(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> postData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.post(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> putData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.put(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static deleteData({required String endpoint}) async {
    await http.delete(Uri.parse("${ConstValues.baseUrl}$endpoint"));
  }

  Future<List<dynamic>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('${ConstValues.baseUrl}api/categories'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        if (responseBody['data'] != null && responseBody['data'] is List) {
          final List<dynamic> categories = responseBody['data'];
          print('Categories: $categories');
          return categories;
        } else {
          throw Exception('Unexpected response format for categories');
        }
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during API call: $e');
    }
  }

  Future<String?> login(String email, String password) async {
    var url = '${ConstValues.baseUrl}api/login';
    Map<String, dynamic> requestBody = {
      'email': email.trim(),
      'password': password.trim(),
    };

    print('Sent Login\nemail:$email\npassword:$password');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(requestBody),
      );

      final responseBody = jsonDecode(response.body);
      print("Response: $responseBody");

      if (response.statusCode == 200 &&
          responseBody['status'] == true &&
          responseBody['data'] != null &&
          responseBody['data']['token'] != null) {
        String newToken = responseBody['data']['token'];

        await SecureStorageHelper.instance.savePrefString(
          key: 'auth_token',
          value: newToken,
        );

        print('New token saved: $newToken');
        return newToken;
      } else {
        print('Login failed. Message: ${responseBody['message']}');
        return null;
      }
    } catch (e) {
      print('Error during API call: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> signup({
    required String name,
    required String email,
    required String dob,
    required String number,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ConstValues.baseUrl}api/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "birth_date": dob,
          "phone_number": number,
          "password": password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print(response.body);
        return {
          "status": false,
          "message": "Registration failed. Code: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  Future<Map<String, dynamic>?> sendOTP({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse('${ConstValues.baseUrl}api/sendOTP'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email}),
      );
      print("Send OTP Response: ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"isSuccess": false, "message": "Failed to send OTP"};
      }
    } catch (e) {
      return {"isSuccess": false, "message": "Error: $e"};
    }
  }

  Future<Map<String, dynamic>?> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ConstValues.baseUrl}api/verify'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      print("Send OTP Response: ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"isSuccess": false, "message": "Failed to send OTP"};
      }
    } catch (e) {
      return {"isSuccess": false, "message": "Error: $e"};
    }
  }
}
