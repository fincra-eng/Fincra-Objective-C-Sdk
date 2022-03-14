#import "SWGProfileApi.h"
#import "SWGQueryParamCollection.h"


@interface SWGProfileApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGProfileApi

static SWGProfileApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        SWGConfiguration *config = [SWGConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SWGApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SWGProfileApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGProfileApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SWGProfileApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGProfileApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SWGApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Get the Beneficiaries for a business
/// This endpoint provides the ability to retrieve a list of beneficiaries attached to a business. \n\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| page | string | Specify exactly what page you want to retrieve optional|\n| perPage | string | Specify how many records you want to retrieve per page optional|
///  @param businessID This could be the ID of the business or the ID of a sub-account of the business
///
///  @returns void
///
-(NSNumber*) gettheBeneficiariesforabusinessWithCompletionBlock: (NSString*) businessID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `gettheBeneficiariesforabusiness`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/beneficiaries/business/{businessID}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessID != nil) {
        pathParams[@"businessID"] = businessID;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Create a Beneficiary
/// This endpoint is used for creating a Beneficiary.  \n\n\n\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| firstName | string | required|\n| lastName | string | optional|\n| email | string |The email address of Beneficiary. required |\n| phoneNumber | string | optional  |\n| accountHolderName | string | required|\n| bank | object | see the information about this below. optional + name: bank name required  + code optional   + sortCode optional   + swiftCode optional  + branch  optional   + address: see the definition in address field below optional   |\n| type | string | The value for this field is either _corporate_ or _indivdual_required|\n| address | object | the physical address of the beneficiary and it comprises of the below: optional + country optional  + state optional   + zip required   + city required  + street  required  |\n| currency | string | The currency that Beneficiary would be paid in required|\n| paymentDestination | string | The value for this field is either _mobile_money_wallet_ or _bank_account_ required |\n| destinationAddress | string | see the definition belowrequired |\n| uniqueIdentifier | string | optional |\n\n\nValue Description for the destinationAddress field\n\n\nThe table below show that a destination address should be when given a certain payment destination.\n\n| paymentDestination | destinationAddress |\n|------| ------------- |\n| _mobile_money_wallet_ | phone number used for the wallet |\n| _bank_account_ | account number |
///  @param businessID businessID
///
///  @returns void
///
-(NSNumber*) createaBeneficiaryWithCompletionBlock: (NSString*) businessID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `createaBeneficiary`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/beneficiaries/business/{businessID}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessID != nil) {
        pathParams[@"businessID"] = businessID;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get a Beneficiary
/// This endpoint is used for retrieving a single beneficiary attached to a business.
///  @param businessID This could be the ID of the business or the ID of a sub-account of the business
///
///  @param beneficiaryID The reference or ID of the beneficiary
///
///  @returns void
///
-(NSNumber*) getaBeneficiaryWithCompletionBlock: (NSString*) businessID
         beneficiaryID: (NSString*) beneficiaryID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `getaBeneficiary`"];
    }
    
    // verify the required parameter 'beneficiaryID' is set
    if (beneficiaryID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `beneficiaryID` when calling `getaBeneficiary`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/beneficiaries/business/{businessID}/{beneficiaryID}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessID != nil) {
        pathParams[@"businessID"] = businessID;
    }
    if (beneficiaryID != nil) {
        pathParams[@"beneficiaryID"] = beneficiaryID;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Delete a Beneficiary
/// This endpoint is used for deleting a beneficiary.
///  @param businessID This could be the ID of the business or the ID of a sub-account of the business
///
///  @param beneficiaryID This is the beneficiary ID of the the benficiary
///
///  @returns void
///
-(NSNumber*) deleteaBeneficiaryWithCompletionBlock: (NSString*) businessID
         beneficiaryID: (NSString*) beneficiaryID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `deleteaBeneficiary`"];
    }
    
    // verify the required parameter 'beneficiaryID' is set
    if (beneficiaryID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `beneficiaryID` when calling `deleteaBeneficiary`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/beneficiaries/business/{businessID}/{beneficiaryID}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessID != nil) {
        pathParams[@"businessID"] = businessID;
    }
    if (beneficiaryID != nil) {
        pathParams[@"beneficiaryID"] = beneficiaryID;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"DELETE"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Update a Beneficiary
/// This endpoint is used for updating the information for a beneficiary. \n\n\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| firstName | string | required|\n| lastName | string | optional|\n| email | string |The email address of Beneficiary. required |\n| phoneNumber | string | optional  |\n| accountHolderName | string | optional|\n| bank | object | see the information about this below. optional + name: bank name required  + code optional   + sortCode optional   + swiftCode optional  + branch  optional   + address: see the definition in address field below optional   |\n| type | string | The value for this field is either _corporate_ or _indivdual_required|\n| address | object | the physical address of the beneficiary and it comprises of the below: optional + country optional  + state optional   + zip required   + city required  + street  required  |\n| currency | string | The currency that Beneficiary would be paid in required|\n| paymentDestination | string | The value for this field is either _mobile_money_wallet_ or _bank_account_ required |\n| destinationAddress | string | see the definition belowrequired |\n| uniqueIdentifier | string | optional |\n\n\n\nValue Description for the destinationAddress field\n\nThe table below show that a destination address should be when given a certain payment destination.\n\n| paymentDestination | destinationAddress |\n|------| ------------- |\n| _mobile_money_wallet_ | phone number used for the wallet |\n| _bank_account_ | account number |
///  @param businessID This could be the ID of the business or the ID of a sub-account of the business
///
///  @param beneficiaryID The reference or ID of the beneficiary
///
///  @returns void
///
-(NSNumber*) updateaBeneficiaryWithCompletionBlock: (NSString*) businessID
         beneficiaryID: (NSString*) beneficiaryID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `updateaBeneficiary`"];
    }
    
    // verify the required parameter 'beneficiaryID' is set
    if (beneficiaryID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `beneficiaryID` when calling `updateaBeneficiary`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/beneficiaries/business/{businessID}/{beneficiaryID}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessID != nil) {
        pathParams[@"businessID"] = businessID;
    }
    if (beneficiaryID != nil) {
        pathParams[@"beneficiaryID"] = beneficiaryID;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"PATCH"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get business Information
/// This endpoint is used for getting the information on the registered Merchant's business.
///  @returns void
///
-(NSNumber*) getbusinessInformationWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/business/me"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get  All Sub-accounts
/// This endpoint is used to retrieve all subaccounts for a business.
///  @param businessId The ID of the business
///
///  @returns void
///
-(NSNumber*) getAllSubAccountsWithCompletionBlock: (NSString*) businessId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessId' is set
    if (businessId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessId` when calling `getAllSubAccounts`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/business/{businessId}/sub-accounts"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessId != nil) {
        pathParams[@"businessId"] = businessId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Create Subaccount
/// This endpoint helps you create a sub-account.\n\nREQUEST BODY\n\n\n| Field | Data Type | description |\n|------| ------------- | ----------- |\n| name | string | Customer's name|\n| email | string | Customer's email |\n| mobile | string | Customer's phone number |\n| country | string | Customer's country e.g NG  |
///  @param businessId The ID of the business
///
///  @returns void
///
-(NSNumber*) createSubaccountWithCompletionBlock: (NSString*) businessId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessId' is set
    if (businessId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessId` when calling `createSubaccount`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/business/{businessId}/sub-accounts"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessId != nil) {
        pathParams[@"businessId"] = businessId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get  One Subaccount
/// This endpoint is used in retrieving one subaccount.
///  @param businessId The ID of the business
///
///  @param subAccountId The ID of the subaccount
///
///  @returns void
///
-(NSNumber*) getOneSubaccountWithCompletionBlock: (NSString*) businessId
         subAccountId: (NSString*) subAccountId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessId' is set
    if (businessId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessId` when calling `getOneSubaccount`"];
    }
    
    // verify the required parameter 'subAccountId' is set
    if (subAccountId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `subAccountId` when calling `getOneSubaccount`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/business/{businessId}/sub-accounts/{subAccountId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessId != nil) {
        pathParams[@"businessId"] = businessId;
    }
    if (subAccountId != nil) {
        pathParams[@"subAccountId"] = subAccountId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Update A Subaccount
/// This endpoint is used to update a subaccount.\n\nREQUEST BODY\n\n\n| Field | Data Type | description |\n|------| ------------- | ----------- |\n| name | string | Customer's name required|\n| email | string | Customer's email  required|\n| mobile | string | Customer's phone number  required|
///  @param businessId The ID of the business
///
///  @param subAccountId The ID of the subaccount
///
///  @returns void
///
-(NSNumber*) updateASubaccountWithCompletionBlock: (NSString*) businessId
         subAccountId: (NSString*) subAccountId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessId' is set
    if (businessId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessId` when calling `updateASubaccount`"];
    }
    
    // verify the required parameter 'subAccountId' is set
    if (subAccountId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `subAccountId` when calling `updateASubaccount`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/business/{businessId}/sub-accounts/{subAccountId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessId != nil) {
        pathParams[@"businessId"] = businessId;
    }
    if (subAccountId != nil) {
        pathParams[@"subAccountId"] = subAccountId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"PATCH"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Fetch Merchant Virtual Accounts
/// This endpoint fetches all virtual accounts belonging to a merchant\n\nREQUEST BODY\n\n* * *\n\n| Field | Data Type | Description |\n| --- | --- | --- |\n| page | string | Specify exactly what page you want to retrieve `required` |\n| perPage | string | Specify how many records you want to retrieve per page `required` |\n| filterBy | object | see note below `optional` |\n\nThe filterBy property is an object with the following attributes below that helps you filter accounts:\n\n*   status - `pending`, `approved` or `declined`\n*   currency - EUR or GBP\n*   accountType - corporate or individual
///  @returns void
///
-(NSNumber*) fetchMerchantVirtualAccountsWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/virtual-accounts"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get   Subaccount  Virtual Accounts
/// This endpoint is used for retrieving the virtual accounts of your Subaccounts.\n\nREQUEST BODY\n\n* * *\n\n| Field | Data Type | Description |\n| --- | --- | --- |\n| page | string | Specify exactly what page you want to retrieve `required` |\n| perPage | string | Specify how many records you want to retrieve per page `required` |\n| filterBy | object | see note below `optional` |\n\nThe filterBy property is an object with the following attributes below that helps you filter accounts:\n\n*   status - `pending`, `approved` or `declined`\n*   currency - EUR or GBP\n*   accountType - corporate or individual
///  @param businessId The ID of the business
///
///  @returns void
///
-(NSNumber*) getSubaccountVirtualAccountsWithCompletionBlock: (NSString*) businessId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessId' is set
    if (businessId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessId` when calling `getSubaccountVirtualAccounts`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/virtual-accounts/business/{businessId}/sub-accounts"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessId != nil) {
        pathParams[@"businessId"] = businessId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Request An EUR virtual Account  For A Subaccount
/// This endpoint is used for creating a virtual account for your customer/customers\n\n**Note**  \nThe first name and last name or business name of a virtual account should always match with the name of the Receiver specified when making payments to the Virtual account. Else such payments would be blocked. Therefore, kindly pass in the right details when requesting a virtual account.\n\nREQUEST BODY\n\n* * *\n\n| Field | Data type | Description |\n| --- | --- | --- |\n| currency | string | e.g EUR,GBP `required` |\n| accountType | string | The account type your customer wants. It should be either **individual** or **corporate** `required` |\n| KYCInformation | object | Verification of your customer Identity. See the tables below for KYC information for **Individual** and **Corporate** `required` |\n| meansOfId | file | Your means of identification from which should be a valid government ID e.g voters card, driving license .`Optional` for corporate virtual account . This should be a File Upload and not sent in Base64 format |\n| utilityBill | file | Electricity bills, water bills. `Optional` for corporate virtual account. This should be a File Upload and not sent in Base64 format |\n\n**Description of KYC Information Object for Individual**\n\n| Field | Data type | Description |\n| --- | --- | --- |\n| lastName | string | the last name of the individual `required` |\n| firstName | string | the first name of the individual `required` |\n| email | string | the email of the individual |\n| birthDate | dateFormat | YYYY-MM-DD `required` |\n| address | object | This contains all the required address information. They are:    \+ country: country of origin `required`  \+ zip `required`  \+ street `required`  \+ state `required`  \+ city `required` |\n| document | object | This contains the required information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `required`  \+ number `required`  \+ issuedCountryCode e.g NG `required`  \+ issuedBy `required`  \+ issuedDate with Format \"YYYY-mm-dd\" `required`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n| occupation | string | `required` |\n\n**Description of KYC Information Object for Corporate**\n\n| Field | Data type | Description |\n| --- | --- | --- |\n| businessName | string | `required` |\n| businessRegistrationNumber | string | `required` |\n| incorporationDate | string | `required` |\n| expectedInboundMonthlyTurnover | string | `required` |\n| website | string | `optional` |\n| email | string | `optional` |\n| address | string | This field is required and has the following fields:    \+ country: country of origin `required`  \+ zip `required`  \+ street `required`  \+ state `required`  \+ city `required` |\n| document | object | This field is required and has the following fields:    \+ type: type of ID document e.g International Passport `required`  \+ number `required`  \+ issuedCountryCode e.g NG `required`  \+ issuedBy `required`  \+ issuedDate with Format \"YYYY-mm-dd\" `required`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n| ultimateBeneficialOwners | array of objects | This field is required and each object in it should contain the following fields:    \+ lastName `required`  \+ firstName `required`  \+ ownershipPercentage `required`  \+ politicallyExposedPerson `required` |\n| businessActivityDescription | string | `required` |\n| businessCategory | string | This is required for USD,GBP and EUR virtual accounts requests but `optional` for NGN e.g Government agencies, Joint Venture, Political parties |\n| additionalInfo | string | This is required for USD,GBP and EUR virtual account requests |\n| attachments | file | `optional` |
///  @param businessId The ID of the business
///
///  @param subAccountId The ID of the subaccount
///
///  @returns void
///
-(NSNumber*) requestAnEURvirtualAccountForASubaccountWithCompletionBlock: (NSString*) businessId
         subAccountId: (NSString*) subAccountId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessId' is set
    if (businessId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessId` when calling `requestAnEURvirtualAccountForASubaccount`"];
    }
    
    // verify the required parameter 'subAccountId' is set
    if (subAccountId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `subAccountId` when calling `requestAnEURvirtualAccountForASubaccount`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/virtual-accounts/business/{businessId}/sub-accounts/{subAccountId}/requests"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (businessId != nil) {
        pathParams[@"businessId"] = businessId;
    }
    if (subAccountId != nil) {
        pathParams[@"subAccountId"] = subAccountId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get Virtual Account Requests
/// This endpoint is used for getting all virtual account requests tied to a merchant
///  @returns void
///
-(NSNumber*) getVirtualAccountRequestsWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/virtual-accounts/requests"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Request A Virtual Account
/// This endpoint is used for requesting a single virtual account or multiple virtual accounts for the same currency.\n\nREQUEST BODY\n\n* * *\n\n| Field | Data Type | Description |\n| --- | --- | --- |\n| currency | string | e.g GBP, EUR `required` for all currencies |\n| reason | number | This is `optional` for NGN |\n| monthlyVolume | string | This is `optional` for NGN |\n| entityName | string | This is `optional` for NGN |\n| KYCInformation | object | This is `optional` for NGN |\n\n**Description of KYC Information Object**\n\n| Field | Data type | Description |\n| --- | --- | --- |\n| businessCategory | string | `required` |\n| additionalInfo | string | `required` |
///  @returns void
///
-(NSNumber*) requestAVirtualAccountWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/virtual-accounts/requests"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}

///
/// Get One Virtual Account
/// This endpoint is used for retreiving a virtual account attached to a merchant
///  @param virtualAccountId The Id of the virtual account you want to retrieve
///
///  @returns void
///
-(NSNumber*) getOneVirtualAccountWithCompletionBlock: (NSString*) virtualAccountId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'virtualAccountId' is set
    if (virtualAccountId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `virtualAccountId` when calling `getOneVirtualAccount`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/profile/virtual-accounts/{virtualAccountId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (virtualAccountId != nil) {
        pathParams[@"virtualAccountId"] = virtualAccountId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: nil
                                      completionBlock: ^(id data, NSError *error) {
                  completionBlock(error);
                  
              }
          ];
}



@end
