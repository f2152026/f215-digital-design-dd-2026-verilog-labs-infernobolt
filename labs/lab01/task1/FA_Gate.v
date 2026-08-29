// FA_Gate.v
// Gate-level model of a 1-bit full adder. No delays yet -- that starts in
// Task 2. This task is purely about gate ordering.
//
// Part (a): leave this file exactly as it is, compile, and simulate.
// Part (b): AFTER completing part (a), come back and reorder the five gate
//           instantiations below into any different sequence, then
//           re-simulate with the same tb.v and compare.

module FA_Gate (output sum, output cout, input a, input b, input cin);
    wire w1, w2, w3;
    
    // Delays added to simulate physical gate propagation
    xor #(2) x1(w1, a, b);
    xor #(2) x2(sum, w1, cin);
    
    and #(2) a1(w2, a, b);
    and #(2) a2(w3, w1, cin);
    
    
    or  #(2) o1(cout, w2, w3);
endmodule