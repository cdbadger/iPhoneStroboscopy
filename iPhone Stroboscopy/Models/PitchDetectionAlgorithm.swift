//
//  PitchDetectionAlgorithm.swift
//  iPhone Stroboscopy
//
//  Created by Christopher Badger on 11/4/17.
//  Copyright © 2017 Christopher Badger. All rights reserved.
//

import Foundation
import AVFoundation
import Beethoven

// Creates a configuration for the input signal tracking (by default).
let config = Config(
    bufferSize: 2048,
    estimationStrategy: .hps
)

/*
 As explained earlier, sound is treated in small blocks rather than a continuous stream of data
in computers. To sample the sound data we need to determine a buffersize (W). A higher
buffersize increases the delay in determining the pitch, but decreases inaccuracy errors. A
smaller buffersizes has a lower delay, but has too much inaccuracy errors. The lowest note
on a typical piano, A0, has a frequency of 27.5 Hz. Therefore, our sample size needs to be
able to fit at least one frequency of 27.5 Hz. Sample size = 1000.0 / 27.5 = 36.36 ms. Thus, a
sample size of at least 36 milliseconds is required to be able to detect all frequencies.
Both methods suggest a buffersize of 1024. A buffersize of 1024 results in a minimum
latency of 1.0 / (44100 / 1024) = 1.0 / 43.07 = 0.023 seconds, or 23 milliseconds.
 */

let pitchEngine = PitchEngine(config: config)

