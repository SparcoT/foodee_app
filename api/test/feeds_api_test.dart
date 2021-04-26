import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for FeedsApi
void main() {
  final instance = Openapi().getFeedsApi();

  group(FeedsApi, () {
    //Future feedsCommentsCreate(String id) async
    test('test feedsCommentsCreate', () async {
      // TODO
    });

    //Future feedsCommentsDelete(int id) async
    test('test feedsCommentsDelete', () async {
      // TODO
    });

    //Future feedsCommentsList(String id) async
    test('test feedsCommentsList', () async {
      // TODO
    });

    //Future<FeedCommentWrite> feedsCommentsPartialUpdate(FeedCommentWrite data, int id) async
    test('test feedsCommentsPartialUpdate', () async {
      // TODO
    });

    //Future<FeedCommentWrite> feedsCommentsRead(int id) async
    test('test feedsCommentsRead', () async {
      // TODO
    });

    //Future<FeedCommentWrite> feedsCommentsUpdate(FeedCommentWrite data, int id) async
    test('test feedsCommentsUpdate', () async {
      // TODO
    });

    // GET, POST request to /feeds
    //
    //Future<FeedWrite> feedsCreate(FeedWrite data) async
    test('test feedsCreate', () async {
      // TODO
    });

    // PUT, PATCH, DELETE request to /feeds/<int:id>
    //
    //Future feedsDelete(int id) async
    test('test feedsDelete', () async {
      // TODO
    });

    //Future<FeedImage> feedsImagesCreate(Uint8List path, int post) async
    test('test feedsImagesCreate', () async {
      // TODO
    });

    //Future feedsImagesDelete(int id) async
    test('test feedsImagesDelete', () async {
      // TODO
    });

    //Future<FeedImage> feedsImagesPartialUpdate(Uint8List path, int post, int id) async
    test('test feedsImagesPartialUpdate', () async {
      // TODO
    });

    //Future<FeedImage> feedsImagesRead(int id) async
    test('test feedsImagesRead', () async {
      // TODO
    });

    //Future<FeedImage> feedsImagesUpdate(Uint8List path, int post, int id) async
    test('test feedsImagesUpdate', () async {
      // TODO
    });

    // GET, POST request to /feeds
    //
    //Future<InlineResponse2002> feedsList({ int limit, int offset }) async
    test('test feedsList', () async {
      // TODO
    });

    // PUT, PATCH, DELETE request to /feeds/<int:id>
    //
    //Future<FeedWrite> feedsPartialUpdate(FeedWrite data, int id) async
    test('test feedsPartialUpdate', () async {
      // TODO
    });

    // PUT, PATCH, DELETE request to /feeds/<int:id>
    //
    //Future<Feed> feedsRead(int id) async
    test('test feedsRead', () async {
      // TODO
    });

    // PUT, PATCH, DELETE request to /feeds/<int:id>
    //
    //Future<FeedWrite> feedsUpdate(FeedWrite data, int id) async
    test('test feedsUpdate', () async {
      // TODO
    });

  });
}
