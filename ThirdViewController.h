//
//  ThirdViewController.h
//  RPCoreData
//
//  Created by Student P_07 on 04/02/17.
//  Copyright © 2017 vaishali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txt2;
@property (strong, nonatomic) IBOutlet UITextField *txt1;
@property (strong, nonatomic) IBOutlet UITextField *txt3;
@property (strong,nonatomic)NSArray *arrList;
@property (assign,nonatomic)NSInteger index;
- (IBAction)btnActionUpdate:(id)sender;
@end
