//
//  FNTableViewController.m
//  Fibonacci
//
//  Created by Lin Yang on 3/24/14.
//
//

#import "FNTableViewController.h"

@interface FNTableViewController ()

@property NSMutableArray *Fibonacci; // Array stores the Fibonacci series
@property NSInteger Max_n; // The number of Fibonacci numbers can be displayed

@end

@implementation FNTableViewController

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
    
    // Allocate memery for the array
    self.Fibonacci = [[NSMutableArray alloc] init];
    // Add first and second terms of the Fibonacci series
    [self.Fibonacci addObject:[NSNumber numberWithUnsignedLongLong:1]];
    [self.Fibonacci addObject:[NSNumber numberWithUnsignedLongLong:1]];
    
    NSInteger i = 1; // The accumulator which equals to n - 1
    // Calculate the next Fibonacci number until the last Fibonacci number is greater than unsigned integer maximum
    do
    {
        i++;
        // Calculate the nth Fibonacci number and append it to the array
        // Calculation is done in unsigned long long to ensure the Fibonacci number with value greater than unsigned integer maximum can be stored
        [self.Fibonacci addObject:[NSNumber numberWithUnsignedLongLong:[self.Fibonacci[i - 1] unsignedLongLongValue] + [self.Fibonacci[i - 2] unsignedLongLongValue]]];
    }
    while ([self.Fibonacci[i] unsignedLongLongValue] < (unsigned long long)UINT_MAX);
    // The last Fibonacci number in the array won't be displayed
    self.Max_n = i;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.Max_n;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FibonacciNumberCell" forIndexPath:indexPath];
    
    // Display F(n) in cells
    cell.textLabel.text = [NSString stringWithFormat:@"%llu", [self.Fibonacci[indexPath.row] unsignedLongLongValue]];
    // Display n in cells
    cell.detailTextLabel.text = [NSString stringWithFormat:@"n = %ld", (long)indexPath.row + 1];
    
    return cell;
}

@end
