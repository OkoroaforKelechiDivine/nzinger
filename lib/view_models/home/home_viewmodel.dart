import 'package:image_picker/image_picker.dart';
import 'package:nzinga/cores/locator/locator.dart';
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
    } 
    catch (e) {
      snackbarService.error(message: "Failed to pick image");
    }
  }

  void generateCaption() {
    if (_image != null) {
      String imagePath = _image!.path;
      String caption = 'Generated caption for $imagePath'; // Replace with actual caption generation logic
      print('Generated caption: $caption');
    } else {
      print('No image selected to generate a caption.');
    }
  }
}
