// Importing the required packages
import 'dart:convert';
import 'package:http/http.dart' as http;


class TestRepository {


  Future<List<Map<String, dynamic>>> fetchTestData() async {
    try {
      final response = await http.get(Uri.parse('https://run.mocky.io/v3/17dfda7b-09ff-44e4-9eac-ebfd9ff4532f'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print(data);
        List<Map<String, dynamic>> testDataList = [];
        for (var item in data) {
          testDataList.add(Map<String, dynamic>.from(item));
        }
        return testDataList;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching test data: $e');
    }
  }




  Future<List<Map<String, dynamic>>> fetchRecommendedTestList() async {
    try {
      final response = await http.get(Uri.parse('https://run.mocky.io/v3/ef3f4232-6d13-4ec8-81a4-d54cc73fd4ee'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => Map<String, dynamic>.from(item)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching test data: $e');
    }
  }




}
