# Container Images: Build & Optimize

Track: CKAD  |  Estimated time: 2h  |  Primary tool: Docker/BuildKit  |  Type: Lab

Grading: manual. There is no autograder for this lab; your mentor reviews your show-off checkpoint in your PLG space.

## Objective

Build a small, production-ready container image with a multi-stage Dockerfile.

## Your task

Write a multi-stage Dockerfile for a simple app (build stage + minimal runtime base such as distroless or alpine), build it, and compare the final image size against a naive single-stage build.

## Show-off checkpoint

Share 'docker images' output comparing your optimized image size to the naive build.

## Source / attribution

Adapted from: courselabs image optimizing/buildkit
