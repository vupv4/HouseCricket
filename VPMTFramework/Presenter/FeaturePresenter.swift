//
//  FeaturePresenter.swift
//  VPMTFramework
//
//  Created by Vu Phan on 8/16/16.
//  Copyright © 2016 beeTeam. All rights reserved.
//

import UIKit

class FeaturePresenter: NSObject {

    var delegate: IBaseView ;
    var featureRepository: FeatureRepository!
    
    init(delegate:IBaseView) {
        self.delegate = delegate;
        featureRepository = FeatureRepository()
    }
    
    func getListFeature() {
        
        featureRepository .getListFeature({ (data) in
            self.delegate.doOnSuccess(data)
            })
        { (error) in
            self.delegate.doOnError(error)
        }
    }
    
    func getListPackage() {
        
        featureRepository .getListPackage({ (data) in
            self.delegate.doOnSuccess(data)
            })
        { (error) in
            self.delegate.doOnError(error)
        }
    }
    
}
