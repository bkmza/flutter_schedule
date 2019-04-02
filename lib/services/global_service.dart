import 'package:scoped_model/scoped_model.dart';

import './image_service.dart';
import './threads_service.dart';
import './lectures_service.dart';

class GlobalService extends Model {
  BaseImageService _imageServiceInstance;
  BaseThreadService _threadServiceInstance;
  BaseLectureService _lectureServiceInstance;
  bool _offlineMode;

  GlobalService() {
    setOfflineMode(true);
  }

  BaseImageService get imageService => _imageServiceInstance;
  BaseThreadService get threadService => _threadServiceInstance;
  BaseLectureService get lectureService => _lectureServiceInstance;

  bool get isOfflineMode {
    return _offlineMode;
  }

  void setOfflineMode(bool value) {
    _offlineMode = value;
    if (_offlineMode) {
      _imageServiceInstance = ImageServiceMock();
      _threadServiceInstance = ThreadServiceMock();
      _lectureServiceInstance = LectureServiceMock();
    } else {
      _imageServiceInstance = ImageService();
      _threadServiceInstance = ThreadService();
      _lectureServiceInstance = LectureService();
    }
  }
}
