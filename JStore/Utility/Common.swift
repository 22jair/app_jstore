//
//  Common.swift
//  JStore
//
//  Created by Jair Arteaga on 6/23/21.
//

import Foundation
import UIKit
import Firebase

class CommonUtility {
    
    /**
     returns authentication error based on error code
     - Returns: A string with the error message. If there is no error, returns nil
     - Parameter error: auth Error
     */
    static func getAuthErrorMessage(_ error: Error?) -> String? {
        
        if error != nil {
            
            if let errCode = AuthErrorCode(rawValue: error!._code) {

                switch errCode {
                    case .invalidEmail  :
                        return "Email no válido"
                    case .userNotFound :
                        return "Usuario no registrado"
                    case .wrongPassword :
                        return "Contraseña incorrecta"
                    case .emailAlreadyInUse :
                        return "Email ya está en uso"
                    default:
                        return "Error de autenticación"
                }
            }
        }
        
        return nil
    }
    
}
