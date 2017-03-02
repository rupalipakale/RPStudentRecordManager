//
//  FourthViewController.m
//  RPCoreData
//
//  Created by Student P_07 on 04/02/17.
//  Copyright © 2017 vaishali. All rights reserved.
//

#import "FourthViewController.h"
#import "AppDelegate.h"
#import "SearchTableViewCell.h"

@interface FourthViewController (){
    NSManagedObjectContext *context;
    NSArray *arrayList;
}

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *delegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
    context = delegate.persistentContainer.viewContext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search"];
    if (cell == nil) {
        cell = [[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"search"];
        
    }
    NSManagedObject *obj = [arrayList objectAtIndex:indexPath.row];
    cell.lblName.text = [obj valueForKey:@"name"];
    cell.lblAddress.text = [obj valueForKey:@"address"];
    return cell;
}


- (IBAction)bthActionSearch:(id)sender {
    if ([_txtSearch.text isEqualToString:@""]) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please enter." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [controller addAction:action];
        [self presentViewController:controller animated:YES completion:nil];
    }else{
    [_txtSearch resignFirstResponder];
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
    NSString *string = [NSString stringWithFormat:@"name == '%@'",_txtSearch.text];
    NSPredicate *pred =
   pred =  [NSPredicate predicateWithFormat:string];
    [fetch setPredicate:pred];
        
       /* NSMutableArray *array = [[NSMutableArray alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:@1 forKey:@"id"];
        [dict setObject:@"A" forKey:@"name"];
        [array addObject:dict];
        
        dict = [[NSMutableDictionary alloc]init];
        [dict setObject:@2 forKey:@"id"];
        [dict setObject:@"B" forKey:@"name"];
        [array addObject:dict];
        
        dict = [[NSMutableDictionary alloc]init];
        [dict setObject:@3 forKey:@"id"];
        [dict setObject:@"C" forKey:@"name"];
        [array addObject:dict];
        dict = [[NSMutableDictionary alloc]init];
        [dict setObject:@4 forKey:@"id"];
        [dict setObject:@"C" forKey:@"name"];
        [array addObject:dict];
        NSPredicate *predicate= [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"name == '%@'",@"C"]];
       
        NSArray *arraytemp = [array filteredArrayUsingPredicate:predicate];
        NSLog(@"%@",arraytemp);*/
        
        
    arrayList = [context executeFetchRequest:fetch error:nil];
    
    if ([arrayList count]) {
        _txtSearch.text =@"";
        [_tbl reloadData];
    }else{
        _txtSearch.text =@"";
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error" message:@"No record found" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [controller addAction:action];
        [self presentViewController:controller animated:YES completion:nil];
    }
    NSLog(@"%@",arrayList);
    
    }
    //NSLog(@"%lu",(unsigned long)arrayList.count);
}
@end
