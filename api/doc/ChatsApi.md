# openapi.api.ChatsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://192.168.88.28:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**chatsCreate**](ChatsApi.md#chatscreate) | **post** /chats/ | 
[**chatsGetDetailedChatsRead**](ChatsApi.md#chatsgetdetailedchatsread) | **get** /chats/get_detailed_chats/{user} | 
[**chatsGetMessagesRead**](ChatsApi.md#chatsgetmessagesread) | **get** /chats/get_messages/{chat} | 
[**chatsList**](ChatsApi.md#chatslist) | **get** /chats/ | 
[**chatsMessagesCreate**](ChatsApi.md#chatsmessagescreate) | **post** /chats/{id}/messages | 
[**chatsMessagesList**](ChatsApi.md#chatsmessageslist) | **get** /chats/{id}/messages | 
[**chatsSeenPartialUpdate**](ChatsApi.md#chatsseenpartialupdate) | **patch** /chats/seen/{chat}/{user} | 


# **chatsCreate**
> Chats chatsCreate(data)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var data = new Chats(); // Chats | 

try { 
    var result = api_instance.chatsCreate(data);
    print(result);
} catch (e) {
    print('Exception when calling ChatsApi->chatsCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**Chats**](Chats.md)|  | 

### Return type

[**Chats**](Chats.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatsGetDetailedChatsRead**
> ChatsDetailList chatsGetDetailedChatsRead(user)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var user = user_example; // String | 

try { 
    var result = api_instance.chatsGetDetailedChatsRead(user);
    print(result);
} catch (e) {
    print('Exception when calling ChatsApi->chatsGetDetailedChatsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | **String**|  | 

### Return type

[**ChatsDetailList**](ChatsDetailList.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatsGetMessagesRead**
> BuiltList<ChatMessages> chatsGetMessagesRead(chat)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var chat = chat_example; // String | 

try { 
    var result = api_instance.chatsGetMessagesRead(chat);
    print(result);
} catch (e) {
    print('Exception when calling ChatsApi->chatsGetMessagesRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chat** | **String**|  | 

### Return type

[**BuiltList<ChatMessages>**](ChatMessages.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatsList**
> InlineResponse200 chatsList(limit, offset)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var limit = 56; // int | Number of results to return per page.
var offset = 56; // int | The initial index from which to return the results.

try { 
    var result = api_instance.chatsList(limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling ChatsApi->chatsList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Number of results to return per page. | [optional] 
 **offset** | **int**| The initial index from which to return the results. | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatsMessagesCreate**
> ChatMessages chatsMessagesCreate(data, id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var data = new ChatMessages(); // ChatMessages | 
var id = 56; // int | A unique integer value identifying this chat message.

try { 
    var result = api_instance.chatsMessagesCreate(data, id);
    print(result);
} catch (e) {
    print('Exception when calling ChatsApi->chatsMessagesCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**ChatMessages**](ChatMessages.md)|  | 
 **id** | **int**| A unique integer value identifying this chat message. | 

### Return type

[**ChatMessages**](ChatMessages.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatsMessagesList**
> InlineResponse2001 chatsMessagesList(id, limit, offset)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var id = 56; // int | A unique integer value identifying this chat message.
var limit = 56; // int | Number of results to return per page.
var offset = 56; // int | The initial index from which to return the results.

try { 
    var result = api_instance.chatsMessagesList(id, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling ChatsApi->chatsMessagesList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this chat message. | 
 **limit** | **int**| Number of results to return per page. | [optional] 
 **offset** | **int**| The initial index from which to return the results. | [optional] 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatsSeenPartialUpdate**
> chatsSeenPartialUpdate(chat, user)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new ChatsApi();
var chat = chat_example; // String | 
var user = user_example; // String | 

try { 
    api_instance.chatsSeenPartialUpdate(chat, user);
} catch (e) {
    print('Exception when calling ChatsApi->chatsSeenPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chat** | **String**|  | 
 **user** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

