//
//  ProfileViewController.h
//  iMyTable
//
//  Created by nguyen khanh on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@interface ProfileViewController : UIViewController {
	Person * person;
	
	IBOutlet UIScrollView * scrollView;
	IBOutlet UIView * introView;
	
	IBOutlet UITextField * firstName;
	IBOutlet UITextField * middleName;
	IBOutlet UITextField * surName;
	IBOutlet UITextField * title;
	IBOutlet UITextField * email;
	IBOutlet UITextField * phoneNumber;
	IBOutlet UITextField * address1;
	IBOutlet UITextField * address2;
	IBOutlet UITextField * address3;
	IBOutlet UITextField * address4;
	IBOutlet UITextField * secretQuestion;
	IBOutlet UITextField * secretAnswer;
	
	
}

@end
