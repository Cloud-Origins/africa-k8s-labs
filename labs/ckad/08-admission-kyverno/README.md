# Admission Control & Policy (Kyverno)

Track: CKAD  |  Estimated time: 2.5h  |  Primary tool: Kyverno  |  Type: Lab

Grading: manual. There is no autograder for this lab; your mentor reviews your show-off checkpoint in your PLG space.

## Objective

Enforce cluster policy at admission time with Kyverno.

## Your task

Install Kyverno and write a policy that requires every Pod to carry an 'app' label (or disallows :latest images). Show it blocks a violating resource and allows a compliant one.

## Show-off checkpoint

Share the admission error Kyverno returns when you apply a non-compliant Pod, plus a compliant one succeeding.

## Source / attribution

Adapted from: courselabs admission; kubelabs Kyverno101
