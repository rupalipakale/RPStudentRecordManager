//
//  ViewController.m
//  RPCoreData
//
//  Created by Student P_07 on 01/02/17.
//  Copyright © 2017 vaishali. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"
#import "FourthViewController.h"

@interface ViewController (){
    NSManagedObjectContext *context;
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *userdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnActionSave:(id)sender {
   NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    if ([sender tag] ==1) {
        
        
        NSManagedObject *managedObj = [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:context];
        
        [managedObj setValue:[NSNumber numberWithInteger:[_txt1.text integerValue]] forKey:@"no"];
        [managedObj setValue:_txt2.text forKey:@"name"];
        
        [managedObj setValue:_txt3.text forKey:@"address"];
        [context save:nil];
  
    }else{
        SecondViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
       // obj.arrayList = array;
        [self.navigationController pushViewController:obj animated:YES];
        
        /*  
        for (NSManagedObject *obj in array) {
            NSLog(@"%@",obj);
            NSLog(@"%@",[obj valueForKey:@"name"]);
        NSLog(@"%@",[obj valueForKey:@"address"]);
            NSLog(@"%@",[obj valueForKey:@"no"]);
        }*/
    }
    
}

- (IBAction)btnActionSearch:(id)sender {
   
   /* if (![self validateEmailWithString:_txt1.text] ) {
        NSLog(@"Invalid");
    }else{
        NSLog(@"valid");
    }*/
    FourthViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"FourthViewController"];
    [self.navigationController pushViewController:obj animated:YES];
}
- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
