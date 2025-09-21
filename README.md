Container image for hot-clone - progressively image a mounted disk correctly without corruption. No LVM needed!

## Usage

### Image a partition (migrate Raspberry Pi from SD card to SSD)

```shell
docker run --rm -it --privileged ghcr.io/r-xs-fi/hot-clone /dev/sda > /dev/nvme0n1
```

## Supported platforms


| OS    | Architecture  | Supported | Example hardware |
|-------|---------------|-----------|-------------|
| Linux | amd64 | ✅       | Regular PCs (also known as x64-64) |
| Linux | arm64 | ✅       | Raspberry Pi with 64-bit OS, other single-board computers, Apple M1 etc. |
| Linux | arm/v7 | ✅       | Raspberry Pi with 32-bit OS, older phones |
| Linux | riscv64 | ✅       | More exotic hardware |

## How does this software get to me?

```mermaid
flowchart TD
    subgraph "Origin"
        sourcerepo["Original source repo 🔗"]

        click sourcerepo "https://github.com/benjojo/hot-clone"
    end
    subgraph "Full build"
        rxsfi_build["r.xs.fi build (GitHub Actions)"]
    end
    subgraph "Container Registry"
        r_xs_fi_package_registry[ghcr.io/r-xs-fi/hot-clone 🔗]

        click r_xs_fi_package_registry "https://ghcr.io/r-xs-fi/hot-clone"
    end
    subgraph "user"
        docker_run[$ docker run ...]
    end
    sourcerepo -- download source code --> rxsfi_build
    rxsfi_build -- push --> r_xs_fi_package_registry
    r_xs_fi_package_registry -- pull --> docker_run[$ docker run ...]

```
