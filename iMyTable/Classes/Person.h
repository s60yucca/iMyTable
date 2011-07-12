//
//  Person.h
//  iMyTable
//
//  Created by nguyen khanh on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString * personID;
	NSString * email;
	NSString * password;
	NSString * phoneNUmber;
	NSString * title;
	NSString * firstName;
	NSString * middleName;
	NSString * lastName;
	NSString * isPrivate;
	NSString * address1;
	NSString * address2;
	NSString * address3;
	NSString * address4;
	NSString * _lat;
	NSString * _long;
	NSString * countryCode;
	NSString * accountOpened;
	NSString * secretQuestion;
	NSString * secretAnswer;
	NSString * isActive;
	NSString * cuisinePreference;
}
@property(nonatomic,retain)NSString * personID;
@property(nonatomic,retain)NSString * email;
@property(nonatomic,retain)NSString * password;
@property(nonatomic,retain)NSString * phoneNUmber;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * firstName;
@property(nonatomic,retain)NSString * middleName;
@property(nonatomic,retain)NSString * lastName;
@property(nonatomic,retain)NSString * isPrivate;
@property(nonatomic,retain)NSString * address1;
@property(nonatomic,retain)NSString * address2;
@property(nonatomic,retain)NSString * address3;
@property(nonatomic,retain)NSString * address4;
@property(nonatomic,retain)NSString * _lat;
@property(nonatomic,retain)NSString * _long;
@property(nonatomic,retain)NSString * countryCode;
@property(nonatomic,retain)NSString * accountOpened;
@property(nonatomic,retain)NSString * secretQuestion;
@property(nonatomic,retain)NSString * secretAnswer;
@property(nonatomic,retain)NSString * isActive;
@property(nonatomic,retain)NSString * cuisinePreference;
@end
