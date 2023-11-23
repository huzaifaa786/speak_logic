import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/helpers/utils.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DownloadService {
  void downloadFile(book, type) async {
    LoadingHelper.show();

    var response;

    if (type == 'pdf') {
      response = await Api.execute(
          url: API_URL + 'books/download_pdf/' + book.id.toString());
      storeFile(response['pdf']);
    } else {
      response = await Api.execute(
          url: API_URL + 'books/download_epub/' + book.id.toString());
      storeFile(response['epub']);
    }

    LoadingHelper.dismiss();
  }

  void storeFile(path) async {
    Fluttertoast.showToast(msg: "Download started", fontSize: 16.0);

    final taskId = await FlutterDownloader.enqueue(
        url: path,
        savedDir: 'storage/emulated/0/Download',
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true);
  }
}
