//
//  Typography.swift
//  HydrationTracker
//
//  SF Pro type scale — Hero 32-40, Title 24, Body 16, Caption 13-14.
//

import SwiftUI

extension Font {
    /// 34pt bold — hero headlines.
    static let hero = Font.system(size: 34, weight: .bold)
    /// 28pt bold — large section hero.
    static let heroSmall = Font.system(size: 28, weight: .bold)
    /// 24pt bold — section titles.
    static let title = Font.system(size: 24, weight: .bold)
    /// 20pt semibold.
    static let subtitle = Font.system(size: 20, weight: .semibold)
    /// 17pt semibold — emphasis.
    static let emphasis = Font.system(size: 17, weight: .semibold)
    /// 16pt — body.
    static let body = Font.system(size: 16, weight: .regular)
    /// 14pt — secondary body.
    static let bodySmall = Font.system(size: 14, weight: .regular)
    /// 13pt medium — caption.
    static let caption = Font.system(size: 13, weight: .medium)
    /// 11pt medium — micro.
    static let micro = Font.system(size: 11, weight: .medium)
}

extension View {
    /// Generous line height for premium reading rhythm.
    func readableLineSpacing(_ spacing: CGFloat = 4) -> some View {
        self.lineSpacing(spacing)
    }
}
