# swap in for full-fidelity testing when disk allows (~3GB image):
# FROM linuxmintd/mint22-amd64
FROM ubuntu:24.04

ARG TESTER_UID=1000
ARG TESTER_GID=1000
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      sudo curl ca-certificates git xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    existing_user="$(getent passwd "$TESTER_UID" | cut -d: -f1 || true)"; \
    existing_group="$(getent group "$TESTER_GID" | cut -d: -f1 || true)"; \
    if [ -n "$existing_user" ]; then userdel -r "$existing_user" || userdel "$existing_user"; fi; \
    if [ -n "$existing_group" ]; then groupdel "$existing_group" || true; fi; \
    groupadd -g "$TESTER_GID" tester; \
    useradd -m -u "$TESTER_UID" -g "$TESTER_GID" -s /bin/bash tester; \
    printf '%s\n' \
      'export USER="${USER:-$(id -un)}"' \
      '[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME/.nix-profile/etc/profile.d/nix.sh"' \
      >> /home/tester/.profile; \
    echo 'tester ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tester; \
    chmod 0440 /etc/sudoers.d/tester

USER tester
WORKDIR /home/tester/dotfiles
COPY --chown=tester:tester tests/entrypoint.sh /home/tester/entrypoint.sh
ENTRYPOINT ["/home/tester/entrypoint.sh"]
