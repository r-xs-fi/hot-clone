FROM --platform=linux/amd64 fn61/buildkit-golang:20250805_1121_5b31450a AS builder

# can't have default values here, otherwise they'd overwrite the buildx-supplied ones
ARG TARGETOS
ARG TARGETARCH

RUN cd / && git clone https://github.com/benjojo/hot-clone.git

RUN cd /hot-clone && GOARCH=$TARGETARCH CGO_ENABLED=0 go build -ldflags "-extldflags \"-static\""

FROM scratch

ENTRYPOINT ["/usr/bin/hot-clone"]

CMD ["--help"]

COPY --from=builder /hot-clone/hot-clone /usr/bin/hot-clone

# running as unprivileged user not possible because: intended to be superuser tool
