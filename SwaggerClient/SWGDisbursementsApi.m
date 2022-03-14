#import "SWGDisbursementsApi.h"
#import "SWGQueryParamCollection.h"


@interface SWGDisbursementsApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGDisbursementsApi

static SWGDisbursementsApi* singletonAPI = nil;

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

+(SWGDisbursementsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGDisbursementsApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SWGDisbursementsApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGDisbursementsApi alloc] init];
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
/// Make A Payout
/// This endpoint is used for making a payment out to the beneficiaries of the business who are not registered on our platform\n\nREQUEST BODY\n\n* * *\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| sourceCurrency | string | The currency which the business is to send payment in `required` |\n| destinationCurrency | string | The currency which the beneficiary is to receive payment in`required` |\n| amount | string | The amount to be paid out`required` |\n| business | string | This could be the ID of the business or the ID of a sub-account of the business `required` |\n| description | string | `required` |\n| customerReference | string | This is the unique reference generated for the transaction on your platform `optional` |\n| beneficiary | object | See the description of the beneficiary object below`required` |\n| paymentDestination | string | This is where the payment is to be made. the value will be one of the following: *bank_account*, *mobile_money_wallet* `required` |\n| quoteReference | string | This is required if the payout is a cross currency payout(e.g, NGN to USD). If this is a single currency payout (e.g, EUR to EUR), a quote reference is not required. To get a quote reference, you will need to call the generate quote endpoint below |\n| paymentScheme | string | This is the valid payment scheme for the destination currency.Payment scheme is required for all USD,EUR and GBP payouts |\n\nThe beneficiaries information varies based on the currency and beneficiary type (individual or corporate). Find the breakdown of the beneficiaries object below:\n\nDescription of `INDIVIDUAL` or `CORPORATE` Beneficiary information for `NGN` and `KES` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| lastName | string | The last name of the beneficiary. it is `required` if type is **individual** and `optional` if type is **corporate** |\n| firstName | string | The first name of the beneficiary if type is **individual** or the name of the corporation if type is **corporate** `required` |\n| accountNumber | string | This is the bank account number of the beneficiary or phone number if the account is a mobile money wallet. `required` |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| bankCode | string | This value is either the code for your bank or mobile money wallet provider. To get this value, you will need to call the get bank code endpoint below `required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n\nDescription of `INDIVIDUAL` or `CORPORATE` Beneficiary information for `GHS` and `ZAR` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| lastName | string | The last name of the beneficiary. it is `required` if type is **individual** and `optional` if type is **corporate** |\n| firstName | string | The first name of the beneficiary if type is **individual** or the name of the corporation if type is **corporate** `required` |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This is the bank account number of the beneficiary or phone number if the account is a mobile money wallet. `required` |\n| bankCode | string | This value is either the code for your bank or mobile money wallet provider. To get this value, you will need to call the get bank code endpoint below `required` |\n| sortCode(branchCode) | string | To get this code, you will need to call the get bank branch endpoint below `required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n\nDescription of `INDIVIDUAL` Beneficiary information for `EUR` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| lastName | string | The last name of the beneficiary. it is `required` |\n| firstName | string | The first name of the beneficiary |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This value of this field will be IBAN of the beneficiary. Depending on the country, the IBAN is mostly made up of the following format: *Country code + check digits + bank code + sort code + account number*. Kindly visit this page to see the IBAN format for different countries.`required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n| mobile | string | `optional` |\n| bankSwiftCode | string | `optional` |\n| birthDate | string | `optional` |\n| birthPlace | string | `optional` |\n| address | object | This contains all the optional address information. They are:    \+ country: country of origin `optional`  \+ zip `optional`  \+ street `optional`  \+ state `optional`  \+ city `optional` |\n| document | object | This contains the optional information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `optional`  \+ number `optional`  \+ issuedCountryCode e.g NG `optional`  \+ issuedBy `optional`  \+ issuedDate with Format \"YYYY-mm-dd\" `optional`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n\nDescription of `CORPORATE` Beneficiary information for `EUR` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This value of this field will be IBAN of the beneficiary. Depending on the country, the IBAN is mostly made up of the following format: *Country code + check digits + bank code + sort code + account number*. Kindly visit this page to see the IBAN format for different countries.`required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n| mobile | string | `optional` |\n| bankSwiftCode | string | `optional` |\n| registrationNumber | string | `optional` |\n| address | object | This contains all the optional address information. They are:    \+ country: country of origin `optional`  \+ zip `optional`  \+ street `optional`  \+ state `optional`  \+ city `optional` |\n| document | object | This contains the optional information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `optional`  \+ number `optional`  \+ issuedCountryCode e.g NG `optional`  \+ issuedBy `optional`  \+ issuedDate with Format \"YYYY-mm-dd\" `optional`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n\nDescription of `CORPORATE` Beneficiary information for `GBP` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This should be the beneficiary's account number`required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n| mobile | string | `optional` |\n| bankSwiftCode | string | `optional` |\n| sortCode | string | `required` |\n| registrationNumber | string | `optional` |\n| address | object | This contains all the optional address information. They are:    \+ country: country of origin `optional`  \+ zip `optional`  \+ street `optional`  \+ state `optional`  \+ city `optional` |\n| document | object | This contains the optional information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `optional`  \+ number `optional`  \+ issuedCountryCode e.g NG `optional`  \+ issuedBy `optional`  \+ issuedDate with Format \"YYYY-mm-dd\" `optional`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n\nDescription of `INDIVIDUAL` Beneficiary information for `GBP` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| lastName | string | The last name of the beneficiary. it is `required` |\n| firstName | string | The first name of the beneficiary |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This should be the beneficiary's account number`required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n| mobile | string | `optional` |\n| bankSwiftCode | string | `optional` |\n| sortCode | string | `required` |\n| birthDate | string | `optional` |\n| birthPlace | string | `optional` |\n| address | object | This contains all the optional address information. They are:    \+ country: country of origin `optional`  \+ zip `optional`  \+ street `optional`  \+ state `optional`  \+ city `optional` |\n| document | object | This contains the optional information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `optional`  \+ number `optional`  \+ issuedCountryCode e.g NG `optional`  \+ issuedBy `optional`  \+ issuedDate with Format \"YYYY-mm-dd\" `optional`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n\nDescription of `CORPORATE` Beneficiary information for `USD` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This should be the beneficiary's account number`required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n| mobile | string | `optional` |\n| bankSwiftCode | string | `required` |\n| sortCode | string | `required` |\n| registrationNumber | string | `optional` |\n| address | object | This contains all the optional address information. They are:    \+ country: country of origin `optional`  \+ zip `optional`  \+ street `optional`  \+ state `optional`  \+ city `optional` |\n| document | object | This contains the optional information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `optional`  \+ number `optional`  \+ issuedCountryCode e.g NG `optional`  \+ issuedBy `optional`  \+ issuedDate with Format \"YYYY-mm-dd\" `optional`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |\n\nDescription of `INDIVIDUAL` Beneficiary information for `USD` payout:\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| lastName | string | The last name of the beneficiary. it is `required` |\n| firstName | string | The first name of the beneficiary |\n| accountHolderName | string | This is the name on the bank account of the beneficiary. `required` |\n| accountNumber | string | This should be the beneficiary's account number`required` |\n| type | string | the value can either be **individual** or **corporate** `required` |\n| country | string | `optional` |\n| email | string | `optional` |\n| mobile | string | `optional` |\n| bankSwiftCode | string | `required` |\n| sortCode | string | `required` |\n| birthDate | string | `optional` |\n| birthPlace | string | `optional` |\n| address | object | This contains all the optional address information. They are:    \+ country: country of origin `optional`  \+ zip `optional`  \+ street `optional`  \+ state `optional`  \+ city `optional` |\n| document | object | This contains the optional information in your means of identification. They are:    \+ type: type of ID document e.g International Passport `optional`  \+ number `optional`  \+ issuedCountryCode e.g NG `optional`  \+ issuedBy `optional`  \+ issuedDate with Format \"YYYY-mm-dd\" `optional`  \+ expirationDate with Format \"YYYY-mm-dd\" `optional` |
///  @returns void
///
-(NSNumber*) makeAPayoutWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/disbursements/payouts"];

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
/// Make  An Internal  Payout
/// This endpoint is used for making a payment out to a customer/user/subaccount on our platform\n\nREQUEST BODY\n\n* * *\n\n| Field | Data Type | description |\n| --- | --- | --- |\n| amount | string | The amount to be paid out`required` |\n| business | string | This could be the ID of the business or the ID of a sub-account of the business `required` |\n| customerReference | string | This is the unique reference generated for the transaction on your platform. `required` |\n| description | string | `required` |\n| beneficiaryWalletNumber | string | This is the unique wallet of the beneficiary you want to pay to `required` |
///  @returns void
///
-(NSNumber*) makeAnInternalPayoutWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/disbursements/payouts/wallets"];

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
/// Get all settlements for a Business
/// This endpoint provides a list of all the settlements for a business.\n\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| page | string | Specify exactly what page you want to retrieve optional|\n| perPage | string | Specify how many records you want to retrieve per page optional|\n| from | string| Specify start date with format \"YYYY-mm-dd\"  optional|\n| to | string| Specify end date with format \"YYYY-mm-dd\" optional|
///  @param businessID businessID
///
///  @returns void
///
-(NSNumber*) getallsettlementsforaBusinessWithCompletionBlock: (NSString*) businessID
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'businessID' is set
    if (businessID == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `businessID` when calling `getallsettlementsforaBusiness`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/disbursements/settlements/search/business/{businessID}"];

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
/// Get a settlement for a business
/// This endpoint provides the details of a settlement through the use of its ID.
///  @param settlementId settlementId
///
///  @returns void
///
-(NSNumber*) getasettlementforabusinessWithCompletionBlock: (NSString*) settlementId
        
        
        completionHandler: (void (^)(NSError* error))completionBlock { 

    
    // verify the required parameter 'settlementId' is set
    if (settlementId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `settlementId` when calling `getasettlementforabusiness`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/disbursements/settlements/{settlementId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (settlementId != nil) {
        pathParams[@"settlementId"] = settlementId;
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
