import 'package:scoped_model/scoped_model.dart';

import './image_service.dart';

class GlobalService extends Model {
  ImageService _imageServiceInstance;
  bool _offlineMode = true;

  ImageService get imageService {
    if (_imageServiceInstance == null) _imageServiceInstance = ImageService();
    return _imageServiceInstance;
  }

  bool get isOfflineMode {
    return _offlineMode;
  }

  void setOfflineMode(bool value) {
    _offlineMode = value;
  }
}
