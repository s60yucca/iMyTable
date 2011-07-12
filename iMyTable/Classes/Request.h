//
//  Request.h
//  iFlower
//
//  Created by thohd on 7/23/10.
//  Copyright 2010 iNIL.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject {
	NSMutableData* json_;
	NSURLConnection* connection_;
	NSMutableArray* entries_;
}
@property (nonatomic,readonly) NSArray * entries;
@property (nonatomic,readonly) NSData * xmlData;

+ (Request *)sharedRequest;

- (void) getLogin: (NSString*)email password: (NSString*)password;
- (void) getRegister: (NSString*)email password: (NSString*)password;
- (void) restaurantGetByName: (NSString*)name;
- (void) restaurantGetByType: (NSString*)type;
- (void) restaurantGetByNewLocal: (NSString*)address3 address: (NSString*)address4;
- (void) restaurantGetByRating: (NSString*)rate;
- (void) restaurantGetAllType;
- (void) personPWDChange:(NSString*)personID email:(NSString*)email oldPWD:(NSString*)oldPWD newPWD:(NSString*)newPWD;
@end
