#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGApiClient.h"


/**
 * NOTE: This class is auto generated by the swagger code generator program. 
 * https://github.com/swagger-api/swagger-codegen 
 * Do not edit the class manually.
 */

@interface SWGWalletsApi: NSObject

@property(nonatomic, assign)SWGApiClient *apiClient;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGWalletsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(SWGWalletsApi*) sharedAPI;
///
///
/// Get all the wallets for a Business
/// This endpoints lists all wallets belonging to a business.
///
/// @param businessID This could be the ID of the business or the ID of a sub-account of the business
/// 
///
/// @return 
-(NSNumber*) getallthewalletsforaBusinessWithCompletionBlock :(NSString*) businessID 
    
    
    completionHandler: (void (^)(NSError* error))completionBlock;


///
///
/// Get a wallet
/// This endpoint provides the information regarding a specific wallet.
///
/// @param walletID The ID of the wallet
/// 
///
/// @return 
-(NSNumber*) getawalletWithCompletionBlock :(NSString*) walletID 
    
    
    completionHandler: (void (^)(NSError* error))completionBlock;



@end