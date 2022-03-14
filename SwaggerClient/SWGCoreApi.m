#import "SWGCoreApi.h"
#import "SWGQueryParamCollection.h"


@interface SWGCoreApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGCoreApi

static SWGCoreApi* singletonAPI = nil;

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

+(SWGCoreApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGCoreApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SWGCoreApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGCoreApi alloc] init];
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
/// Get Bank code
/// This endpoint provides a list of the banks and mobile money wallet providers with information like name, code and the list of branches and branch codes per bank based on a specified currency.\n\nThe **code** field in the below sample refers to the bank code for your bank account or the code of your mobile money provider. \n\n```json\n{\n {\n   \"id\": 147,\n   \"code\": \"GH010100\",\n   \"name\": \"BANK OF GHANA\",\n   \"isMobileVerified\": null,\n   \"branches\": [\n      {\n        \"id\": 1,\n        \"branchCode\": \"GH010101\",\n        \"branchName\": \"BANK OF GHANA-ACCRA\",\n        \"swiftCode\": \"BAGHGHAC\",\n        \"bic\": \"BAGHGHAC\"\n       }]\n },\n {\n  \"id\": 79,\n  \"code\": \"AIRTEL\",\n  \"name\": \"Airtel\",\n  \"isMobileVerified\": true,\n  \"branches\": null\n }\n}\n```
///  @param currency e.g NGN, GHS, KES
///
///  @returns void
///
-(NSNumber*) getBankcodeWithCompletionBlock: (NSString*) currency
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'currency' is set
    if (currency == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `currency` when calling `getBankcode`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/banks"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (currency != nil) {
        
        queryParams[@"currency"] = currency;
    }
    
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
/// Get branch Code
/// This endpoint provides a list of the branches for a bank and helps you get your branch code. To get a branch Code: \n+ Make a request to the endpoint that provides bank code with your desired currency \n+ Find your bank in the list returned.\n+ Check the id field of your bank information for your branch\n+ use the id field to make a request to this endpoint to get the list of branches for your bank\n+ Check the **branchCode** field of your branch information for the value of your branch code
///  @param bankId Id of the bank
///
///  @returns void
///
-(NSNumber*) getbranchCodeWithCompletionBlock: (NSString*) bankId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'bankId' is set
    if (bankId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `bankId` when calling `getbranchCode`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/banks/{bankId}/branches"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (bankId != nil) {
        pathParams[@"bankId"] = bankId;
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
/// Get a disbursement transaction by customer reference
/// This endpoint provides the details of a disbursement transaction through the use of a customer reference.
///  @param business The ID of the business
///
///  @param customerReference The reference of the customer/merchant
///
///  @returns void
///
-(NSNumber*) getadisbursementtransactionbycustomerreferenceWithCompletionBlock: (NSString*) business
         customerReference: (NSString*) customerReference
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'business' is set
    if (business == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `business` when calling `getadisbursementtransactionbycustomerreference`"];
    }
    
    // verify the required parameter 'customerReference' is set
    if (customerReference == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `customerReference` when calling `getadisbursementtransactionbycustomerreference`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/transactions/disbursements/by-customer-reference"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (business != nil) {
        
        queryParams[@"business"] = business;
    }
    if (customerReference != nil) {
        
        queryParams[@"customerReference"] = customerReference;
    }
    
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
/// Get a disbursement transaction by reference
/// This endpoint provides the details of a disbursement transaction through the use of its reference.
///  @param business The ID of business
///
///  @param reference The reference of the transaction
///
///  @returns void
///
-(NSNumber*) getadisbursementtransactionbyreferenceWithCompletionBlock: (NSString*) business
         reference: (NSString*) reference
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'business' is set
    if (business == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `business` when calling `getadisbursementtransactionbyreference`"];
    }
    
    // verify the required parameter 'reference' is set
    if (reference == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `reference` when calling `getadisbursementtransactionbyreference`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/transactions/disbursements/by-reference"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (business != nil) {
        
        queryParams[@"business"] = business;
    }
    if (reference != nil) {
        
        queryParams[@"reference"] = reference;
    }
    
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
/// Get the transactions for a Business
/// This endpoint provides a list of all the transactions for a business.\n\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| page | string | Specify exactly what page you want to retrieve optional|\n| perPage | string | Specify how many records you want to retrieve per page optional|\n| from | string| Specify start date with format \"YYYY-mm-dd\"  optional|\n| to | string| Specify end date with format \"YYYY-mm-dd\" optional|
///  @param businessID This could be the ID of the business or the ID of a sub-account of the business
///
///  @returns void
///
-(NSNumber*) getthetransactionsforaBusinessWithCompletionBlock: (NSString*) businessID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `getthetransactionsforaBusiness`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/transactions/search/business/{businessID}"];

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
/// Get the transactions for the sub-accounts of a Business
/// This provides a list of all the transactions for the sub-accounts of a Business.\n\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| page | string | Specify exactly what page you want to retrieve optional|\n| perPage | string | Specify how many records you want to retrieve per page optional|\n| from | string| Specify start date with format \"YYYY-mm-dd\"  optional|\n| to | string| Specify end date with format \"YYYY-mm-dd\" optional|
///  @param businessID The is the ID of a business
///
///  @returns void
///
-(NSNumber*) getthetransactionsforthesubAccountsofabusinessWithCompletionBlock: (NSString*) businessID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `getthetransactionsforthesubAccountsofabusiness`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/transactions/search/business/{businessID}/sub-accounts"];

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
/// Get a transaction for a business
/// This endpoint provides the details of a transaction through the use of its ID.
///  @param transactionID The reference or ID of the transaction
///
///  @returns void
///
-(NSNumber*) getatransactionforabusinessWithCompletionBlock: (NSString*) transactionID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'transactionID' is set
    if (transactionID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `transactionID` when calling `getatransactionforabusiness`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/core/transactions/{transactionID}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (transactionID != nil) {
        pathParams[@"transactionID"] = transactionID;
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
