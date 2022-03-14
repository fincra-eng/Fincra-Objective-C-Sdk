#import "SWGQuotesApi.h"
#import "SWGQueryParamCollection.h"


@interface SWGQuotesApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGQuotesApi

static SWGQuotesApi* singletonAPI = nil;

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

+(SWGQuotesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGQuotesApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SWGQuotesApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGQuotesApi alloc] init];
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
/// Get a quote
/// This endpoint is used for generating a quote.\n\nREQUEST BODY\n\n\n| Field | Data Type | Description |\n|------| ------------- | ----------- |\n| sourceCurrency | string | e.g _USD_ required|\n| destinationCurrency | string |  e.g _NGN_ required|\n| amount | string | required|\n| action | string | the values can be either \"_send_\" for conversions and disbursement or \"_receive_\" for collectionsrequired|\n| transactionType | string | the values here can be either _disbursement_ or _collection_ or _conversion_required |\n| business | string | This could be the ID of the business or the ID of a sub-account of the business required|\n| feeBearer | string | required  |\n| paymentDestination | string | See the note below |\n| paymentMethod | string | see the note below |\n| destinationCountry | string | This is the location where the money would be received required |\n| paymentScheme | string | This is the valid payment scheme for the destination currency you want to generate a quote for.Payment scheme is required for USD,EUR and GBP |\n\nNOTE\n\nIf destination currency is either USD,EUR,GBP a payment scheme is required .\n\nThe values of the _paymentDestination_ and _paymentMethod_ are either required or optional depending on the value of the _transactiontype_ field.\n\nWhen the value of the the _transactiontype_ field is _disbursement_, We will then have the below fields as:\n*   paymentDestination required\n*   paymentMethod optional\n\n\nWhen the value of the the _transactiontype_ field is _conversion_, We will then have the below fields as:\n*   paymentDestination optional\n*   paymentMethod optional\n\nWhen the value of the the _transactiontype_ field is _collection_, We will then have the below fields as:\n*   paymentDestination required\n*   paymentMethod required
///  @returns void
///
-(NSNumber*) getaquoteWithCompletionBlock: 
        
        (void (^)(NSError* error))completionBlock { 

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/quotes/generate"];

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



@end
