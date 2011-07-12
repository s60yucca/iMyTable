//
//  Person.m
//  iMyTable
//
//  Created by nguyen khanh on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize personID;
@synthesize email;
@synthesize password;
@synthesize phoneNUmber;
@synthesize title;
@synthesize firstName;
@synthesize middleName;
@synthesize lastName;
@synthesize isPrivate;
@synthesize address1;
@synthesize address2;
@synthesize address3;
@synthesize address4;
@synthesize _lat;
@synthesize _long;
@synthesize countryCode;
@synthesize accountOpened;
@synthesize secretQuestion;
@synthesize secretAnswer;
@synthesize isActive;
@synthesize cuisinePreference;

- (void) dealloc
{
	[personID release];
	[email release];
	[password release];
	[phoneNUmber release];
	[title release];
	[firstName release];
	[middleName release];
	[lastName release];
	[isPrivate release];
	[address1 release];
	[address2 release];
	[address3 release];
	[address4 release];
	[_lat release];
	[_long release];
	[countryCode release];
	[accountOpened release];
	[secretQuestion release];
	[secretAnswer release];
	[isActive release];
	[cuisinePreference release];
	[super dealloc];
}

@end
