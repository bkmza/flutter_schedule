import 'package:scoped_model/scoped_model.dart';

import './image_service.dart';
import './threads_service.dart';

class GlobalService extends Model {
  BaseImageService _imageServiceInstance;
  BaseThreadService _threadServiceInstance;
  bool _offlineMode;

  GlobalService() {
    setOfflineMode(true);
  }

  BaseImageService get imageService => _imageServiceInstance;
  BaseThreadService get threadService => _threadServiceInstance;

  bool get isOfflineMode {
    return _offlineMode;
  }

  void setOfflineMode(bool value) {
    _offlineMode = value;
    if (_offlineMode) {
      _imageServiceInstance = ImageServiceMock();
      _threadServiceInstance = ThreadServiceMock();
    } else {
      _imageServiceInstance = ImageService();
      _threadServiceInstance = ThreadService();
    }
  }
}
