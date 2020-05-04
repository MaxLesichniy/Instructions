//
//  ArrowOrientationsViewController.swift
//  InstructionsExample
//
//  Created by Max Lesichniy on 8/12/19.
//  Copyright © 2019 Ephread. All rights reserved.
//

import Foundation
import Instructions

/// This class serves as a base for all the other examples
internal class ArrowOrientationsViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Public properties
    var coachMarksController = CoachMarksController()
    
    let nextButtonText = "Ok!"
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coachMarksController.overlay.allowTap = true
        self.coachMarksController.dataSource = self
        
        let skipView = CoachMarkSkipDefaultView()
        skipView.setTitle("Skip", for: .normal)
        
        self.coachMarksController.skipView = skipView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startInstructions()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.coachMarksController.stop(immediately: true)
    }
    
    func startInstructions() {
        self.coachMarksController.start(in: .window(over: self))
    }
}

// MARK: - Protocol Conformance | CoachMarksControllerDataSource
extension ArrowOrientationsViewController: CoachMarksControllerDataSource {
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 10
    }
    
    func coachMarksController(
        _ coachMarksController: CoachMarksController,
        coachMarkAt index: Int
        ) -> CoachMark {
        
        var coachMark: CoachMark = coachMarksController.helper.makeCoachMark(for: button, pointOfInterest: nil, cutoutPathMaker: nil)
        
        switch(index) {
        case 0:
            coachMark.arrowOrientation = .top
        case 1:
            coachMark.arrowOrientation = .topLeft
        case 2:
            coachMark.arrowOrientation = .topRight
        case 3:
            coachMark.arrowOrientation = .bottom
        case 4:
            coachMark.arrowOrientation = .bottomLeft
        case 5:
            coachMark.arrowOrientation = .bottomRight
        case 6:
            coachMark.arrowOrientation = .leftTop
        case 7:
            coachMark.arrowOrientation = .leftBottom
        case 8:
            coachMark.arrowOrientation = .rightTop
        case 9:
            coachMark.arrowOrientation = .rightBottom
        default:
            break
        }
        
        return coachMark
    }
    
    func coachMarksController(
        _ coachMarksController: CoachMarksController,
        coachMarkViewsAt index: Int,
        madeFrom coachMark: CoachMark
        ) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        
        
        var bodyView : CoachMarkBodyView
        var arrowView : CoachMarkArrowView?
        
        let coachMarkBodyView = TransparentCoachMarkBodyView()
        var coachMarkArrowView: TransparentCoachMarkArrowView? = nil
        
        coachMarkBodyView.hintLabel.text = "masg meogmose gme goe mgo mgo m4"
        
        if let arrowOrientation = coachMark.arrowOrientation {
            coachMarkArrowView = TransparentCoachMarkArrowView(orientation: arrowOrientation)
        }
        
        bodyView = coachMarkBodyView
        arrowView = coachMarkArrowView
        
        return (bodyView: bodyView, arrowView: arrowView)
    }
}
