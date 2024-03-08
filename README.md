[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/B6zfzkFl)
# assignment-7
Assignment 7

# Failed Github action testthat summary
In the unit tests, I added 1 to the expected beta coefficient which resulted in failing the first test. That is; I ran 
```
test_that("Testing beta coefficient", {
    expect_equal(
        as.numeric(model$coefficient[2]), ## Named numeric was throwing error
        expected = 1.00076, ## Broke this by adding 1 to expected output
        tolerance = 0.0001
    )
})
```
The Github action gave the following testthat summary:
```
✔ | F W  S  OK | Context

⠏ |          0 | actual                                                         
⠋ | 1        0 | actual                                                         
⠹ | 1        2 | actual                                                         
✖ | 1        4 | actual
────────────────────────────────────────────────────────────────────────────────
Failure ('test-actual.r:8:5'): Testing beta coefficient
as.numeric(model$coefficient[2]) not equal to 1.00076.
1/1 mismatches
[1] 0.000768 - 1 == -1
────────────────────────────────────────────────────────────────────────────────

⠏ |          0 | example                                                        
✔ |          1 | example

══ Results ═════════════════════════════════════════════════════════════════════
── Failed tests ────────────────────────────────────────────────────────────────
Failure ('test-actual.r:8:5'): Testing beta coefficient
as.numeric(model$coefficient[2]) not equal to 1.00076.
1/1 mismatches
[1] 0.000768 - 1 == -1

[ FAIL 1 | WARN 0 | SKIP 0 | PASS 5 ]
Error: Error: Test failures
Execution halted
Ran 1/1 deferred expressions
Error: Process completed with exit code 1.
```