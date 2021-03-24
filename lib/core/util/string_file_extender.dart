import 'dart:io';

extension StringFileExtender on String {
  File toFile() => File(this);
}
