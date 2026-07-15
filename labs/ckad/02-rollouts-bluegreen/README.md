# Progressive Delivery: Rollouts & Blue/Green

Track: CKAD  |  Estimated time: 2h  |  Primary tool: Argo Rollouts  |  Type: Lab

Grading: manual. There is no autograder for this lab; your mentor reviews your show-off checkpoint in your PLG space.

## Objective

Ship changes safely with canary and blue/green strategies using Argo Rollouts.

## Your task

Install Argo Rollouts, convert a Deployment into a Rollout with a canary strategy (a few weighted steps with pauses), trigger an update, and promote it through the steps.

## Show-off checkpoint

Share 'kubectl argo rollouts get rollout <name>' output during a canary step, then after promotion.

## Source / attribution

Adapted from: courselabs rollouts; kubelabs Rollouts101/bluegreen
