//
//  ViewController.m
//  FrpSmarthome0.37.1
//
//  Created by  on 2021/10/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //frpclib run
        FrpclibRun([self getConfigFilePath]);
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新UI
            UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Frp已启动" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [al show];
        });
    });
}
- (NSString *)getConfigFilePath {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"ini"];
//    NSString *fileContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return path;
}

#pragma mark - action events


@end
