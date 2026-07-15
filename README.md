# Africa Kubernetes Labs

Hands-on Kubernetes labs for the Kubernetes African Developer Training Program 2026 (Andela and CNCF). Clone this repo once, pick your track, and work the labs on your own machine.

There is one repo and one branch (`main`). Labs live once in `labs/`; each track is an ordered path through them. You do not switch branches and there are no submodules.

## Pick your track

| Track | For | Start here |
|---|---|---|
| KCNA | Kubernetes and Cloud Native Associate (fundamentals, breadth) | [tracks/kcna.md](tracks/kcna.md) |
| CKAD | Certified Kubernetes Application Developer (hands-on app dev) | [tracks/ckad.md](tracks/ckad.md) |

CKAD assumes the KCNA foundation; it reuses the core labs and adds application-delivery depth.

## How to use this repo

1. Set up a local cluster: follow [SETUP.md](SETUP.md) (Docker + kind/minikube/k3d).
2. Open your track file and work the labs top to bottom.
3. Each lab folder has:
   - `README.md` — objective, prerequisites, steps, and a "show-off checkpoint"
   - `manifests/` — starter YAML
4. At the show-off checkpoint, share your result (a screenshot, `kubectl` output, or a short clip) in your PLG space to prove completion.

Reference solutions are not published. Your mentor grades your work against the lab's objective and show-off checkpoint.

## Folder layout

```
labs/
  core/        # foundation used by BOTH tracks
  kcna/        # KCNA-specific (concepts + quiz)
  ckad/        # CKAD-specific (app delivery depth)
  electives/   # advanced / show-off / capstone
tracks/
  kcna.md      # ordered KCNA path
  ckad.md      # ordered CKAD path
SETUP.md       # local cluster setup (shared)
```

## Contributing / reporting issues

Open an issue or a pull request. Keep each lab self-contained and runnable on a single-node local cluster. Do not commit kubeconfig files, secrets, or cluster credentials.

## Attribution

Labs are adapted and consolidated from open-source material, including courselabs/kubernetes (Elton Stoneman), omerbsezer/Fast-Kubernetes, and collabnix/kubelabs. See each lab's README for its specific source.
