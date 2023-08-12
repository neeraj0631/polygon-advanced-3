pragma circom 2.0.0;
template Multiplier2() {  
  
   signal input a;
   signal input b; 

   signal x;
   signal y;
    
   signal output Q;

   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();
   
   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

  notGate.in <== b;
   y <== andGate.out;

   orGate.x <== x;
   orGate.y <== y;
   Q <== orGate.out;

}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
template OR() {
    signal input x;
    signal input y;
    signal output out;

    out <== x + y - x*y;
}
component main = Multiplier2();
