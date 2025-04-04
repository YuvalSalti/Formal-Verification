; SMT-LIBv2 description generated by Yosys 0.50+56 (git sha1 9106d6b3b, g++ 11.4.0-1ubuntu1~22.04 -fPIC -O3)
; yosys-smt2-module counter_64_bit
(declare-sort |counter_64_bit_s| 0)
(declare-fun |counter_64_bit_is| (|counter_64_bit_s|) Bool)
(declare-fun |counter_64_bit#0| (|counter_64_bit_s|) Bool) ; \wen
; yosys-smt2-input wen 1
; yosys-smt2-wire wen 1
; yosys-smt2-witness {"offset": 0, "path": ["\\wen"], "smtname": "wen", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_n wen| ((state |counter_64_bit_s|)) Bool (|counter_64_bit#0| state))
(declare-fun |counter_64_bit#1| (|counter_64_bit_s|) Bool) ; \rst
; yosys-smt2-input rst 1
; yosys-smt2-wire rst 1
; yosys-smt2-witness {"offset": 0, "path": ["\\rst"], "smtname": "rst", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_n rst| ((state |counter_64_bit_s|)) Bool (|counter_64_bit#1| state))
; yosys-smt2-anyinit counter_64_bit#2 64 counter_64_bit.v:20.5-27.8
; yosys-smt2-witness {"offset": 0, "path": ["\\r"], "smtname": 2, "smtoffset": 0, "type": "init", "width": 64}
(declare-fun |counter_64_bit#2| (|counter_64_bit_s|) (_ BitVec 64)) ; \r
; yosys-smt2-register r 64
; yosys-smt2-wire r 64
(define-fun |counter_64_bit_n r| ((state |counter_64_bit_s|)) (_ BitVec 64) (|counter_64_bit#2| state))
(declare-fun |counter_64_bit#3| (|counter_64_bit_s|) Bool) ; \load
; yosys-smt2-input load 1
; yosys-smt2-wire load 1
; yosys-smt2-witness {"offset": 0, "path": ["\\load"], "smtname": "load", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_n load| ((state |counter_64_bit_s|)) Bool (|counter_64_bit#3| state))
(declare-fun |counter_64_bit#4| (|counter_64_bit_s|) (_ BitVec 64)) ; \din
; yosys-smt2-input din 64
; yosys-smt2-wire din 64
; yosys-smt2-witness {"offset": 0, "path": ["\\din"], "smtname": "din", "smtoffset": 0, "type": "input", "width": 64}
(define-fun |counter_64_bit_n din| ((state |counter_64_bit_s|)) (_ BitVec 64) (|counter_64_bit#4| state))
; yosys-smt2-output count 64
; yosys-smt2-wire count 64
(define-fun |counter_64_bit_n count| ((state |counter_64_bit_s|)) (_ BitVec 64) (|counter_64_bit#2| state))
(declare-fun |counter_64_bit#5| (|counter_64_bit_s|) Bool) ; \clk
; yosys-smt2-input clk 1
; yosys-smt2-wire clk 1
; yosys-smt2-clock clk posedge
; yosys-smt2-witness {"offset": 0, "path": ["\\clk"], "smtname": "clk", "smtoffset": 0, "type": "posedge", "width": 1}
; yosys-smt2-witness {"offset": 0, "path": ["\\clk"], "smtname": "clk", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_n clk| ((state |counter_64_bit_s|)) Bool (|counter_64_bit#5| state))
(define-fun |counter_64_bit#6| ((state |counter_64_bit_s|)) (_ BitVec 1) (bvnot (ite (|counter_64_bit#5| state) #b1 #b0))) ; $auto$rtlil.cc:2739:Not$176
; yosys-smt2-assume 0 $auto$formalff.cc:758:execute$177
(define-fun |counter_64_bit_u 0| ((state |counter_64_bit_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit#6| state)) #b1) (not true))) ; $auto$formalff.cc:758:execute$177
(define-fun |counter_64_bit#7| ((state |counter_64_bit_s|)) (_ BitVec 64) (bvadd (|counter_64_bit#2| state) #b0000000000000000000000000000000000000000000000000000000000000001)) ; $add$counter_64_bit.v:26$64_Y
(define-fun |counter_64_bit#8| ((state |counter_64_bit_s|)) (_ BitVec 64) (ite (|counter_64_bit#0| state) (|counter_64_bit#7| state) (|counter_64_bit#2| state))) ; $procmux$65_Y
(define-fun |counter_64_bit#9| ((state |counter_64_bit_s|)) (_ BitVec 64) (ite (|counter_64_bit#3| state) (|counter_64_bit#4| state) (|counter_64_bit#8| state))) ; $procmux$68_Y
(define-fun |counter_64_bit#10| ((state |counter_64_bit_s|)) (_ BitVec 64) (ite (|counter_64_bit#1| state) #b0000000000000000000000000000000000000000000000000000000000000000 (|counter_64_bit#9| state))) ; $0\r[63:0]
(define-fun |counter_64_bit_a| ((state |counter_64_bit_s|)) Bool true)
(define-fun |counter_64_bit_u| ((state |counter_64_bit_s|)) Bool 
  (|counter_64_bit_u 0| state)
)
(define-fun |counter_64_bit_i| ((state |counter_64_bit_s|)) Bool true)
(define-fun |counter_64_bit_h| ((state |counter_64_bit_s|)) Bool true)
(define-fun |counter_64_bit_t| ((state |counter_64_bit_s|) (next_state |counter_64_bit_s|)) Bool 
  (= (|counter_64_bit#10| state) (|counter_64_bit#2| next_state)) ; $procdff$81 \r
) ; end of module counter_64_bit
; yosys-smt2-module counter_64_bit_formal
(declare-sort |counter_64_bit_formal_s| 0)
(declare-fun |counter_64_bit_formal_is| (|counter_64_bit_formal_s|) Bool)
(declare-fun |counter_64_bit_formal#0| (|counter_64_bit_formal_s|) Bool) ; \wen
; yosys-smt2-input wen 1
; yosys-smt2-wire wen 1
; yosys-smt2-witness {"offset": 0, "path": ["\\wen"], "smtname": "wen", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_formal_n wen| ((state |counter_64_bit_formal_s|)) Bool (|counter_64_bit_formal#0| state))
(declare-fun |counter_64_bit_formal#1| (|counter_64_bit_formal_s|) Bool) ; \rst
; yosys-smt2-input rst 1
; yosys-smt2-wire rst 1
; yosys-smt2-witness {"offset": 0, "path": ["\\rst"], "smtname": "rst", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_formal_n rst| ((state |counter_64_bit_formal_s|)) Bool (|counter_64_bit_formal#1| state))
; yosys-smt2-anyinit counter_64_bit_formal#2 1 counter_64_bit_formal.v:30.1-30.39
; yosys-smt2-witness {"offset": 0, "path": ["\\past_valid"], "smtname": 2, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#2| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \past_valid
; yosys-smt2-register past_valid 1
; yosys-smt2-wire past_valid 1
(define-fun |counter_64_bit_formal_n past_valid| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#2| state)) #b1))
(declare-fun |counter_64_bit_formal#3| (|counter_64_bit_formal_s|) Bool) ; \load
; yosys-smt2-input load 1
; yosys-smt2-wire load 1
; yosys-smt2-witness {"offset": 0, "path": ["\\load"], "smtname": "load", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_formal_n load| ((state |counter_64_bit_formal_s|)) Bool (|counter_64_bit_formal#3| state))
(declare-fun |counter_64_bit_formal#4| (|counter_64_bit_formal_s|) (_ BitVec 64)) ; \din
; yosys-smt2-input din 64
; yosys-smt2-wire din 64
; yosys-smt2-witness {"offset": 0, "path": ["\\din"], "smtname": "din", "smtoffset": 0, "type": "input", "width": 64}
(define-fun |counter_64_bit_formal_n din| ((state |counter_64_bit_formal_s|)) (_ BitVec 64) (|counter_64_bit_formal#4| state))
; yosys-smt2-cell counter_64_bit counter_64_bit
; yosys-smt2-witness {"path": ["\\counter_64_bit"], "smtname": "counter_64_bit", "type": "cell"}
(declare-fun |counter_64_bit_formal#5| (|counter_64_bit_formal_s|) (_ BitVec 64)) ; \count
(declare-fun |counter_64_bit_formal_h counter_64_bit| (|counter_64_bit_formal_s|) |counter_64_bit_s|)
; yosys-smt2-output count 64
; yosys-smt2-wire count 64
(define-fun |counter_64_bit_formal_n count| ((state |counter_64_bit_formal_s|)) (_ BitVec 64) (|counter_64_bit_formal#5| state))
(declare-fun |counter_64_bit_formal#6| (|counter_64_bit_formal_s|) Bool) ; \clk
; yosys-smt2-input clk 1
; yosys-smt2-wire clk 1
; yosys-smt2-clock clk posedge
; yosys-smt2-witness {"offset": 0, "path": ["\\clk"], "smtname": "clk", "smtoffset": 0, "type": "posedge", "width": 1}
; yosys-smt2-witness {"offset": 0, "path": ["\\clk"], "smtname": "clk", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |counter_64_bit_formal_n clk| ((state |counter_64_bit_formal_s|)) Bool (|counter_64_bit_formal#6| state))
; yosys-smt2-anyinit counter_64_bit_formal#7 1 counter_64_bit_formal.v:33.1-36.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_93"], "smtname": 7, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#7| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_93
; yosys-smt2-register _witness_.anyinit_procdff_93 1
; yosys-smt2-wire _witness_.anyinit_procdff_93 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_93| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#7| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#8 64 counter_64_bit_formal.v:39.1-42.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_92"], "smtname": 8, "smtoffset": 0, "type": "init", "width": 64}
(declare-fun |counter_64_bit_formal#8| (|counter_64_bit_formal_s|) (_ BitVec 64)) ; \_witness_.anyinit_procdff_92
; yosys-smt2-register _witness_.anyinit_procdff_92 64
; yosys-smt2-wire _witness_.anyinit_procdff_92 64
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_92| ((state |counter_64_bit_formal_s|)) (_ BitVec 64) (|counter_64_bit_formal#8| state))
; yosys-smt2-anyinit counter_64_bit_formal#9 1 counter_64_bit_formal.v:39.1-42.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_91"], "smtname": 9, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#9| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_91
; yosys-smt2-register _witness_.anyinit_procdff_91 1
; yosys-smt2-wire _witness_.anyinit_procdff_91 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_91| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#9| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#10 1 counter_64_bit_formal.v:39.1-42.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_90"], "smtname": 10, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#10| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_90
; yosys-smt2-register _witness_.anyinit_procdff_90 1
; yosys-smt2-wire _witness_.anyinit_procdff_90 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_90| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#10| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#11 64 counter_64_bit_formal.v:45.1-48.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_89"], "smtname": 11, "smtoffset": 0, "type": "init", "width": 64}
(declare-fun |counter_64_bit_formal#11| (|counter_64_bit_formal_s|) (_ BitVec 64)) ; \_witness_.anyinit_procdff_89
; yosys-smt2-register _witness_.anyinit_procdff_89 64
; yosys-smt2-wire _witness_.anyinit_procdff_89 64
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_89| ((state |counter_64_bit_formal_s|)) (_ BitVec 64) (|counter_64_bit_formal#11| state))
; yosys-smt2-anyinit counter_64_bit_formal#12 1 counter_64_bit_formal.v:45.1-48.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_88"], "smtname": 12, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#12| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_88
; yosys-smt2-register _witness_.anyinit_procdff_88 1
; yosys-smt2-wire _witness_.anyinit_procdff_88 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_88| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#12| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#13 1 counter_64_bit_formal.v:45.1-48.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_87"], "smtname": 13, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#13| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_87
; yosys-smt2-register _witness_.anyinit_procdff_87 1
; yosys-smt2-wire _witness_.anyinit_procdff_87 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_87| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#13| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#14 1 counter_64_bit_formal.v:45.1-48.4
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_86"], "smtname": 14, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#14| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_86
; yosys-smt2-register _witness_.anyinit_procdff_86 1
; yosys-smt2-wire _witness_.anyinit_procdff_86 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_86| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#14| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#15 64 counter_64_bit_formal.v:51.5-54.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_85"], "smtname": 15, "smtoffset": 0, "type": "init", "width": 64}
(declare-fun |counter_64_bit_formal#15| (|counter_64_bit_formal_s|) (_ BitVec 64)) ; \_witness_.anyinit_procdff_85
; yosys-smt2-register _witness_.anyinit_procdff_85 64
; yosys-smt2-wire _witness_.anyinit_procdff_85 64
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_85| ((state |counter_64_bit_formal_s|)) (_ BitVec 64) (|counter_64_bit_formal#15| state))
; yosys-smt2-anyinit counter_64_bit_formal#16 1 counter_64_bit_formal.v:51.5-54.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_84"], "smtname": 16, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#16| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_84
; yosys-smt2-register _witness_.anyinit_procdff_84 1
; yosys-smt2-wire _witness_.anyinit_procdff_84 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_84| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#16| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#17 1 counter_64_bit_formal.v:51.5-54.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_83"], "smtname": 17, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#17| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_83
; yosys-smt2-register _witness_.anyinit_procdff_83 1
; yosys-smt2-wire _witness_.anyinit_procdff_83 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_83| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#17| state)) #b1))
; yosys-smt2-anyinit counter_64_bit_formal#18 1 counter_64_bit_formal.v:51.5-54.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_82"], "smtname": 18, "smtoffset": 0, "type": "init", "width": 1}
(declare-fun |counter_64_bit_formal#18| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; \_witness_.anyinit_procdff_82
; yosys-smt2-register _witness_.anyinit_procdff_82 1
; yosys-smt2-wire _witness_.anyinit_procdff_82 1
(define-fun |counter_64_bit_formal_n _witness_.anyinit_procdff_82| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#18| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$133"], "smtname": 19, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#19| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$133
; yosys-smt2-register $auto$async2sync.cc:110:execute$133 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:110:execute$133| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#19| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$127"], "smtname": 20, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#20| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$127
; yosys-smt2-register $auto$async2sync.cc:110:execute$127 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:110:execute$127| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#20| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$121"], "smtname": 21, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#21| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$121
; yosys-smt2-register $auto$async2sync.cc:110:execute$121 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:110:execute$121| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#21| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$115"], "smtname": 22, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#22| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$115
; yosys-smt2-register $auto$async2sync.cc:110:execute$115 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:110:execute$115| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#22| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$109"], "smtname": 23, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#23| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$109
; yosys-smt2-register $auto$async2sync.cc:110:execute$109 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:110:execute$109| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#23| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:101:execute$129"], "smtname": 24, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#24| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:101:execute$129
; yosys-smt2-register $auto$async2sync.cc:101:execute$129 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:101:execute$129| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#24| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:101:execute$123"], "smtname": 25, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#25| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:101:execute$123
; yosys-smt2-register $auto$async2sync.cc:101:execute$123 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:101:execute$123| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#25| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:101:execute$117"], "smtname": 26, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#26| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:101:execute$117
; yosys-smt2-register $auto$async2sync.cc:101:execute$117 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:101:execute$117| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#26| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:101:execute$111"], "smtname": 27, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#27| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:101:execute$111
; yosys-smt2-register $auto$async2sync.cc:101:execute$111 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:101:execute$111| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#27| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:101:execute$105"], "smtname": 28, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |counter_64_bit_formal#28| (|counter_64_bit_formal_s|) (_ BitVec 1)) ; $auto$async2sync.cc:101:execute$105
; yosys-smt2-register $auto$async2sync.cc:101:execute$105 1
(define-fun |counter_64_bit_formal_n $auto$async2sync.cc:101:execute$105| ((state |counter_64_bit_formal_s|)) Bool (= ((_ extract 0 0) (|counter_64_bit_formal#28| state)) #b1))
(define-fun |counter_64_bit_formal#29| ((state |counter_64_bit_formal_s|)) (_ BitVec 1) (bvnot (ite (|counter_64_bit_formal#6| state) #b1 #b0))) ; $auto$rtlil.cc:2739:Not$173
; yosys-smt2-assume 0 $auto$formalff.cc:758:execute$174
(define-fun |counter_64_bit_formal_u 0| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#29| state)) #b1) (not true))) ; $auto$formalff.cc:758:execute$174
(define-fun |counter_64_bit_formal#30| ((state |counter_64_bit_formal_s|)) (_ BitVec 1) (bvnot (|counter_64_bit_formal#2| state))) ; $eq$counter_64_bit_formal.v:29$62_Y
(define-fun |counter_64_bit_formal#31| ((state |counter_64_bit_formal_s|)) Bool (|counter_64_bit_formal_is| state)) ; $auto$rtlil.cc:2786:And$104
; yosys-smt2-assume 1 _witness_.check_assume_counter_64_bit_formal_v_29_61 counter_64_bit_formal.v:29.10-29.33
(define-fun |counter_64_bit_formal_u 1| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#30| state)) #b1) (not (|counter_64_bit_formal#31| state)))) ; _witness_.check_assume_counter_64_bit_formal_v_29_61
; yosys-smt2-assert 0 _witness_.check_assert_counter_64_bit_formal_v_64_58 counter_64_bit_formal.v:64.9-64.46
(define-fun |counter_64_bit_formal_a 0| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#23| state)) #b1) (not (= ((_ extract 0 0) (|counter_64_bit_formal#28| state)) #b1)))) ; _witness_.check_assert_counter_64_bit_formal_v_64_58
; yosys-smt2-assert 1 _witness_.check_assert_counter_64_bit_formal_v_53_52 counter_64_bit_formal.v:53.13-53.42
(define-fun |counter_64_bit_formal_a 1| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#22| state)) #b1) (not (= ((_ extract 0 0) (|counter_64_bit_formal#27| state)) #b1)))) ; _witness_.check_assert_counter_64_bit_formal_v_53_52
; yosys-smt2-assert 2 _witness_.check_assert_counter_64_bit_formal_v_47_38 counter_64_bit_formal.v:47.6-47.39
(define-fun |counter_64_bit_formal_a 2| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#21| state)) #b1) (not (= ((_ extract 0 0) (|counter_64_bit_formal#26| state)) #b1)))) ; _witness_.check_assert_counter_64_bit_formal_v_47_38
; yosys-smt2-assert 3 _witness_.check_assert_counter_64_bit_formal_v_41_26 counter_64_bit_formal.v:41.6-41.33
(define-fun |counter_64_bit_formal_a 3| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#20| state)) #b1) (not (= ((_ extract 0 0) (|counter_64_bit_formal#25| state)) #b1)))) ; _witness_.check_assert_counter_64_bit_formal_v_41_26
; yosys-smt2-assert 4 _witness_.check_assert_counter_64_bit_formal_v_35_17 counter_64_bit_formal.v:35.6-35.28
(define-fun |counter_64_bit_formal_a 4| ((state |counter_64_bit_formal_s|)) Bool (or (= ((_ extract 0 0) (|counter_64_bit_formal#19| state)) #b1) (not (= ((_ extract 0 0) (|counter_64_bit_formal#24| state)) #b1)))) ; _witness_.check_assert_counter_64_bit_formal_v_35_17
(define-fun |counter_64_bit_formal#32| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#18| state)) #b1) false))) ; $logic_not$counter_64_bit_formal.v:52$46_Y
(define-fun |counter_64_bit_formal#33| ((state |counter_64_bit_formal_s|)) Bool (and (or  (= ((_ extract 0 0) (|counter_64_bit_formal#2| state)) #b1) false) (or  (|counter_64_bit_formal#32| state) false))) ; $logic_and$counter_64_bit_formal.v:52$47_Y
(define-fun |counter_64_bit_formal#34| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#17| state)) #b1) false))) ; $logic_not$counter_64_bit_formal.v:52$48_Y
(define-fun |counter_64_bit_formal#35| ((state |counter_64_bit_formal_s|)) Bool (and (or  (|counter_64_bit_formal#33| state) false) (or  (|counter_64_bit_formal#34| state) false))) ; $logic_and$counter_64_bit_formal.v:52$49_Y
(define-fun |counter_64_bit_formal#36| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#16| state)) #b1) false))) ; $logic_not$counter_64_bit_formal.v:52$50_Y
(define-fun |counter_64_bit_formal#37| ((state |counter_64_bit_formal_s|)) Bool (and (or  (|counter_64_bit_formal#35| state) false) (or  (|counter_64_bit_formal#36| state) false))) ; $logic_and$counter_64_bit_formal.v:52$51_Y
(define-fun |counter_64_bit_formal#38| ((state |counter_64_bit_formal_s|)) (_ BitVec 1) (ite (|counter_64_bit_formal#37| state) #b1 #b0)) ; $assert$counter_64_bit_formal.v:53$52_EN
(define-fun |counter_64_bit_formal#39| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#14| state)) #b1) false))) ; $logic_not$counter_64_bit_formal.v:46$33_Y
(define-fun |counter_64_bit_formal#40| ((state |counter_64_bit_formal_s|)) Bool (and (or  (= ((_ extract 0 0) (|counter_64_bit_formal#2| state)) #b1) false) (or  (|counter_64_bit_formal#39| state) false))) ; $logic_and$counter_64_bit_formal.v:46$34_Y
(define-fun |counter_64_bit_formal#41| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#13| state)) #b1) false))) ; $logic_not$counter_64_bit_formal.v:46$35_Y
(define-fun |counter_64_bit_formal#42| ((state |counter_64_bit_formal_s|)) Bool (and (or  (|counter_64_bit_formal#40| state) false) (or  (|counter_64_bit_formal#41| state) false))) ; $logic_and$counter_64_bit_formal.v:46$36_Y
(define-fun |counter_64_bit_formal#43| ((state |counter_64_bit_formal_s|)) Bool (and (or  (|counter_64_bit_formal#42| state) false) (or  (= ((_ extract 0 0) (|counter_64_bit_formal#12| state)) #b1) false))) ; $logic_and$counter_64_bit_formal.v:46$37_Y
(define-fun |counter_64_bit_formal#44| ((state |counter_64_bit_formal_s|)) (_ BitVec 1) (ite (|counter_64_bit_formal#43| state) #b1 #b0)) ; $assert$counter_64_bit_formal.v:47$38_EN
(define-fun |counter_64_bit_formal#45| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#10| state)) #b1) false))) ; $logic_not$counter_64_bit_formal.v:40$23_Y
(define-fun |counter_64_bit_formal#46| ((state |counter_64_bit_formal_s|)) Bool (and (or  (= ((_ extract 0 0) (|counter_64_bit_formal#2| state)) #b1) false) (or  (|counter_64_bit_formal#45| state) false))) ; $logic_and$counter_64_bit_formal.v:40$24_Y
(define-fun |counter_64_bit_formal#47| ((state |counter_64_bit_formal_s|)) Bool (and (or  (|counter_64_bit_formal#46| state) false) (or  (= ((_ extract 0 0) (|counter_64_bit_formal#9| state)) #b1) false))) ; $logic_and$counter_64_bit_formal.v:40$25_Y
(define-fun |counter_64_bit_formal#48| ((state |counter_64_bit_formal_s|)) (_ BitVec 1) (ite (|counter_64_bit_formal#47| state) #b1 #b0)) ; $assert$counter_64_bit_formal.v:41$26_EN
(define-fun |counter_64_bit_formal#49| ((state |counter_64_bit_formal_s|)) Bool (and (or  (= ((_ extract 0 0) (|counter_64_bit_formal#2| state)) #b1) false) (or  (= ((_ extract 0 0) (|counter_64_bit_formal#7| state)) #b1) false))) ; $logic_and$counter_64_bit_formal.v:34$16_Y
(define-fun |counter_64_bit_formal#50| ((state |counter_64_bit_formal_s|)) (_ BitVec 1) (ite (|counter_64_bit_formal#49| state) #b1 #b0)) ; $assert$counter_64_bit_formal.v:35$17_EN
(define-fun |counter_64_bit_formal#51| ((state |counter_64_bit_formal_s|)) Bool (bvule (|counter_64_bit_formal#5| state) #b1111111111111111111111111111111111111111111111111111111111111111)) ; $le$counter_64_bit_formal.v:64$59_Y
(define-fun |counter_64_bit_formal#52| ((state |counter_64_bit_formal_s|)) Bool (= (|counter_64_bit_formal#5| state) (|counter_64_bit_formal#15| state))) ; $eq$counter_64_bit_formal.v:53$53_Y
(define-fun |counter_64_bit_formal#53| ((state |counter_64_bit_formal_s|)) (_ BitVec 64) (bvadd (|counter_64_bit_formal#11| state) #b0000000000000000000000000000000000000000000000000000000000000001)) ; $add$counter_64_bit_formal.v:47$39_Y
(define-fun |counter_64_bit_formal#54| ((state |counter_64_bit_formal_s|)) Bool (= (|counter_64_bit_formal#5| state) (|counter_64_bit_formal#53| state))) ; $eq$counter_64_bit_formal.v:47$40_Y
(define-fun |counter_64_bit_formal#55| ((state |counter_64_bit_formal_s|)) Bool (= (|counter_64_bit_formal#5| state) (|counter_64_bit_formal#8| state))) ; $eq$counter_64_bit_formal.v:41$27_Y
(define-fun |counter_64_bit_formal#56| ((state |counter_64_bit_formal_s|)) Bool (not (or  (= ((_ extract 0 0) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 1 1) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 2 2) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 3 3) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 4 4) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 5 5) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 6 6) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 7 7) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 8 8) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 9 9) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 10 10) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 11 11) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 12 12) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 13 13) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 14 14) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 15 15) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 16 16) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 17 17) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 18 18) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 19 19) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 20 20) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 21 21) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 22 22) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 23 23) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 24 24) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 25 25) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 26 26) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 27 27) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 28 28) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 29 29) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 30 30) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 31 31) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 32 32) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 33 33) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 34 34) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 35 35) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 36 36) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 37 37) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 38 38) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 39 39) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 40 40) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 41 41) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 42 42) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 43 43) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 44 44) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 45 45) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 46 46) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 47 47) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 48 48) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 49 49) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 50 50) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 51 51) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 52 52) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 53 53) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 54 54) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 55 55) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 56 56) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 57 57) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 58 58) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 59 59) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 60 60) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 61 61) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 62 62) (|counter_64_bit_formal#5| state)) #b1) (= ((_ extract 63 63) (|counter_64_bit_formal#5| state)) #b1)))) ; $eq$counter_64_bit_formal.v:35$18_Y
(define-fun |counter_64_bit_formal_a| ((state |counter_64_bit_formal_s|)) Bool (and
  (|counter_64_bit_formal_a 0| state)
  (|counter_64_bit_formal_a 1| state)
  (|counter_64_bit_formal_a 2| state)
  (|counter_64_bit_formal_a 3| state)
  (|counter_64_bit_formal_a 4| state)
  (|counter_64_bit_a| (|counter_64_bit_formal_h counter_64_bit| state))
))
(define-fun |counter_64_bit_formal_u| ((state |counter_64_bit_formal_s|)) Bool (and
  (|counter_64_bit_formal_u 0| state)
  (|counter_64_bit_formal_u 1| state)
  (|counter_64_bit_u| (|counter_64_bit_formal_h counter_64_bit| state))
))
(define-fun |counter_64_bit_formal_i| ((state |counter_64_bit_formal_s|)) Bool (and
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#19| state)) #b1) true) ; $auto$async2sync.cc:110:execute$133
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#20| state)) #b1) true) ; $auto$async2sync.cc:110:execute$127
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#21| state)) #b1) true) ; $auto$async2sync.cc:110:execute$121
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#22| state)) #b1) true) ; $auto$async2sync.cc:110:execute$115
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#23| state)) #b1) true) ; $auto$async2sync.cc:110:execute$109
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#24| state)) #b1) false) ; $auto$async2sync.cc:101:execute$129
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#25| state)) #b1) false) ; $auto$async2sync.cc:101:execute$123
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#26| state)) #b1) false) ; $auto$async2sync.cc:101:execute$117
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#27| state)) #b1) false) ; $auto$async2sync.cc:101:execute$111
  (= (= ((_ extract 0 0) (|counter_64_bit_formal#28| state)) #b1) false) ; $auto$async2sync.cc:101:execute$105
  (|counter_64_bit_i| (|counter_64_bit_formal_h counter_64_bit| state))
))
(define-fun |counter_64_bit_formal_h| ((state |counter_64_bit_formal_s|)) Bool (and
  (= (|counter_64_bit_formal_is| state) (|counter_64_bit_is| (|counter_64_bit_formal_h counter_64_bit| state)))
  (= (|counter_64_bit_formal#0| state) (|counter_64_bit_n wen| (|counter_64_bit_formal_h counter_64_bit| state))) ; counter_64_bit.wen
  (= (|counter_64_bit_formal#1| state) (|counter_64_bit_n rst| (|counter_64_bit_formal_h counter_64_bit| state))) ; counter_64_bit.rst
  (= (|counter_64_bit_formal#3| state) (|counter_64_bit_n load| (|counter_64_bit_formal_h counter_64_bit| state))) ; counter_64_bit.load
  (= (|counter_64_bit_formal#4| state) (|counter_64_bit_n din| (|counter_64_bit_formal_h counter_64_bit| state))) ; counter_64_bit.din
  (= (|counter_64_bit_formal#5| state) (|counter_64_bit_n count| (|counter_64_bit_formal_h counter_64_bit| state))) ; counter_64_bit.count
  (= (|counter_64_bit_formal#6| state) (|counter_64_bit_n clk| (|counter_64_bit_formal_h counter_64_bit| state))) ; counter_64_bit.clk
  (|counter_64_bit_h| (|counter_64_bit_formal_h counter_64_bit| state))
))
(define-fun |counter_64_bit_formal_t| ((state |counter_64_bit_formal_s|) (next_state |counter_64_bit_formal_s|)) Bool (and
  (= #b1 (|counter_64_bit_formal#28| next_state)) ; $auto$async2sync.cc:104:execute$107 $auto$async2sync.cc:101:execute$105
  (= (|counter_64_bit_formal#38| state) (|counter_64_bit_formal#27| next_state)) ; $auto$async2sync.cc:104:execute$113 $auto$async2sync.cc:101:execute$111
  (= (|counter_64_bit_formal#44| state) (|counter_64_bit_formal#26| next_state)) ; $auto$async2sync.cc:104:execute$119 $auto$async2sync.cc:101:execute$117
  (= (|counter_64_bit_formal#48| state) (|counter_64_bit_formal#25| next_state)) ; $auto$async2sync.cc:104:execute$125 $auto$async2sync.cc:101:execute$123
  (= (|counter_64_bit_formal#50| state) (|counter_64_bit_formal#24| next_state)) ; $auto$async2sync.cc:104:execute$131 $auto$async2sync.cc:101:execute$129
  (= (ite (|counter_64_bit_formal#51| state) #b1 #b0) (|counter_64_bit_formal#23| next_state)) ; $auto$async2sync.cc:112:execute$110 $auto$async2sync.cc:110:execute$109
  (= (ite (|counter_64_bit_formal#52| state) #b1 #b0) (|counter_64_bit_formal#22| next_state)) ; $auto$async2sync.cc:112:execute$116 $auto$async2sync.cc:110:execute$115
  (= (ite (|counter_64_bit_formal#54| state) #b1 #b0) (|counter_64_bit_formal#21| next_state)) ; $auto$async2sync.cc:112:execute$122 $auto$async2sync.cc:110:execute$121
  (= (ite (|counter_64_bit_formal#55| state) #b1 #b0) (|counter_64_bit_formal#20| next_state)) ; $auto$async2sync.cc:112:execute$128 $auto$async2sync.cc:110:execute$127
  (= (ite (|counter_64_bit_formal#56| state) #b1 #b0) (|counter_64_bit_formal#19| next_state)) ; $auto$async2sync.cc:112:execute$134 $auto$async2sync.cc:110:execute$133
  (= (ite (|counter_64_bit_formal#1| state) #b1 #b0) (|counter_64_bit_formal#18| next_state)) ; $procdff$82 \_witness_.anyinit_procdff_82
  (= (ite (|counter_64_bit_formal#3| state) #b1 #b0) (|counter_64_bit_formal#17| next_state)) ; $procdff$83 \_witness_.anyinit_procdff_83
  (= (ite (|counter_64_bit_formal#0| state) #b1 #b0) (|counter_64_bit_formal#16| next_state)) ; $procdff$84 \_witness_.anyinit_procdff_84
  (= (|counter_64_bit_formal#5| state) (|counter_64_bit_formal#15| next_state)) ; $procdff$85 \_witness_.anyinit_procdff_85
  (= (ite (|counter_64_bit_formal#1| state) #b1 #b0) (|counter_64_bit_formal#14| next_state)) ; $procdff$86 \_witness_.anyinit_procdff_86
  (= (ite (|counter_64_bit_formal#3| state) #b1 #b0) (|counter_64_bit_formal#13| next_state)) ; $procdff$87 \_witness_.anyinit_procdff_87
  (= (ite (|counter_64_bit_formal#0| state) #b1 #b0) (|counter_64_bit_formal#12| next_state)) ; $procdff$88 \_witness_.anyinit_procdff_88
  (= (|counter_64_bit_formal#5| state) (|counter_64_bit_formal#11| next_state)) ; $procdff$89 \_witness_.anyinit_procdff_89
  (= (ite (|counter_64_bit_formal#1| state) #b1 #b0) (|counter_64_bit_formal#10| next_state)) ; $procdff$90 \_witness_.anyinit_procdff_90
  (= (ite (|counter_64_bit_formal#3| state) #b1 #b0) (|counter_64_bit_formal#9| next_state)) ; $procdff$91 \_witness_.anyinit_procdff_91
  (= (|counter_64_bit_formal#4| state) (|counter_64_bit_formal#8| next_state)) ; $procdff$92 \_witness_.anyinit_procdff_92
  (= (ite (|counter_64_bit_formal#1| state) #b1 #b0) (|counter_64_bit_formal#7| next_state)) ; $procdff$93 \_witness_.anyinit_procdff_93
  (= #b1 (|counter_64_bit_formal#2| next_state)) ; $procdff$94 \past_valid
  (|counter_64_bit_t| (|counter_64_bit_formal_h counter_64_bit| state) (|counter_64_bit_formal_h counter_64_bit| next_state))
)) ; end of module counter_64_bit_formal
; yosys-smt2-topmod counter_64_bit_formal
; end of yosys output
