//
//  ViewController.m
//  CoreData
//
//  Created by yibinpan on 8/4/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *name;
@property (strong, nonatomic) NSMutableArray *phone;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.name = [[NSMutableArray alloc]init];
    self.phone = [[NSMutableArray alloc]init];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", @"Vea Software"];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        NSLog(@"no matches");
    }
    else
    {
        for (int i = 0; i < [objects count]; i++) {
            matches = objects[i];
            
            [self.name addObject:[matches valueForKey:@"name"]];
            [self.phone addObject:[matches valueForKey:@"phone"]];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    
    [newContact setValue:@"Vea Software" forKey:@"name"];
    [self.name addObject:@"Vea Software"];
    
    [newContact setValue:@"555-555" forKey:@"phone"];
    [self.phone addObject:@"555-555"];
    
    NSError *error;
    [context save:&error];
    
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.name count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellId";
    UITableViewCell *cell;
    
    cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [self.name objectAtIndex:indexPath.row];
    //cell.description = [self.phone objectAtIndex:indexPath.row];
    
    return  cell;
    
}
@end
