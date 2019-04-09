import 'package:scoped_model/scoped_model.dart';

import './image_service.dart';
import './threads_service.dart';
import './lectures_service.dart';
import '../helpers/app_mode.dart';

class GlobalService extends Model {
  BaseImageService _imageServiceInstance;
  BaseThreadService _threadServiceInstance;
  BaseLectureService _lectureServiceInstance;
  AppModeType _appModeType;

  GlobalService() {
    setAppMode(AppModeType.offline);
  }

  BaseImageService get imageService => _imageServiceInstance;
  BaseThreadService get threadService => _threadServiceInstance;
  BaseLectureService get lectureService => _lectureServiceInstance;

  bool get isOfflineMode {
    return _appModeType == AppModeType.offline;
  }

  void setAppMode(AppModeType type) {
    _appModeType = type;
    if (_appModeType == AppModeType.offline) {
      _imageServiceInstance = ImageServiceMock();
      _threadServiceInstance = ThreadServiceMock(this);
      _lectureServiceInstance = LectureServiceMock();
    } else {
      _imageServiceInstance = ImageService();
      _threadServiceInstance = ThreadService(this);
      _lectureServiceInstance = LectureService(this);
    }
  }

  void notify() {
    notifyListeners();
  }
}
