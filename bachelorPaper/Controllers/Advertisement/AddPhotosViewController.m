//
//  AddPhotosViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 13/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "AddPhotosViewController.h"
#import "LocalizationSystem.h"
#import "BUKImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface AddPhotosViewController () <BUKImagePickerControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *photos;
@property (strong, nonatomic) UIImage *takenPicture;
@property (strong, nonatomic) BUKImagePickerController *imagePickerController;

@property (weak, nonatomic) IBOutlet UILabel *addPhotosLabel;
@property (weak, nonatomic) IBOutlet UILabel *addPhotosComment;
@property (weak, nonatomic) IBOutlet UIButton *addPhotosButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@end

@implementation AddPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    self.title = AMLocalizedString(@"add_photos", nil);
    
    [self configureAddPhotosButton];

    self.addPhotosLabel.text = AMLocalizedString(@"add_photos", nil);
    self.addPhotosComment.text = AMLocalizedString(@"add_photos_comment", nil);

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:AMLocalizedString(@"next", nil) style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed:)];
    doneButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (IBAction)addPhotosButtonPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:
                                @"Add picture from" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* photoLibrary = [UIAlertAction actionWithTitle:@"Photo library" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             self.imagePickerController = [[BUKImagePickerController alloc] init];
                                                             self.imagePickerController.delegate = self;
                                                             self.imagePickerController.mediaType = BUKImagePickerControllerMediaTypeImage;
                                                             self.imagePickerController.sourceType = BUKImagePickerControllerSourceTypeLibrary;
                                                             self.imagePickerController.allowsMultipleSelection = YES;
                                                             [self presentViewController:self.imagePickerController animated:YES completion:nil];
                                                         }];
    UIAlertAction* Cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                   }];
    [alert addAction:photoLibrary];
    [alert addAction:Cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

-(NSMutableArray *)fetchImagesFromAssetLibrary:(NSArray *)library
{
    NSMutableArray *pictures = [[NSMutableArray alloc]init];
    UIImage *pictureFormAsset;

    for(ALAsset *asset in library){
        pictureFormAsset = [self imageFromAsset:asset];
        [pictures addObject:pictureFormAsset];
    }
    return pictures;
}

- (UIImage *)imageFromAsset:(ALAsset *)asset {
    ALAssetRepresentation *representation = [asset defaultRepresentation];
    CGImageRef iref = [[asset defaultRepresentation] fullResolutionImage];
    return [UIImage imageWithCGImage:iref scale:[representation scale] orientation:(UIImageOrientation)[representation orientation]];
}

- (void)configureAddPhotosButton {
    self.addPhotosButton.layer.cornerRadius = 3;
    self.addPhotosButton.tintColor = [UIColor whiteColor];
    self.addPhotosButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    [self.addPhotosButton setTitle:AMLocalizedString(@"add_photos_button", nil) forState:UIControlStateNormal];
    [self.addPhotosButton setTitle:AMLocalizedString(@"add_photos_button", nil) forState:UIControlStateHighlighted];
}

- (void)nextButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"descriptionControllerSegue" sender:nil];
}

#pragma mark UiCollectionMethods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewPhotoItemIdentifier" forIndexPath:indexPath];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 95, 95)];
    imageView.contentScaleFactor = UIViewContentModeScaleAspectFit;
    imageView.image = [self.photos objectAtIndex:indexPath.row];

    UIImageView *removeIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(72, 0, 20, 20)];
    removeIconImageView.image = [UIImage imageNamed:@"remove-photo"];

    [imageView addSubview:removeIconImageView];
    [cell addSubview:imageView];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.photos removeObjectAtIndex:indexPath.row];
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.collectionview reloadSections:[NSIndexSet indexSetWithIndex:0]];
    });

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(95, 95);
}

#pragma mark BUKIMagePickerController methods

-(void)buk_imagePickerControllerDidCancel:(BUKImagePickerController *)imagePickerController
{
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
}

- (void)buk_imagePickerController:(BUKImagePickerController *)imagePickerController saveImages:(NSArray *)images withProgress:(NSUInteger)currentCount totalCount:(NSUInteger)totalCount {
    self.photos = images;
    self.takenPicture = images.firstObject;
    [imagePickerController dismissViewControllerAnimated:YES completion:NULL];
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.collectionview reloadSections:[NSIndexSet indexSetWithIndex:0]];
    });

}

-(void)buk_imagePickerController:(BUKImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets
{
    self.photos = [self fetchImagesFromAssetLibrary:assets];

    [imagePickerController dismissViewControllerAnimated:YES completion:NULL];
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.collectionview reloadSections:[NSIndexSet indexSetWithIndex:0]];
    });
}

@end
