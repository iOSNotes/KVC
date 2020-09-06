//
//  ViewController.m
//  AutoBuild
//
//  Created by 秦传龙 on 2020/8/28.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
    pickerView.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerView.delegate = self;
    [self presentViewController:pickerView animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"%@ - %@", [info valueForKey:UIImagePickerControllerReferenceURL], info);
    [self dismissViewControllerAnimated:YES completion:nil];
    [self getImageDetailInfo:[info valueForKey:UIImagePickerControllerReferenceURL]];
}

-(void)getImageDetailInfo:(NSURL*)imageUrl{

    __block NSString* imageFileName;

    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc]init];

    [assetslibrary assetForURL:imageUrl resultBlock:^(ALAsset *asset) {
        ALAssetRepresentation*representation = [asset defaultRepresentation];

        imageFileName = [representation filename];

        NSLog(@"图片路径名：%@",imageFileName);

        NSLog(@"图片UTI：%@",[representation UTI]);

        NSLog(@"图片URL：%@",[representation url]);
    } failureBlock:nil];



}


@end
