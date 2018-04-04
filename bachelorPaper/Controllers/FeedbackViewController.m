//
//  FeedbackViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 22/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedbackDescriptionTableViewCell.h"
#import "EmailTableViewCell.h"
#import "LocalizationSystem.h"

@interface FeedbackViewController () <UITextViewDelegate, UITextFieldDelegate>

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = AMLocalizedString(@"feedback", nil);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    } else {
        return 150;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FeedbackDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DescriptionCellIdentifier" forIndexPath:indexPath];
        [self addPlaceholderForTextView:cell.feedbackDescriptionTextView];
        cell.feedbackDescriptionTextView.delegate = self;
        return cell;
    } else {
        EmailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmailTableViewCellIdentifier" forIndexPath:indexPath];
        cell.emailTextField.delegate = self;
        return cell;
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textView.textColor == [UIColor lightGrayColor]) {
        textView.text = nil;
        textView.textColor = [UIColor blackColor];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self addPlaceholderForTextView:textView];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // screenshot selection
        NSLog(@"!!!");
    }
}

- (void)addPlaceholderForTextView:(UITextView *)textView {
    if (textView.text == nil || [textView.text isEqualToString:@""]) {
        textView.text = AMLocalizedString(@"description_placeholder", nil);
        textView.textColor = [UIColor lightGrayColor];
    }
}

@end
