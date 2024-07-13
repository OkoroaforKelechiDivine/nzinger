import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _token;

  XFile? get image => _image;
  String? get token => _token;

  HomeViewModel() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    _token = await loadToken();
    notifyListeners();
  }

  static Future<String?> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> saveTokenGlobally(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> pickImage() async {
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _image = pickedImage;
        notifyListeners();
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
