# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://192.168.88.28:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersCreate**](UsersApi.md#userscreate) | **post** /users/ | 
[**usersDelete**](UsersApi.md#usersdelete) | **delete** /users/{id}/ | 
[**usersList**](UsersApi.md#userslist) | **get** /users/ | 
[**usersLoginCreate**](UsersApi.md#userslogincreate) | **post** /users/login | 
[**usersLogoutCreate**](UsersApi.md#userslogoutcreate) | **post** /users/logout | 
[**usersPartialUpdate**](UsersApi.md#userspartialupdate) | **patch** /users/{id}/ | 
[**usersRead**](UsersApi.md#usersread) | **get** /users/{id}/ | 
[**usersSendVerificationEmailCreate**](UsersApi.md#userssendverificationemailcreate) | **post** /users/send-verification-email/{email}/ | 
[**usersUpdate**](UsersApi.md#usersupdate) | **put** /users/{id}/ | 
[**usersVerifyRead**](UsersApi.md#usersverifyread) | **get** /users/verify/{email}/{token} | 


# **usersCreate**
> User usersCreate(password, username, email, firstName, lastName, lastLogin, isSuperuser, isStaff, isActive, dateJoined, age, address, gender, phone, image, isAgePublic, contribution, deviceToken, location, status, verificationToken, groups, userPermissions)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var password = password_example; // String | 
var username = username_example; // String | Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
var email = ; // String | 
var firstName = firstName_example; // String | 
var lastName = lastName_example; // String | 
var lastLogin = 2013-10-20T19:20:30+01:00; // DateTime | 
var isSuperuser = true; // bool | Designates that this user has all permissions without explicitly assigning them.
var isStaff = true; // bool | Designates whether the user can log into this admin site.
var isActive = true; // bool | Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
var dateJoined = 2013-10-20T19:20:30+01:00; // DateTime | 
var age = 56; // int | 
var address = address_example; // String | 
var gender = gender_example; // String | 
var phone = phone_example; // String | 
var image = BINARY_DATA_HERE; // Uint8List | 
var isAgePublic = true; // bool | 
var contribution = 56; // int | 
var deviceToken = deviceToken_example; // String | 
var location = location_example; // String | 
var status = true; // bool | 
var verificationToken = verificationToken_example; // String | 
var groups = [56]; // BuiltSet<int> | The groups this user belongs to. A user will get all permissions granted to each of their groups.
var userPermissions = [56]; // BuiltSet<int> | Specific permissions for this user.

try { 
    var result = api_instance.usersCreate(password, username, email, firstName, lastName, lastLogin, isSuperuser, isStaff, isActive, dateJoined, age, address, gender, phone, image, isAgePublic, contribution, deviceToken, location, status, verificationToken, groups, userPermissions);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **password** | **String**|  | 
 **username** | **String**| Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only. | 
 **email** | [**String**](String.md)|  | 
 **firstName** | **String**|  | 
 **lastName** | **String**|  | 
 **lastLogin** | **DateTime**|  | [optional] 
 **isSuperuser** | **bool**| Designates that this user has all permissions without explicitly assigning them. | [optional] 
 **isStaff** | **bool**| Designates whether the user can log into this admin site. | [optional] 
 **isActive** | **bool**| Designates whether this user should be treated as active. Unselect this instead of deleting accounts. | [optional] 
 **dateJoined** | **DateTime**|  | [optional] 
 **age** | **int**|  | [optional] 
 **address** | **String**|  | [optional] 
 **gender** | **String**|  | [optional] 
 **phone** | **String**|  | [optional] 
 **image** | **Uint8List**|  | [optional] 
 **isAgePublic** | **bool**|  | [optional] 
 **contribution** | **int**|  | [optional] 
 **deviceToken** | **String**|  | [optional] 
 **location** | **String**|  | [optional] 
 **status** | **bool**|  | [optional] 
 **verificationToken** | **String**|  | [optional] 
 **groups** | [**BuiltSet<int>**](int.md)| The groups this user belongs to. A user will get all permissions granted to each of their groups. | [optional] 
 **userPermissions** | [**BuiltSet<int>**](int.md)| Specific permissions for this user. | [optional] 

### Return type

[**User**](User.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersDelete**
> usersDelete(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var id = 56; // int | A unique integer value identifying this user.

try { 
    api_instance.usersDelete(id);
} catch (e) {
    print('Exception when calling UsersApi->usersDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this user. | 

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersList**
> InlineResponse2003 usersList(limit, offset)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var limit = 56; // int | Number of results to return per page.
var offset = 56; // int | The initial index from which to return the results.

try { 
    var result = api_instance.usersList(limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Number of results to return per page. | [optional] 
 **offset** | **int**| The initial index from which to return the results. | [optional] 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersLoginCreate**
> LoginResponse usersLoginCreate(data)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var data = new Login(); // Login | 

try { 
    var result = api_instance.usersLoginCreate(data);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersLoginCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**Login**](Login.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersLogoutCreate**
> usersLogoutCreate()



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();

try { 
    api_instance.usersLogoutCreate();
} catch (e) {
    print('Exception when calling UsersApi->usersLogoutCreate: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersPartialUpdate**
> User usersPartialUpdate(password, username, email, firstName, lastName, id, lastLogin, isSuperuser, isStaff, isActive, dateJoined, age, address, gender, phone, image, isAgePublic, contribution, deviceToken, location, status, verificationToken, groups, userPermissions)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var password = password_example; // String | 
var username = username_example; // String | Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
var email = ; // String | 
var firstName = firstName_example; // String | 
var lastName = lastName_example; // String | 
var id = 56; // int | A unique integer value identifying this user.
var lastLogin = 2013-10-20T19:20:30+01:00; // DateTime | 
var isSuperuser = true; // bool | Designates that this user has all permissions without explicitly assigning them.
var isStaff = true; // bool | Designates whether the user can log into this admin site.
var isActive = true; // bool | Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
var dateJoined = 2013-10-20T19:20:30+01:00; // DateTime | 
var age = 56; // int | 
var address = address_example; // String | 
var gender = gender_example; // String | 
var phone = phone_example; // String | 
var image = BINARY_DATA_HERE; // Uint8List | 
var isAgePublic = true; // bool | 
var contribution = 56; // int | 
var deviceToken = deviceToken_example; // String | 
var location = location_example; // String | 
var status = true; // bool | 
var verificationToken = verificationToken_example; // String | 
var groups = [56]; // BuiltSet<int> | The groups this user belongs to. A user will get all permissions granted to each of their groups.
var userPermissions = [56]; // BuiltSet<int> | Specific permissions for this user.

try { 
    var result = api_instance.usersPartialUpdate(password, username, email, firstName, lastName, id, lastLogin, isSuperuser, isStaff, isActive, dateJoined, age, address, gender, phone, image, isAgePublic, contribution, deviceToken, location, status, verificationToken, groups, userPermissions);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **password** | **String**|  | 
 **username** | **String**| Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only. | 
 **email** | [**String**](String.md)|  | 
 **firstName** | **String**|  | 
 **lastName** | **String**|  | 
 **id** | **int**| A unique integer value identifying this user. | 
 **lastLogin** | **DateTime**|  | [optional] 
 **isSuperuser** | **bool**| Designates that this user has all permissions without explicitly assigning them. | [optional] 
 **isStaff** | **bool**| Designates whether the user can log into this admin site. | [optional] 
 **isActive** | **bool**| Designates whether this user should be treated as active. Unselect this instead of deleting accounts. | [optional] 
 **dateJoined** | **DateTime**|  | [optional] 
 **age** | **int**|  | [optional] 
 **address** | **String**|  | [optional] 
 **gender** | **String**|  | [optional] 
 **phone** | **String**|  | [optional] 
 **image** | **Uint8List**|  | [optional] 
 **isAgePublic** | **bool**|  | [optional] 
 **contribution** | **int**|  | [optional] 
 **deviceToken** | **String**|  | [optional] 
 **location** | **String**|  | [optional] 
 **status** | **bool**|  | [optional] 
 **verificationToken** | **String**|  | [optional] 
 **groups** | [**BuiltSet<int>**](int.md)| The groups this user belongs to. A user will get all permissions granted to each of their groups. | [optional] 
 **userPermissions** | [**BuiltSet<int>**](int.md)| Specific permissions for this user. | [optional] 

### Return type

[**User**](User.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersRead**
> User usersRead(id)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var id = 56; // int | A unique integer value identifying this user.

try { 
    var result = api_instance.usersRead(id);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this user. | 

### Return type

[**User**](User.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersSendVerificationEmailCreate**
> VerifyAccountResponse usersSendVerificationEmailCreate(email)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var email = email_example; // String | 

try { 
    var result = api_instance.usersSendVerificationEmailCreate(email);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersSendVerificationEmailCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**VerifyAccountResponse**](VerifyAccountResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUpdate**
> User usersUpdate(password, username, email, firstName, lastName, id, lastLogin, isSuperuser, isStaff, isActive, dateJoined, age, address, gender, phone, image, isAgePublic, contribution, deviceToken, location, status, verificationToken, groups, userPermissions)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var password = password_example; // String | 
var username = username_example; // String | Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
var email = ; // String | 
var firstName = firstName_example; // String | 
var lastName = lastName_example; // String | 
var id = 56; // int | A unique integer value identifying this user.
var lastLogin = 2013-10-20T19:20:30+01:00; // DateTime | 
var isSuperuser = true; // bool | Designates that this user has all permissions without explicitly assigning them.
var isStaff = true; // bool | Designates whether the user can log into this admin site.
var isActive = true; // bool | Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
var dateJoined = 2013-10-20T19:20:30+01:00; // DateTime | 
var age = 56; // int | 
var address = address_example; // String | 
var gender = gender_example; // String | 
var phone = phone_example; // String | 
var image = BINARY_DATA_HERE; // Uint8List | 
var isAgePublic = true; // bool | 
var contribution = 56; // int | 
var deviceToken = deviceToken_example; // String | 
var location = location_example; // String | 
var status = true; // bool | 
var verificationToken = verificationToken_example; // String | 
var groups = [56]; // BuiltSet<int> | The groups this user belongs to. A user will get all permissions granted to each of their groups.
var userPermissions = [56]; // BuiltSet<int> | Specific permissions for this user.

try { 
    var result = api_instance.usersUpdate(password, username, email, firstName, lastName, id, lastLogin, isSuperuser, isStaff, isActive, dateJoined, age, address, gender, phone, image, isAgePublic, contribution, deviceToken, location, status, verificationToken, groups, userPermissions);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **password** | **String**|  | 
 **username** | **String**| Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only. | 
 **email** | [**String**](String.md)|  | 
 **firstName** | **String**|  | 
 **lastName** | **String**|  | 
 **id** | **int**| A unique integer value identifying this user. | 
 **lastLogin** | **DateTime**|  | [optional] 
 **isSuperuser** | **bool**| Designates that this user has all permissions without explicitly assigning them. | [optional] 
 **isStaff** | **bool**| Designates whether the user can log into this admin site. | [optional] 
 **isActive** | **bool**| Designates whether this user should be treated as active. Unselect this instead of deleting accounts. | [optional] 
 **dateJoined** | **DateTime**|  | [optional] 
 **age** | **int**|  | [optional] 
 **address** | **String**|  | [optional] 
 **gender** | **String**|  | [optional] 
 **phone** | **String**|  | [optional] 
 **image** | **Uint8List**|  | [optional] 
 **isAgePublic** | **bool**|  | [optional] 
 **contribution** | **int**|  | [optional] 
 **deviceToken** | **String**|  | [optional] 
 **location** | **String**|  | [optional] 
 **status** | **bool**|  | [optional] 
 **verificationToken** | **String**|  | [optional] 
 **groups** | [**BuiltSet<int>**](int.md)| The groups this user belongs to. A user will get all permissions granted to each of their groups. | [optional] 
 **userPermissions** | [**BuiltSet<int>**](int.md)| Specific permissions for this user. | [optional] 

### Return type

[**User**](User.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersVerifyRead**
> VerifyAccountResponse usersVerifyRead(email, token)



### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: Basic
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('Basic').password = 'YOUR_PASSWORD';

var api_instance = new UsersApi();
var email = email_example; // String | 
var token = token_example; // String | 

try { 
    var result = api_instance.usersVerifyRead(email, token);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersVerifyRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 
 **token** | **String**|  | 

### Return type

[**VerifyAccountResponse**](VerifyAccountResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

