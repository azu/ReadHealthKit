//
// Created by azu on 2014/07/09.
//


#import "HealthDataTableViewController.h"
#import "HealthDataTableViewModel.h"
#import "Promise.h"


@interface HealthDataTableViewController ()
- (IBAction)handleReloadButton:(id)sender;
@property(nonatomic, strong) HealthDataTableViewModel *model;
@end

@implementation HealthDataTableViewController
- (IBAction)handleReloadButton:(id)sender {
    [self updateTableView];
}

- (HealthDataTableViewModel *)model {
    if (_model == nil) {
        _model = [[HealthDataTableViewModel alloc] init];
    }
    return _model;
}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    [self updateTableView];
}

- (void)updateTableView {
    [self.model reloadData].then(^{
        [self.tableView reloadData];
    }).catch(^(NSError *error) {
        UIAlertView *savedAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [savedAlert show];
        NSLog(@"error = %@", error);
    });
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return [self.model numberOfData];
}

- (void)updateCell:(UITableViewCell *) cell atIndexPath:(NSIndexPath *) path {
    cell.textLabel.text = [self.model dateTextAtIndexPath:path];
    cell.detailTextLabel.text = [self.model heightTextAtIndexPath:path];
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [self updateCell:cell atIndexPath:indexPath];
    return cell;
}


@end