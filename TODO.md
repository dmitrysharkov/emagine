# Specification of the Gem 

## Routines

 - routines are ruby classes 
 - routines contain scenarios 
 - scenarios are mage of the steps 
 - scenarios are described as AST
 - routine converts AST into bytecode 
 - routines are executed runtime in tasks


## Tasks 
 - tasks execute routines runtime 
 - every task has a reference to routine class 
 - tasks can be serialized and unserialized 
 - tasks contain evaluation stack and ip 

```mermaid
  graph TD;
      A-->B;
      A-->C;
      B-->D;
      C-->D;
```
