//
//  AppUtilities.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation
import UIKit
//import SVProgressHUD
//import SDWebImage
import Photos

class AppUtilities {
    
    private init () {}
    
    static let shared = AppUtilities()
    
    // Scene-aware key window resolver
    static var activeKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first(where: { $0.activationState == .foregroundActive })?
                .windows
                .first(where: { $0.isKeyWindow })
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    let defaultToastWidth: CGFloat = {
        let width = AppUtilities.activeKeyWindow?.frame.width ?? 280
        return width - 100
    }()
    
//    func showSDWebImageLoader(imageView: UIImageView, url: String, placeHolderImage: UIImage?, indicatorType: SDWebImageActivityIndicator) {
//        imageView.sd_imageIndicator = indicatorType
//        imageView.sd_imageIndicator?.startAnimatingIndicator()
//        imageView.sd_setImage(with: URL(string: url), placeholderImage: placeHolderImage, options: .highPriority) { (image, error, type, url) in
//            imageView.sd_imageIndicator?.stopAnimatingIndicator()
//        }
//    }
    
//    func showLoader(aView: UIView, userInteractionAllowed: Bool ) {
//        DispatchQueue.main.async {
//            SVProgressHUD.show()
//            aView.isUserInteractionEnabled = userInteractionAllowed
//        }
//    }
    
//    func showLoaderWithText(aView: UIView, message: String?, userInteractionAllowed: Bool, _ backgroundColor: UIColor = .black, _ textColor: UIColor = .white) {
//        DispatchQueue.main.async {
//            SVProgressHUD.setBackgroundColor(backgroundColor)
//            SVProgressHUD.setForegroundColor(textColor)
//            SVProgressHUD.show(withStatus: message)
//            aView.isUserInteractionEnabled = userInteractionAllowed
//        }
//    }
    
//    func hideLoaderFromView(aView: UIView) {
//        DispatchQueue.main.async {
//            SVProgressHUD.dismiss()
//            aView.isUserInteractionEnabled = true
//        }
//    }
    
    func isValidMobileNumber(phoneNumber:String) -> Bool {
        
        let PhoneFormat = "[0-9]*"
        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", PhoneFormat)
        return numberPredicate.evaluate(with: phoneNumber)
    }
    
    func validateEmail(email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    func circleImageWithBorderColor(image: UIImageView, color:UIColor){
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = color.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
    func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        //        if UIApplication.shared.canOpenURL(settingsUrl) {
        //            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        //        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    // Finished opening URL
                })
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(settingsUrl)
            }
        }
    }
    
    func checkPhotoLibraryPermission() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            return true
        case .denied, .restricted:
            return false
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                print("Status: \(status)")
            }
            return false
        default:
            break
        }
        return false
    }
    
    func checkCameraPermission() -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .authorized:
            return true
        case .denied, .restricted:
            return false
        case .notDetermined:
            if checkCameraIsEnable(){
                return true
            }else{
                return false
            }
        default:
            break
        }
        return false
    }
    
    func checkCameraIsEnable() -> Bool {
        var check: Bool = false
        AVCaptureDevice.requestAccess(for: .video) { (status) in
            if status {
                print("User granted")
                check = true
            }else{
                print("User rejected")
                check = false
            }
        }
        return check
    }
    
//        func tokenExpireAlert(_ titleStr: String ,_ messageStr: String) {
//            let alert = UIAlertController(title:titleStr, message:messageStr , preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
    
    func checkApplicationState() -> Bool {
        let appstate = UIApplication.shared.applicationState
        switch appstate {
        case .active:
            print("the app is in active state")
            return true
        case .background:
            print("the app is in background state")
            return false
        case .inactive:
            print("the app is in inactive state")
            return false
        default:
            print("the default state")
            break
        }
        return false
    }

    
}


extension AppUtilities {
    
    enum ToastType {
        case normal
        case warning
        
        var backgroundColor: UIColor {
            switch self {
            case .normal: return .white
            case .warning: return .red
            }
        }
        
        var textColor: UIColor {
            return .black
        }
        
        var duration: TimeInterval {
            switch self {
            case .normal: return 2
            case .warning: return 3
            }
        }
    }
    
    func showToast(
        message: String,
        type: ToastType = .normal,
        toastWidth width: CGFloat = AppUtilities.shared.defaultToastWidth,
        font: UIFont = .systemFont(ofSize: 17),
        owner: UIView
    ) {
        
        guard let window = AppUtilities.activeKeyWindow else { return }
        
        removePreviousToastMessage(forOwner: owner)
        
        guard let toastView = Bundle.main.loadNibNamed(
            "\(ToastAlertView.self)",
            owner: owner,
            options: nil
        )?.first as? ToastAlertView else { return }
        
        toastView.layer.cornerRadius = 10
//        toastView.setShadow(shadowRadius: 5, color: .darkGray)
        toastView.backgroundColor = type.backgroundColor
        toastView.labelToastMessage.textColor = type.textColor
        toastView.labelToastMessage.font = font
        toastView.labelToastMessage.text = message
        
        let messageHeight = message.height(withConstrainedWidth: width, font: font)
        let messageWidth = message.sizeOfString(constrainedToWidth: width, font: font).width
        
        toastView.frame = CGRect(
            x: 0,
            y: window.frame.height,
            width: min(messageWidth + 30, width),
            height: messageHeight + 20
        )
        
        toastView.center.x = window.center.x
        
        let parentView = owner.bounds.maxY == window.frame.maxY ? owner : window
        parentView.addSubview(toastView)
        
        UIView.animate(withDuration: 0.2, animations: {
            toastView.transform = CGAffineTransform(
                translationX: 0,
                y: -(toastView.frame.height + 50)
            )
        }) { _ in
            UIView.animate(
                withDuration: 0.2,
                delay: type.duration,
                options: [.curveEaseOut],
                animations: {
                    toastView.alpha = 0
                },
                completion: { _ in
                    toastView.removeFromSuperview()
                }
            )
        }
    }
    
    func removePreviousToastMessage(forOwner owner: UIView) {
        guard let window = AppUtilities.activeKeyWindow else { return }
        
        let parentView = owner.bounds.maxY == window.frame.maxY ? owner : window
        
        parentView.subviews
            .filter { $0 is ToastAlertView }
            .forEach { $0.removeFromSuperview() }
    }
}
