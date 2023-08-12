# POLY-PROOF-ADVANCED-2-
A hardhat-circom template to generate zero-knowledge circuits, proofs, and solidity verifiers

## Quick Start for circuit
Compile the Multiplier2() circuit and verify it against a smart contract verifier
## version
pragma circom 2.0.0;

## `named circuit.circom`
template Multiplier2 () {  

### `input Declaration of signals.`  
   signal input a;  
   signal input b;  
### `signal from gates`
   signal x;
   signal y;
### `output signal`    
   signal output Q;
### `gates `
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();
   
## `circuit logic`
### `and gate`
   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;
### `not gate`
  notGate.in <== b;
   y <== andGate.out;
### `or gate`
   orGate.x <== x;
   orGate.y <== y;
   Q <== orGate.out;

### `initiate the logic of gates`
component main = Multiplier2();
## `commands used` 
## `Install`
`npm i`

### `Compile`
`npx hardhat circom` This will generate the out file with circuit intermediaries and geneate the MultiplierVerifier.sol contract

### `Prove and Deploy`
`npx hardhat run scripts/deploy.ts` This script does 4 things

* Deploys the MultiplierVerifier.sol contract
* Generates a proof from circuit intermediaries with generateProof()
* Generates calldata with generateCallData()
* Calls verifyProof() on the verifier contract with calldata
* With two commands you can compile a ZKP, generate a proof, deploy a verifier, and verify the proof 🎉

### `deploy it` 
`deploy the contract n polygonsacn mumbai testnet.
