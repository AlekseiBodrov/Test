//
//  Spacing+Extension.swift
//  Students-test-project
//
//  Created by Алексей on 05.02.2023.
//

import Foundation

public protocol Sizing {
    init(_ value: Double)
}

extension Int: Sizing { }
extension UInt: Sizing { }
extension Float: Sizing { }
extension Double: Sizing { }
extension CGFloat: Sizing { }

extension Sizing {

    /// XL
    ///
    /// Value: 32.0.
    public static var xl: Self { Self(32.0) }

    /// L
    ///
    /// Value: 24.0.
    public static var l: Self { Self(24.0) }

    /// MPlus
    ///
    /// Value: 20.0.
    public static var mplus: Self { Self(20.0) }

    /// M
    ///
    /// Value: 16.0.
    public static var m: Self { Self(16.0) }

    /// SPlus
    ///
    /// Value: 14.0.
    public static var splus: Self { Self(14.0) }

    /// S
    ///
    /// Value: 12.0.
    public static var s: Self { Self(12.0) }

    /// XS
    ///
    /// Value: 8.0.
    public static var xs: Self { Self(8.0) }

    /// XXS
    ///
    /// Value: 4.0.
    public static var xxs: Self { Self(4.0) }

    /// XXXS
    ///
    /// Value: 2.0.
    public static var xxxs: Self { Self(2.0) }
}
