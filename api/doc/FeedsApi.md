# openapi.api.FeedsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://192.168.88.28:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**feedsCommentsCreate**](FeedsApi.md#feedscommentscreate) | **post** /feeds/{id}/comments | 
[**feedsCommentsDelete**](FeedsApi.md#feedscommentsdelete) | **delete** /feeds/comments/{id} | 
[**feedsCommentsList**](FeedsApi.md#feedscommentslist) | **get** /feeds/{id}/comments | 
[**feedsCommentsPartialUpdate**](FeedsApi.md#feedscommentspartialupdate) | **patch** /feeds/comments/{id} | 
[**feedsCommentsRead**](FeedsApi.md#feedscommentsread) | **get** /feeds/comments/{id} | 
[**feedsCommentsUpdate**](FeedsApi.md#feedscommentsupdate) | **put** /feeds/comments/{id} | 
[**feedsCreate**](FeedsApi.md#feedscreate) | **post** /feeds/ | 
[**feedsDelete**](FeedsApi.md#feedsdelete) | **delete** /feeds/{id}/ | 
[**feedsImagesCreate**](FeedsApi.md#feedsimagescreate) | **post** /feeds/images | 
[**feedsImagesDelete**](FeedsApi.md#feedsimagesdelete) | **delete** /feeds/images/{id} | 
[**feedsImagesPartialUpdate**](FeedsApi.md#feedsimagespartialupdate) | **patch** /feeds/images/{id} | 
[**feedsImagesRead**](FeedsApi.md#feedsimagesread) | **get** /feeds/images/{id} | 
[**feedsImagesUpdate**](FeedsApi.md#feedsimagesupdate) | **put** /feeds/images/{id} | 
[**feedsList**](FeedsApi.md#feedslist) | **get** /feeds/ | 
[**feedsPartialUpdate**](FeedsApi.md#feedspartialupdate) | **patch** /feeds/{id}/ | 
[**feedsRead**](FeedsApi.md#feedsread) | **get** /feeds/{id}/ | 
[**feedsUpdate**](FeedsApi.md#feedsupdate) | **put** /feeds/{id}/ | 


# **feedsCommentsCreate**
> feedsCommentsCreate(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = id_example; // String | 

try { 
    api_instance.feedsCommentsCreate(id);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCommentsCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsCommentsDelete**
> feedsCommentsDelete(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = 56; // int | A unique integer value identifying this feed comment.

try { 
    api_instance.feedsCommentsDelete(id);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCommentsDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this feed comment. | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsCommentsList**
> feedsCommentsList(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = id_example; // String | 

try { 
    api_instance.feedsCommentsList(id);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCommentsList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsCommentsPartialUpdate**
> FeedCommentWrite feedsCommentsPartialUpdate(data, id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var data = new FeedCommentWrite(); // FeedCommentWrite | 
var id = 56; // int | A unique integer value identifying this feed comment.

try { 
    var result = api_instance.feedsCommentsPartialUpdate(data, id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCommentsPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**FeedCommentWrite**](FeedCommentWrite.md)|  | 
 **id** | **int**| A unique integer value identifying this feed comment. | 

### Return type

[**FeedCommentWrite**](FeedCommentWrite.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsCommentsRead**
> FeedCommentWrite feedsCommentsRead(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = 56; // int | A unique integer value identifying this feed comment.

try { 
    var result = api_instance.feedsCommentsRead(id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCommentsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this feed comment. | 

### Return type

[**FeedCommentWrite**](FeedCommentWrite.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsCommentsUpdate**
> FeedCommentWrite feedsCommentsUpdate(data, id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var data = new FeedCommentWrite(); // FeedCommentWrite | 
var id = 56; // int | A unique integer value identifying this feed comment.

try { 
    var result = api_instance.feedsCommentsUpdate(data, id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCommentsUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**FeedCommentWrite**](FeedCommentWrite.md)|  | 
 **id** | **int**| A unique integer value identifying this feed comment. | 

### Return type

[**FeedCommentWrite**](FeedCommentWrite.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsCreate**
> FeedWrite feedsCreate(data)



GET, POST request to /feeds

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var data = new FeedWrite(); // FeedWrite | 

try { 
    var result = api_instance.feedsCreate(data);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**FeedWrite**](FeedWrite.md)|  | 

### Return type

[**FeedWrite**](FeedWrite.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsDelete**
> feedsDelete(id)



PUT, PATCH, DELETE request to /feeds/<int:id>

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = 56; // int | A unique integer value identifying this feed.

try { 
    api_instance.feedsDelete(id);
} catch (e) {
    print('Exception when calling FeedsApi->feedsDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this feed. | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsImagesCreate**
> FeedImage feedsImagesCreate(path, post)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var path = BINARY_DATA_HERE; // Uint8List | 
var post = 56; // int | 

try { 
    var result = api_instance.feedsImagesCreate(path, post);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsImagesCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **Uint8List**|  | 
 **post** | **int**|  | 

### Return type

[**FeedImage**](FeedImage.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsImagesDelete**
> feedsImagesDelete(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = 56; // int | A unique integer value identifying this feed image.

try { 
    api_instance.feedsImagesDelete(id);
} catch (e) {
    print('Exception when calling FeedsApi->feedsImagesDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this feed image. | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsImagesPartialUpdate**
> FeedImage feedsImagesPartialUpdate(path, post, id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var path = BINARY_DATA_HERE; // Uint8List | 
var post = 56; // int | 
var id = 56; // int | A unique integer value identifying this feed image.

try { 
    var result = api_instance.feedsImagesPartialUpdate(path, post, id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsImagesPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **Uint8List**|  | 
 **post** | **int**|  | 
 **id** | **int**| A unique integer value identifying this feed image. | 

### Return type

[**FeedImage**](FeedImage.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsImagesRead**
> FeedImage feedsImagesRead(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = 56; // int | A unique integer value identifying this feed image.

try { 
    var result = api_instance.feedsImagesRead(id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsImagesRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this feed image. | 

### Return type

[**FeedImage**](FeedImage.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsImagesUpdate**
> FeedImage feedsImagesUpdate(path, post, id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var path = BINARY_DATA_HERE; // Uint8List | 
var post = 56; // int | 
var id = 56; // int | A unique integer value identifying this feed image.

try { 
    var result = api_instance.feedsImagesUpdate(path, post, id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsImagesUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **Uint8List**|  | 
 **post** | **int**|  | 
 **id** | **int**| A unique integer value identifying this feed image. | 

### Return type

[**FeedImage**](FeedImage.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsList**
> InlineResponse2002 feedsList(limit, offset)



GET, POST request to /feeds

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var limit = 56; // int | Number of results to return per page.
var offset = 56; // int | The initial index from which to return the results.

try { 
    var result = api_instance.feedsList(limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Number of results to return per page. | [optional] 
 **offset** | **int**| The initial index from which to return the results. | [optional] 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsPartialUpdate**
> FeedWrite feedsPartialUpdate(data, id)



PUT, PATCH, DELETE request to /feeds/<int:id>

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var data = new FeedWrite(); // FeedWrite | 
var id = 56; // int | A unique integer value identifying this feed.

try { 
    var result = api_instance.feedsPartialUpdate(data, id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**FeedWrite**](FeedWrite.md)|  | 
 **id** | **int**| A unique integer value identifying this feed. | 

### Return type

[**FeedWrite**](FeedWrite.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsRead**
> Feed feedsRead(id)



PUT, PATCH, DELETE request to /feeds/<int:id>

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var id = 56; // int | A unique integer value identifying this feed.

try { 
    var result = api_instance.feedsRead(id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this feed. | 

### Return type

[**Feed**](Feed.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **feedsUpdate**
> FeedWrite feedsUpdate(data, id)



PUT, PATCH, DELETE request to /feeds/<int:id>

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new FeedsApi();
var data = new FeedWrite(); // FeedWrite | 
var id = 56; // int | A unique integer value identifying this feed.

try { 
    var result = api_instance.feedsUpdate(data, id);
    print(result);
} catch (e) {
    print('Exception when calling FeedsApi->feedsUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**FeedWrite**](FeedWrite.md)|  | 
 **id** | **int**| A unique integer value identifying this feed. | 

### Return type

[**FeedWrite**](FeedWrite.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

