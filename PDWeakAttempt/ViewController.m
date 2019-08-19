//
//  ViewController.m
//  PDWeakAttempt
//
//  Created by liang on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import "ViewController.h"
#import "PDWeakSingleton.h"
#import "NSObject+PDWeakImpl.h"
#import "NSObject+PDWeakAssociateProperty.h"

@interface Person : NSObject

- (void)sayHi;

@end

@implementation Person

- (void)sayHi {
    NSLog(@"Hi");
}

@end

@interface ViewController ()

@property (nonatomic, assign) Person *person;
@property (nonatomic, strong) NSObject *object;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.person sayHi];
    NSLog(@"release => %@", self.object.arg);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testWeakSingleton];
    [self testWeakImpl];
    [self testWeakAssociateProperty];
}

- (void)testWeakSingleton {
    PDWeakSingleton *singleton = [PDWeakSingleton sharedWeakInstance];
    [singleton log];
    
    PDWeakSingleton *singleton1 = [PDWeakSingleton sharedWeakInstance];
    [singleton1 log];

    PDWeakSingleton *singleton2 = [PDWeakSingleton sharedWeakInstance];
    [singleton2 log];
}

- (void)testWeakImpl {
    Person *person;
    person = [[Person alloc] init];
    self.person = person;
    
    // Open this code and the crash will disappear.
    /*
    [person pd_runAtDealloc:^{
        self.person = nil;
    }];
     */
    
    [self.person sayHi];
}

- (void)testWeakAssociateProperty {
    self.object = [[NSObject alloc] init];
    NSObject *object = [[NSObject alloc] init];
    self.object.arg = object;
    
    NSLog(@"has object => %@", self.object.arg);
}

@end
