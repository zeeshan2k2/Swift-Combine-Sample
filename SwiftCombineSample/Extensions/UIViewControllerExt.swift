import Foundation
import UIKit

extension UIViewController {
    
    /// Navigate to view controller with our standard configurations
    /// - Parameters:
    ///   - vc: This will be the destination view controller. This parameter will also be use to extract the view contoller identifier. so identifier in storyboard and the owner class name should be same
    ///   - withProperties: use this closure function to populate parameter in destination viewcontroller
    func navigateToVC<T: UIViewController>(_ vc: T.Type, animated: Bool = true, withProperties: (_ vc: T) -> Void = {_ in }) {
        let identifier = String(describing: vc)
        guard let vc = self.storyboard?.instantiateViewController(identifier: identifier) as? T else {
            fatalError("ViewController with identifier \(identifier) not found")
        }
        
        withProperties(vc)
        
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    /// Pop view controller with our standard configurations
    func popupVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func popupToVC(vcClass: AnyClass) {
        if let vc = self.navigationController?.viewControllers.last(where: { $0.isKind(of: vcClass) }) {
            self.navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    func popupToRootVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createReverseTransition() {
        let transition = CATransition()
        transition.duration = 0.35 // Match the default duration
        transition.type = .push // Closest to the default UIKit behavior
        transition.subtype = .fromLeft // Move from right to left for a push-like effect
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut) // Smooth easing

        view.window?.layer.add(transition, forKey: kCATransition)
    }
}

