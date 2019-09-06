//
//  PersonDetailViewController.m
//  ApplicationTest2
//
//  Created by Leonardo Cocerio on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "UserDefaultDB.h"

@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController

#pragma mark - Actions

- (IBAction)save:(id)sender {

    BOOL isEditMode  = self.person != nil;
    
    if(!isEditMode) {
        
        self.person = [NSMutableDictionary dictionary];
        
        self.person[@"id"] = [NSNumber numberWithInteger:[UserDefaultDB getLastUsableID]];
    }

    self.person[@"name"] = nameTextField.text;
    self.person[@"lastName"] = lastNameTextField.text;
    self.person[@"address"] = addressTextField.text;
    
    // salviamo
    [UserDefaultDB savePerson:self.person isInEditMode:isEditMode];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                           message:@"Salvataggio effettuato" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                           [self.navigationController popViewControllerAnimated:YES];
                                                           
                                                       }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

#pragma mark - Methods

#pragma mark - Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
 
    // facciamo sparire la tastiera premendo invio
    [textField resignFirstResponder];
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
