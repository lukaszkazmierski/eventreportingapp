import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../error/failures.dart';

export 'package:image_picker/image_picker.dart' show ImageSource;



class ImagePickerService {
  final _picker;

  ImagePickerService() : _picker = ImagePicker();

  ImageSource get camera => ImageSource.camera;
  ImageSource get gallery => ImageSource.gallery;

  
  Future<Either<Failure, String>> pickImage(ImageSource source) async {
    String pickedImagePath = await _getImage(source);

    if(pickedImagePath == null) {
      return await _retrieveLostData();
    } else {
      return Right(pickedImagePath);
    }
  }


  Future<String> _getImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    if(pickedFile?.path?.isEmpty == null) {
      return '';
    }
    return pickedFile.path;
  }

  Future<Either<Failure, String>> _retrieveLostData() async {
    final LostData response = await _picker.getLostData();

    if (response.isEmpty) {
      return Left(ImagePickerFailure(2));
    }

    if (response.file != null) {
      if (response.type == RetrieveType.image) {
        return Right(response.file.path);
      } else if(response.type == RetrieveType.video) {
        return Left(ImagePickerFailure(2));
      }
    } else {
      return Left(ImagePickerFailure(2));
    }
  }
}
