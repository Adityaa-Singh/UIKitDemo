//
//  App+Constants.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation

extension App {
    
    struct AppImages {
        static let back = "back"
        static let tick = "tick"
        static let radiobox = "radiobox"
       
    }
    
    struct ValidationMessages {
        static let something_went_wrong = "something_went_wrong"
        
        static let please_enter_your_email = "please_enter_your_email"
        static let invalid_email = "invalid_email"
        static let please_enter_your_password = "please_enter_your_password"
        static let invalid_password = "invalid_password"
        
       
    }
    
    struct AlertMessage {
        static let no_internet = "no_internet"
        static let session_expired = "session_expired"
        
    }
    
    struct DateFormatStyle {
        static let dayDateMonth = "EEE,dd MMM"
        static let dateMonthYear = "dd-MM-yyyy"
        static let dayDate = "EEE dd,"
        static let yearMonthDayHoursMinites = "yyyy MMM dd, hh:mm a"
        static let monthDate = "MMM dd,"

    }
    
    struct TimeFormatStyle {
        static let hoursMinutes = "HH:mm"
        static let hoursMinutesAMPM = "HH:mm a"
        static let hoursMinutes12FormatAMPM = "hh:mm a"

    }
    
    struct NavigationBarTitle {
        static let login = "Login"
        static let signUp = "Sign Up"
        
    }
    
    struct LabelTitle {
        static let applicationName = "GoViens"

    }
    
    struct ButtonTitle {
        static let takePhoto = "Take photo"
        static let cameraRoll = "Camera Roll"
        static let photoLibrary = "Photo Library"
        static let cancel = "Cancel"
        static let settings = "Settings"
        static let ok = "Ok"
        static let exit = "Exit"
        static let login = "Login"

        
    }
    
    struct PlaceHolderTitle {
        static let enter_email = "enter_email"
        static let enter_password = "enter_password"

    }
    
    struct TabBarTitle {
        static let myRides = "Rides"
        static let search = "Search"
        static let drive = "Drive"
        static let profile = "Profile"
    }
    
    struct NotificationObserverName {
        static let hideMenu = "HideMenu"
        static let shiftStartedFromPopup = "ShiftStartedFromPopup"
        static let phoneCodeSelected = "PhoneCodeSelected"
    }
    

}
