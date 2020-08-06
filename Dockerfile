
# builder
# This container is only used for building the Rust binary. Afterwards the binary is copied into the
# actual image below
FROM clux/muslrust:1.45.0-stable as builder
WORKDIR /volume
COPY . .
RUN cargo build --release

# The actual image
FROM alpine
# Copy the compiled binary from the builder container
COPY --from=builder /volume/target/x86_64-unknown-linux-musl/release/docker-cli-sample .
WORKDIR /cli-root-dir
# Pass all arguments etc to binary
ENTRYPOINT [ "/docker-cli-sample" ]