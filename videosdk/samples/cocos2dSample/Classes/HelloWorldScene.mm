#include "HelloWorldScene.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    cocos2d::Size visibleSize = Director::getInstance()->getVisibleSize();
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    auto closeItem = MenuItemImage::create(
                                           "87_meitu_1.png",
                                           "87_meitu_1.png",
                                           CC_CALLBACK_1(HelloWorld::menuShowAd, this));
    
	closeItem->setPosition(Vec2((origin.x + visibleSize.width - closeItem->getContentSize().width/2)/2 ,
                                (origin.y + closeItem->getContentSize().height/2)/2));

    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    this->addChild(menu, 1);
 
    return true;
}


void HelloWorld::menuShowAd(Ref* pSender)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showVideoNotification" object:nil];
}
