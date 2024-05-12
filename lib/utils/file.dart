part of 'utils.dart';

void showFilePicker({
  required final Function(List<FileData> file) action,
  final FileType fileType = FileType.any,
  final bool allowMultiple = false,
  final String? initialDirectory,
  final String? dialogTitle,
  final bool allowCompression = true,
  final bool withReadStream = false,
  final bool lockParentWindow = false,
  final List<String>? allowedExtensions,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    dialogTitle: dialogTitle,
    initialDirectory: initialDirectory,
    allowCompression: allowCompression,
    withReadStream: withReadStream,
    lockParentWindow: lockParentWindow,
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );
  final List<FileData> files = <FileData>[];

  if (result != null) {
    if (allowMultiple) {
      result.files.forEach(
        (final PlatformFile i) async {
          files.add(
            FileData(
              path: isWeb ? null : i.path,
              bytes: i.bytes,
              extension: ".${i.extension}",
            ),
          );
        },
      );
      action(files);
    } else
      action(
        <FileData>[
          FileData(
            path: result.files.single.path,
            bytes: result.files.single.bytes,
            extension: result.files.single.extension,
          ),
        ],
      );
  }
}

Future<File> writeToFile(final Uint8List data) async {
  final Directory tempDir = await getTemporaryDirectory();
  return File('${tempDir.path}/${Random.secure().nextInt(10000)}.tmp').writeAsBytes(
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
  );
}

void showMultiFilePicker({
  required final Function(List<File> file) action,
  final FileType fileType = FileType.image,
  final bool allowMultiple = false,
  final List<String>? allowedExtensions,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );
  if (result != null) {
    if (allowMultiple) {
      final List<File> files = <File>[];
      result.files.forEach((final PlatformFile i) {
        if (i.path != null) files.add(File(i.path!));
      });
    } else {
      final File file = File(result.files.single.path!);
      action(<File>[file]);
    }
  }
}


class FileData {
  FileData({
    this.path,
    this.bytes,
    this.extension,
  });

  final String? path;
  final String? extension;
  final Uint8List? bytes;
}