//
//  FourthViewController.h
//  RPCoreData
//
//  Created by Student P_07 on 04/02/17.
//  Copyright © 2017 vaishali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController
- (IBAction)bthActionSearch:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtSearch;
@property (strong, nonatomic) IBOutlet UITableView *tbl;

@end
