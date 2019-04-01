import 'package:scoped_model/scoped_model.dart';

import './image_service.dart';

class GlobalService extends Model {
  ImageService imageServiceInstance;

  ImageService get imageService {
    if (imageServiceInstance == null) imageServiceInstance = ImageService();
    return imageServiceInstance;
  }
}
