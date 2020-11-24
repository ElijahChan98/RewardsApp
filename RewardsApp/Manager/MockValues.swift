//
//  MockValues.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

struct MockValues {
    static let mockLoginUser = ["id": "123-456-789-abc-def",
                                "first_name": "Elijah",
                                "last_name": "Chan",
                                "mobile": "09123456678",
    ]
    static let mockUserProfile = ["id" : "123-456-789-abc-def",
                                  "first_name": "Elijah",
                                  "last_name": "Chan",
                                  "mobile": "09123456678",
                                  "is_verified": false,
                                  "referral_code": "qwe123"
    ] as [String : Any]
    
    // SAMPLE PROMO REWARDS
    
    static let sampleReward1 = ["id":"1",
                                    "name":"Shopee 50% Off Voucher",
                                    "description":"Get 50% off on any purchase when this reward is availed",
                                    "image":"https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?size=626&ext=jpg",
    ]
    
    static let sampleReward2 = ["id":"2",
                                    "name":"Lazada Special Flash Sale Reward",
                                    "description":"Get special Lazada discounts on select items while flash sale is on",
                                    "image":"https://image.shutterstock.com/image-vector/brush-sale-banner-promotion-ribbon-260nw-1182942766.jpg",
    ]
    
    static let sampleReward3 = ["id":"3",
                                    "name":"P200 Cashback Program on Swimwears",
                                    "description":"Use this promo code on checkout to get P200 off any purchase!",
                                    "image":"https://blog.magezon.com/wp-content/uploads/2020/08/fashion-promotion-banner-sample.png",
    ]
    
    static let sampleReward4 = ["id":"4",
                                    "name":"$149 For A Brand New Laptop From Lenovo!",
                                    "description":"Save $50 when you avail this new Lenovo laptop for $149*",
                                    "image":"https://s3.amazonaws.com/newfiles.bannersnack.net/site/images/landingPages/gallery/bcma6f3jo",
    ]
    
    static let sampleReward5 = ["id":"5",
                                    "name":"Agoda 10% off on all bookings!",
                                    "description":"Get 10% off ALL bookings from November to December 2020!",
                                    "image":"https://i.pinimg.com/originals/28/b1/33/28b1334332d33463e94aa2db34b5fe06.jpg",
    ]
    
    static let sampleReward6 = ["id":"6",
                                    "name":"Buy 1 Take 1 From Starbucks",
                                    "description":"Get (1) free machiatto coffee when you purchase any Venti coffee from Starbucks",
                                    "image":"https://thumbs.dreamstime.com/z/promo-coffee-shop-vector-template-special-offer-cafe-buy-get-free-concept-promotion-banner-advertising-81755100.jpg",
    ]
    
    static let sampleReward7 = ["id":"7",
                                    "name":"Amazon 90% Cashback Voucher!",
                                    "description":"Submit this code on checkout to receive 90% cashback on any purchase (max 100)",
                                    "image":"https://img.freepik.com/free-vector/crazy-sale-offer-discount-banner-voucher-template-design_1017-13700.jpg?size=626&ext=jpg",
    ]
    
    static let sampleReward8 = ["id":"8",
                                    "name":"25% Off For Selected H&M Items!",
                                    "description":"Get 25% off from selected items here in H&M. Online Transactions only.",
                                    "image":"https://i.pinimg.com/236x/c8/55/e3/c855e337c373317e7c0b3a0fb9af4d34--promotional-design-fashion-design.jpg",
    ]
    
    static let sampleReward9 = ["id":"9",
                                    "name":"P100 Worth Sodexo Gift Card!",
                                    "description":"Claim your P100 Sodexo Gift Card on any SM Branch now!",
                                    "image":"https://image.freepik.com/free-vector/reward-promotion-programs-get-awards-by-shopping-online-gifts-loyal-customers_101434-588.jpg",
    ]
    
    static let sampleReward10 = ["id":"10",
                                    "name":"CitiBank P5000 Nike E-Gift",
                                    "description":"Use your CitiBank card on any Nike purchase and receive a P5000 Gift Card from Nike!",
                                    "image":"https://www.citibank.com.ph/gcb/promos/others/images/nike-park-egift/banner.jpg",
    ]
    
    static let sampleReward11 = ["id":"11",
                                    "name":"PLDT VIP Card",
                                    "description":"Claim your free PLDT VIP Card on any PLDT branch from October 2020 to February 2021",
                                    "image":"https://pldthome.com/images/default-source/mvp-rewards/mvprewards-mobile-banner-ver1.jpg",
    ]
    
    static let sampleReward12 = ["id":"12",
                                    "name":"Earn 100% More SM Advantage Points",
                                    "description":"Earn 200% your usual SM Advantage Points when shopping in SM Supermarket",
                                    "image":"https://d2ur52ppwp0us4.cloudfront.net/data/uploads/2020/10/MOBILE_Homepage-Banner_SM-Hypermarket-SFF_v21.png",
    ]
    
    static let sampleReward13 = ["id":"13",
                                    "name":"P500 Gift Check From LG",
                                    "description":"Avail your free P500 GC from LG (Usable only in SM Manila)",
                                    "image":"https://www.abenson.com/media/wysiwyg/pages/ac-plusrewards-topbanner.jpg",
    ]
    
    static let sampleReward14 = ["id":"14",
                                    "name":"10000 E-Coin For Gamblers.co",
                                    "description":"Get 10000 e-coin from Gamblers.co",
                                    "image":"https://st.cdjapan.co.jp/pictures/cms/d/1000point_page.png",
    ]
    
    static let sampleReward15 = ["id":"15",
                                    "name":"Free Robinsons VIP Card",
                                    "description":"Avail wonderful discounts and perks when you use your Robinsons VIP Card",
                                    "image":"https://www.robinsonsrewards.com.ph/MyRewards/img/Banner.jpg",
    ]
    
    static let allRewards = [sampleReward1,
                             sampleReward2,
                             sampleReward3,
                             sampleReward4,
                             sampleReward5,
                             sampleReward6,
                             sampleReward7,
                             sampleReward8,
                             sampleReward9,
                             sampleReward10,
                             sampleReward11,
                             sampleReward12,
                             sampleReward13,
                             sampleReward14,
                             sampleReward15,
    ]
}
