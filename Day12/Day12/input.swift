//
//  input.swift
//  Day12
//
//  Created by Jerry Hsu on 12/13/20.
//

import Foundation

// Code inside modules can be shared between pages and other source files.
public let input = """
S2
W4
F31
N2
E4
F98
R180
W2
N4
E1
L180
W2
S5
F69
W5
F12
E3
F91
R90
E1
L90
F73
W4
N3
R90
F76
R90
F33
W2
L90
F51
E1
S3
L180
F62
N5
L180
N3
E1
L90
F83
R180
W4
F29
E2
L90
L90
N3
W1
S1
E2
L270
L180
N2
E1
F77
N2
F11
L180
E2
F45
N4
W5
S2
L90
N2
F14
L90
W3
F6
N5
E2
R90
E2
L90
F39
L90
F45
W2
F67
W4
F50
E1
F92
W5
F75
N2
W1
S3
R90
W5
F51
L90
E3
F71
N3
E3
F74
E4
S3
W2
L180
E2
S5
L270
R90
N2
R90
E4
L270
S5
E4
W3
L90
N2
F32
E3
N5
E2
R180
F27
S1
R90
F94
E2
F82
N3
L90
F100
W4
L90
S1
E4
F26
R90
R90
F12
W4
F70
L90
F100
W4
S2
R90
E3
F11
L90
F32
L180
S2
F11
S2
L90
S3
E4
F93
S1
R90
S2
F20
E2
F9
S5
F23
E4
S2
F38
L90
N3
F3
E2
F37
N2
F89
E5
F43
R90
F88
N5
F52
W5
F24
E4
L180
S4
E3
F14
L90
S2
E5
L180
N4
F98
N4
W2
S2
W1
S3
R90
F98
E4
R270
E2
F45
L90
F75
R180
W3
L180
F42
E2
N4
L90
F2
R180
W5
E5
N5
R180
F92
L90
F95
E3
F61
S5
E2
L180
E1
E2
F27
S3
W2
S1
F86
R270
S1
L90
R90
E5
S2
S2
F93
E2
R270
N3
W3
F74
R90
F94
E2
F88
S1
R90
W4
L90
N5
F59
R90
N1
F24
S2
F10
L90
F72
L90
F55
N2
E1
R90
N1
E1
F12
L90
S5
E5
F44
L180
S4
E2
E5
S1
E5
R180
S1
R90
N3
L90
E2
S4
L90
R90
W1
R90
E5
N1
L90
N1
E3
S5
W1
S1
L270
E2
E4
F31
S2
E4
N2
W3
L90
F7
S3
F23
S3
E1
F15
S1
L90
E4
S1
L90
N3
W1
F13
R180
S3
F37
N3
W5
S5
L90
F55
F54
R90
E1
N4
F68
S5
F3
L180
F75
N3
R90
W4
F78
S4
S3
R180
N2
R90
N1
F20
L180
F12
S4
E4
L180
F10
E2
N5
E3
F13
E3
L90
F55
E5
F96
W1
F100
R90
F97
W4
W2
N4
W4
N3
E4
R90
S1
W4
F80
W2
L90
F64
W5
S2
W3
R180
W1
S2
F83
R180
F37
W4
N4
F57
E3
R90
F37
S4
R180
F62
R90
S5
F9
E3
N4
L90
W4
R90
F97
W4
R180
F2
W4
S1
F77
L180
R90
E4
F58
S2
L90
E1
N3
L90
N2
W4
N1
L90
F94
E1
R90
F29
S3
L180
E2
R180
S5
F62
L90
N2
R90
E4
F93
L90
E5
N4
L180
N3
F20
R90
E3
L90
S3
F24
E4
R90
E4
F89
N1
F13
R180
W1
L90
S3
W5
S4
L180
W3
F90
S4
E3
F36
S3
E2
F37
E5
F31
L90
F68
S5
F74
L90
F59
R180
F20
N1
L180
N5
L90
E3
N2
W4
F54
L90
F77
R270
S5
F82
R90
E2
L180
F59
R90
E5
R90
F26
E4
F91
R90
W4
F6
W5
F34
S4
F61
W2
S2
R270
F45
R180
N5
L90
F26
L90
R90
S1
W3
N5
W5
L90
N3
L90
N3
E3
L90
F1
E4
L90
F60
N3
F7
S1
E1
F68
L90
N5
E5
F36
W3
S5
L270
N2
E1
R90
F8
S3
E1
R90
N1
E2
R90
N1
F90
E2
F63
S2
F17
S1
E3
L90
E4
L180
N4
W1
S4
L90
S5
F15
W1
N5
W3
F97
S3
L90
S2
F78
N3
W5
L90
F68
E3
F24
S3
L90
W2
L90
F49
W4
R90
F82
R270
S1
N3
L90
S4
R90
S2
F46
L180
E4
L180
W2
R90
L90
N1
F88
L180
S5
R90
S4
L90
F68
W5
F13
E4
S3
F91
W3
F85
L180
N4
W5
S3
F89
W1
L180
S2
E3
F82
L90
S4
W5
N5
W2
S4
S2
F82
E2
N4
L90
F80
E2
F49
W5
S3
F76
L90
S1
F41
S3
E1
F26
E3
F53
E2
F73
W3
R180
N2
R90
N3
R90
F16
L90
N3
N1
W5
F19
R90
N4
W5
F6
E3
N5
W2
N3
E4
S4
L90
E3
S2
F9
L180
F70
N5
S4
F63
N3
E1
R180
S3
L90
E5
L90
F76
R180
E2
L180
L90
F24
E5
S5
F98
S3
F97
N5
R90
N5
F43
W1
R180
F38
R180
F13
W2
F16
R90
F6
N1
F98
R180
N2
E1
F19
L90
S1
F33
R90
N3
F75
N4
L180
F35
W1
F61
"""

public let sampleInput = """
F10
N3
F7
R90
F11
"""
