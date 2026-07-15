# Jobs & CronJobs

Track: KCNA, CKAD  |  Estimated time: 1.5h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Run run-to-completion work with a Job, and scheduled work with a CronJob.

## Your task

Put your YAML in `submission/`.

1. Create a Job named `counter`:
   - image `busybox:1.36`
   - command that runs and exits successfully, e.g. `sh -c "echo processing; sleep 2; echo done"`
   - `restartPolicy: Never`
2. Create a CronJob named `hello`:
   - schedule `*/5 * * * *`
   - image `busybox:1.36`, command `sh -c "date; echo hello"`
   - `restartPolicy: OnFailure`

## Steps

1. Write `submission/jobs.yaml`.
2. Test locally: `kubectl apply -f submission/jobs.yaml && kubectl get jobs,cronjobs`
3. Confirm the Job reaches `COMPLETIONS 1/1`.
4. Commit and push.

## Show-off checkpoint

Share `kubectl get jobs` (Job complete) and `kubectl logs job/counter` showing your output.

## Source / attribution

Adapted from: courselabs; Fast-Kubernetes job/cronjob; kubelabs Jobs101/Cronjobs101
