# iOS从零到一搭建组件化项目架构
> 随着公司业务需求的不断迭代发展，工程的代码量和业务逻辑也越来越多，原始的开发模式和架构已经无法满足我们的业务发展速度了，这时我们就需要将原始项目进行一次重构大手术了。这时我们应该很清晰这次手术的动刀口在哪，就是之前的高度耦合的业务组件和功能组件，手术的目的就是将这些耦合拆分成互相独立的各个组件。

## 工程效果预览
![image](http://upload-images.jianshu.io/upload_images/6342050-a3211580aef1c283.jpg?imageMogr2/auto-orient/strip)

[组件化工程详解地址](https://www.jianshu.com/p/59c2d2c4b737)

### 下面我们围绕这几个问题来展开讲解

* 为什么要用组件化，它给我们带来哪些优势
* 各个组件该如何进行拆分，拆分的颗粒度该如何控制
* 如何从零到一搭建组件化架构项目

## 为什么要用组件化
我们先来张图看看在没有使用组件化前，我们各个模块间的依赖关系

![image](http://upload-images.jianshu.io/upload_images/6342050-872d698987796c0b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

从上面这种各个业务组件的依赖关系来看，他们是互相依赖的，业务组件和业务组件间产生了严重的耦合关系，这样一来对我们工程的扩展性就会大大的降低，维护成本就会变高。

举个例子：假设某天产品经理说，咱们公司的业务发展的太好了，咱们的营销模块需要独立出来成一个单独的应用，以便于咱们可以添加更多高效的营销手段。这时我们就傻眼了，需要独立出一个app出来，这可怎么搞啊，营销模块的代码和其他的很多业务代码耦合在一起了，现在要独立出来，那就只能重新写一个营销应用了，之前的代码剥离不干净了。

从上面我们列举的一个简单的例子可以体会到：在项目没有做到真真意义上的组件化之前，各个业务模块和业务模块间的高度耦合，功能组件和功能组件间的高度耦合对未来公司的业务扩展来说，成本很高，不能做到同样业务逻辑的代码的高度复用，这样对我们开发来说也是效率的降低。

好了，有的同学可能会说，既然上面各个模块间耦合这么高，那我就来将这些耦合解耦，于是，可能会出现下面这张图的模块间的关系。

![image](http://upload-images.jianshu.io/upload_images/6342050-3ca9d9a5293c60fd.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

从下面这张图来看，我们发现，现在确实能做到各个业务模块间完全的解耦了，他们不再互相依赖了，同时我们引入了一个中间调度者的一个角色，现在是各个业务模块和这个中间调度者角色产出了严重的依赖。我们思考下发现，我们的各个业务模块依赖这个中间调度者，这个是完全正常的，因为他们需要这个调度者来做统一的事件分发工作，但是这个调度者却又依赖了每个业务模块，这层依赖是有必要的吗？我们回头想想真正的组件化开发是完全的去依赖化，这个依赖是完全没有必要的。例如：假设我们现在有一个新的B APP需要开发，这时我们也需要用到这个中间调度者组件，但是我们不能直接拿过来用，因为它又依赖了很多A App的业务组件。因此，我们的组件化架构设计又需要一次升级变更了，升级成如下图所示的模型。

![image](http://upload-images.jianshu.io/upload_images/6342050-f2f7278c12bbe7e9.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

从上面的这张图，我们可以看出，各个业务模块间只会依赖中间调度者，并且中间调度者不对各个模块产生任何的依赖。

好了，从上面的三张图之间的对比，我们就可以很好的理解为什么我们的工程急需要实现组件化架构开发了，以及各自的优劣势。

## 各个组件该如何进行拆分
> 关于组件该如何拆分，这个没有一个完整的标准，因为每个公司的业务场景不一样，对应衍生出来的各个业务模块也就不一样，所以业务组件间的拆分，这个根据自己公司的业务模块来进行合理的划分即可。这里我们来说下整个工程的组件大致的划分方向

1. 项目主工程：当我们工程完全使用组件化架构进行开发后，我们会惊奇的发现我们的主工程就成了一个空壳子工程。因为所有的主工程呈现出来的内容都被拆分成了各个独立的业务组件了，包括各个工具组件也是各自互相独立的。这样我们发现开发一个完整的APP就像是搭建乐高积木一样，各个部件都有，任我们随意的组合搭建，这样是不是感觉很爽。
2. 业务组件：业务组件就是我们上面示例图所示的各个独立的产品业务功能模块，我们将其封装成独立的组件。例如示例Demo中的电子发票业务组件，业务组件A，业务组件B。我们通过组装各个独立的业务组件来搭建一个完整的APP项目。
3. 基础工具类组件：基础工具类是各个互相独立，没有任何依赖的工具组件。它们和其它的工具组件、业务组件等没有任何依赖关系。这类组件例如有：对数组，字典进行异常保护的Safe组件，对数组功能进行扩展Array组件，对字符串进行加密处理的加密组件等等。
4. 中间件组件：这个组件比较特殊，这个是我们为了实现组件化开发而衍生出来的一个组件，上面示例图中的中间调度者就是一个功能独立的中间件组件。
5. 基础UI组件：视图组件就比较常见了，例如我们封装的导航栏组件，Modal弹框组件，PickerView组件等。
6. 业务工具组件：这类组件是为各个业务组件提供基础功能的组件。这类组件可能会依赖到其他的组件。例如：网络请求组件，图片缓存组件，jspatch组件等等

**至于组件的拆分颗粒度，这个着实不好去断定，因人而异，不同的需求功能复杂度拆分出来的组件大小也不尽相同**

## 如何从零到一搭建组件化架构
> 在讲如何从零到一来实现一个组件化架构项目前，我们需要熟练掌握使用pod来制作组件库。下面我们就围绕提供的组件化示例项目来展开讲解。

**首先，我们来看示例Demo中包含哪些业务组件(如下图所示：)：**

![image](http://upload-images.jianshu.io/upload_images/6342050-f997b06e8b0e4aa5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

示例Demo中，我提供了三个业务组件来作为演示效果，其中业务模块A和业务模块B是临时业务模块组件，电子发票业务组件时真实的企业需求功能组件。

**我们再来看下示例Demo中都提供了哪些工具组件(如下图所示)**

> **注意了：这里提供的6个工具组件也都是作者已经封装好的功能组件，大家也可以直接 install 安装使用的哦。**

![image](http://upload-images.jianshu.io/upload_images/6342050-3118e206c17518f4.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 详细操作步骤

**第一步：**

我们先创建一个空的iOS工程项目:MainProject，这个空项目作为我们的主工程项目，就是上面所说的壳子工程项目，然后初始化pod，这里不清楚pod的使用的小伙伴们请自行查阅资料。

**第二步：**

我们创建一个空工程项目:ModuleA，这个ModuleA 项目作为我们的业务A组件。然后我们初始化pod，初始化podspec文件。

**第三步：**

我们创建一个空工程项目:ModuleB，这个ModuleB 项目作为我们的业务B组件。然后我们初始化pod，初始化podspec文件。

**第四步：**

我们创建一个空工程项目:ComponentMiddleware，这个项目就是我们上面所说的中间调度者。然后我们初始化pod，初始化podspec文件。

**第五步：**

我们创建一个空工程项目: ModuleACategory，这个工程是对应业务组件A的一个分类工程。然后我们初始化pod，初始化podspec文件。

**第六步：**

我们创建一个空工程项目: ModuleBCategory，这个工程是对应业务组件B的一个分类工程。然后我们初始化pod，初始化podspec文件。


好了，上面的主工程和两个业务组件工程，以及两个组件分类工程都已创建完毕，下面我们来讲解他们各个之间如何工作的。我就从主工程加载业务组件开始往下捋，顺藤摸瓜式的引出每个工程的用意。

**第七步：**

我们在主工程MainProject的Podfile中引入我们的业务组件B工程ModuleB，以及引入我们的ModuleB的分类工程：ModuleBCategory。然后我们pod install。这时已将这两个组件库引入到我们的主工程中了。

示例代码如下：

```
# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/guangqiang-liu/GQSpec.git'

target 'GQComponentDemo' do
  
  pod 'ModuleB'
  pod 'ModuleBCategory'
end
```

然后我们在主工程中添加一个按钮事件，这个事件是点击 push 到业务组件B的 页面。

示例代码如下：

```
#import <ModuleBCategory/ComponentScheduler+ModuleB.h>

- (void)moduleB {
    UIViewController *VC = [[ComponentScheduler sharedInstance] ModuleB_viewControllerWithCallback:^(NSString *result) {
        NSLog(@"resultB: --- %@", result);
    }];
    [self.navigationController pushViewController:VC animated:YES];
}
```

**第八步：**


上面第七步中，我们用到了ModuleBCategory 这个分类工程。这个工程我们只对外暴露了两个文件。这两文件是上面的中间调度者的分类，也就是说是中间件的分类。我们先来看下这个分类文件的.h 和.m 实现。

**.h**

```
#import "ComponentScheduler.h"

@interface ComponentScheduler (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback;

@end
```

**.m**

```
#import "ComponentScheduler+ModuleB.h"

@implementation ComponentScheduler (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    return [self performTarget:@"ModuleB" action:@"viewController" params:params shouldCacheTarget:NO];
}
@end

```

我们发现这个分类实现非常的简单，就是对外暴露一个函数，然后执行`[self performTarget:@"ModuleB" action:@"viewController" params:params shouldCacheTarget:NO];` ，并将执行的返回值返回出去。

这个分类的作用你可以理解为我们提前约定好Target的名字和Action的名字，因为这两个名字中间件组件中会用到。

上面的`performTarget:action:params:shouldCacheTarget` 函数是中间件提供的函数。因为ModuleBCategory 是 ComponentScheduler(中间件)的分类文件，所以可以调用到这个函数啦。

在ModuleBCategory 工程中需要引用到了中间件工程所以我们需要在ModuleBCategory 的Podfile文件中引用 中间件组件

示例代码如下：

```
# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/guangqiang-liu/GQSpec.git'

target 'ModuleB-Category' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for ModuleB-Category
  
  pod 'ComponentScheduler'

end
```

**第九步：**

因为上面第八步中引用到中间件工程，这里我们就来看下中间件工程到底做了什么工作。还记得上面第八步中，我们调用了一个中间件提供的函数：`performTarget:action:params:shouldCacheTarget` 吧，这个是中间件核心函数。

核心函数代码块如下：

![image](http://upload-images.jianshu.io/upload_images/6342050-6ff4b1198191afe2.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

还记得上面第八步中，我们调用这个函数传递的参数吧，我们在把调用代码拿过来看下

`[self performTarget:@"ModuleB" action:@"viewController" params:params shouldCacheTarget:NO];`

我们可以看到 `TargetName ` 是我们传递的 `ModuleB`，`action`是我们传递的`viewController`，然后我们将 这两个参数传给了下面的函数：

`[self safePerformAction:action target:target params:params];`

我们来看下这两个参数的值具体是什么：

![image](http://upload-images.jianshu.io/upload_images/6342050-5fc6fb258294b611.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这个函数最终调用到苹果官方提供的函数：`[target performSelector:action withObject:params];`

看到 `performSelector: withObject: ` 大家应该就比较熟悉了，iOS的消息传递机制。

```
[Target_ModuleB performSelector:Action_viewController withObject:params];
```

上面这行伪代码意思是: `Target_ModuleB`这个类 调用它的 `Action_viewController:` 方法，然后传递的参数为 `params `。

细心的小伙伴们就会发现，我们没有看到过哪里有这个`Target_ModuleB ` 类啊，更没有看到`Target_ModuleB ` 调用它的 `Action_viewController:` 方法啊。

是的，这个`Target_ModuleB `类和类的`Action_viewController `方法就在第十步中讲解到。

**第十步：**

终于到了最后一步了，写的好艰辛，嗯，小伙们不要捉急，快了，快讲完了

细心的小伙们发现，我们上面讲的9步中，好像都没有提业务组件B的东西。是的，业务组件B除了提供组件B的业务功能外，业务组件B还需要为我们提供一个Target文件。

我们先来看下业务组件B的业务代码：

示例代码如下：

```
#import "ModuleBViewController.h"
#import "PageBViewController.h"

@interface ModuleBViewController ()

@end

@implementation ModuleBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我是模块B业务组件";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 300, 100);
    btn.backgroundColor = [UIColor greenColor];
    btn.center = self.view.center;
    [btn setTitle:@"模块B业务功能组件" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)push {
    PageBViewController *VC = [[PageBViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
```

我们发现，业务组件B的业务代码也很简单，就是做一个push 跳转操作，从PageA 控制器跳转到 PageB 控制器。 这个没有什么好讲的

我们再来看上面提到的target文件

示例代码如下：

**.h**

```
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Target_ModuleB : NSObject

- (UIViewController *)Action_viewController:(NSDictionary *)params;

@end
```

**.m**

```
#import "Target_ModuleB.h"
#import "ModuleBViewController.h"

@implementation Target_ModuleB

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    ModuleBViewController *VC = [[ModuleBViewController alloc] init];
    return VC;
}

@end

```

从上面的实现文件中，我们可以看到，Target文件的作用也很简单，就是为我们提供导航跳转的目标控制器实例对象。这里的目标控制器实例就是业务组件B的`ModuleBViewController` 实例。

细心的小伙伴们发现，咦！我们在第九步中打印出来的`target` 和 `action` 不就正是Target文件的`Target_ModuleB ` 和 `Action_viewController:` 。

上面我们只是串讲了业务组件B的一系列流程，业务组件A的用法和业务组件B的用法一样，如果后面再有业务组件C，D，都是一样的道理，就不再一一讲解了。

好了，现在小伙伴们应该看懂了这一连串的工作流程了吧，如果还没有看懂，那就重新看一遍咯。作者建议直接运行提供的示例Demo项目进行调试，这样便于理解各个组件之间的关系。 

[组件化工程详解地址](https://www.jianshu.com/p/59c2d2c4b737)

**最后，我们再来看张组件化完整的架构图：**

![image](http://upload-images.jianshu.io/upload_images/6342050-6db65dfbc259432d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


# 总结
> 上面我们讲解的只是简单的项目组件化架构的基础框架搭建，但是在真正的企业开发中，我们只搭建这样一个简单项目框架结构还远远不能满足需求的开发，我们还需要在项目框架中添枝加叶来满足现有需求。在上面提供的示例Demo中，我将电子发票业务组件独立成一个完整的工程，并结合了当下比较流行的MVVM设计模式和RAC数据绑定框架来实现电子发票模块的功能开发。如果有小伙们对 MVVM + RAC 实战开发感兴趣的，可以单独 install 电子发票工程查看，工程地址:[iOS-MVVM-RAC](https://github.com/guangqiang-liu/iOS-MVVM-RAC)


##### 好了，又写到凌晨了，不早了，本篇教程到此就讲完了。下篇教程讲解如何使用MVVM+RAC进行实战开发。小伙伴们，感觉文章对你有帮忙，简书点个赞呗，开源组件化工程项目 [RAC+MVVM](https://github.com/guangqiang-liu/iOS-Component-Demo) 也帮忙点个 star ，先谢过。

## 更多文章
* 作者React Native开源项目OneM地址(按照企业开发标准搭建框架完成开发的)：**[https://github.com/guangqiang-liu/OneM](https://github.com/guangqiang-liu/OneM)**：欢迎小伙伴们 **star**
* 作者简书主页：包含60多篇RN开发相关的技术文章[http://www.jianshu.com/u/023338566ca5](http://www.jianshu.com/u/023338566ca5) 欢迎小伙伴们：**多多关注**，**多多点赞**
* React Native QQ技术交流群(600+ RN工程师)：**620792950** 欢迎小伙伴进群交流学习
* iOS QQ技术交流群：**678441305** 欢迎小伙伴进群交流学习
