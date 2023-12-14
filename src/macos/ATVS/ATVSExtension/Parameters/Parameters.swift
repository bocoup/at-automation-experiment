//
//  Parameters.swift
//  ATVSExtension
//
//  Created by Z Goddard on 4/12/23.
//

import AudioToolbox
import Foundation

enum ATVSExtensionParameterAddress: UInt64 {
  case gain
}

let ATVSExtensionParameterSpecs = ParameterTreeSpec {
  ParameterGroupSpec(identifier: "global", name: "Global") {
    ParameterSpec(
      address: .gain,
      identifier: "gain",
      name: "Output Gain",
      units: .linearGain,
      valueRange: 0.0...1.0,
      defaultValue: 0.25
    )
  }
}

extension ParameterSpec {
  init(
    address: ATVSExtensionParameterAddress,
    identifier: String,
    name: String,
    units: AudioUnitParameterUnit,
    valueRange: ClosedRange<AUValue>,
    defaultValue: AUValue,
    unitName: String? = nil,
    flags: AudioUnitParameterOptions = [
      AudioUnitParameterOptions.flag_IsWritable, AudioUnitParameterOptions.flag_IsReadable,
    ],
    valueStrings: [String]? = nil,
    dependentParameters: [NSNumber]? = nil
  ) {
    self.init(
      address: address.rawValue,
      identifier: identifier,
      name: name,
      units: units,
      valueRange: valueRange,
      defaultValue: defaultValue,
      unitName: unitName,
      flags: flags,
      valueStrings: valueStrings,
      dependentParameters: dependentParameters)
  }
}
