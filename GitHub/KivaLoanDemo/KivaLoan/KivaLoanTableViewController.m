//
//  KivaLoanTableViewController.m
//  KivaLoan
//
//  Created by Simon on 5/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "KivaLoanTableViewController.h"
#import "CustomTableCell.h"
#import "Loan.h"

#define kLatestLoanURL  [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/newest.json"]

@interface KivaLoanTableViewController () {
    NSMutableArray *loans;
}
@end

@implementation KivaLoanTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getLatestLoans
{
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:kLatestLoanURL] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (!error) {
            NSArray *latestLoans = [self fetchData:data];
            loans = [NSMutableArray arrayWithCapacity:10];
            
            if (latestLoans) {
                for (NSDictionary *loanDic in latestLoans) {
                    Loan *loan = [[Loan alloc] init];
                    loan.name = [loanDic objectForKey:@"name"];
                    loan.amount = [loanDic objectForKey:@"loan_amount"];
                    loan.use = [loanDic objectForKey:@"use"];
                    loan.country = [[loanDic objectForKey:@"location"] objectForKey:@"country"];
                    
                    [loans addObject:loan];
                }
            }
            
            // As this block of code is run in a background thread, we need to ensure the GUI
            // update is executed in the main thread
            [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];

        }
    }];
}


- (NSArray *)fetchData:(NSData *)response
{
    NSError *error = nil;
    NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
    
    if (error != nil) {
        NSLog(@"Error: %@", error.description);
        return nil;
    }
    
    NSArray* latestLoans = [parsedData objectForKey:@"loans"];
    
    return latestLoans;
}

- (void)reloadData
{
    // Reload table data
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (loans) {
        return [loans count];
    }

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Loan *loan = [loans objectAtIndex:indexPath.row];
    cell.loanName.text = loan.name;
    cell.loanUse.text = loan.use;
    cell.loanCountry.text = loan.country;
    cell.loanAmount.text = [NSString stringWithFormat:@"$%@", [loan.amount stringValue]];
    
    return cell;
}


@end
