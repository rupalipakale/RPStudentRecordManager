//
//  ThirdViewController.m
//  RPCoreData
//
//  Created by Student P_07 on 04/02/17.
//  Copyright © 2017 vaishali. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController (){
    NSManagedObjectContext *context;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
    context = delegate.persistentContainer.viewContext;
    NSManagedObject *manageObj = [_arrList objectAtIndex:_index];
   // NSInteger no = [NSNumber numberWithInteger:];
    _txt1.text = [NSString stringWithFormat:@"%@",[manageObj valueForKey:@"no"]];
    _txt2.text = [manageObj valueForKey:@"name"];
    _txt3.text = [manageObj valueForKey:@"address"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnActionUpdate:(id)sender {
    NSManagedObject *manageObj = [_arrList objectAtIndex:_index];
    [manageObj setValue:[NSNumber numberWithInteger:[_txt1.text integerValue]] forKey:@"no"];
    [manageObj setValue:_txt2.text forKey:@"name"];
    [manageObj setValue:_txt3.text forKey:@"address"];
    NSError *error;
    [context save:&error];
    if (error != nil) {
        NSLog(@"%@",error.localizedDescription);
    }
    
}
@end
