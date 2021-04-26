# openapi.model.User

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**password** | **String** |  | 
**lastLogin** | [**DateTime**](DateTime.md) |  | [optional] 
**isSuperuser** | **bool** | Designates that this user has all permissions without explicitly assigning them. | [optional] 
**username** | **String** | Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only. | 
**isStaff** | **bool** | Designates whether the user can log into this admin site. | [optional] 
**isActive** | **bool** | Designates whether this user should be treated as active. Unselect this instead of deleting accounts. | [optional] 
**dateJoined** | [**DateTime**](DateTime.md) |  | [optional] 
**age** | **int** |  | [optional] 
**address** | **String** |  | [optional] 
**email** | **String** |  | 
**firstName** | **String** |  | 
**lastName** | **String** |  | 
**gender** | **String** |  | [optional] 
**phone** | **String** |  | [optional] 
**image** | **String** |  | [optional] 
**isAgePublic** | **bool** |  | [optional] 
**contribution** | **int** |  | [optional] 
**deviceToken** | **String** |  | [optional] 
**location** | **String** |  | [optional] 
**status** | **bool** |  | [optional] 
**verificationToken** | **String** |  | [optional] 
**groups** | **BuiltSet<int>** | The groups this user belongs to. A user will get all permissions granted to each of their groups. | [optional] 
**userPermissions** | **BuiltSet<int>** | Specific permissions for this user. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


