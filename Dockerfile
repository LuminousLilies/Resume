# Pinned TeX Live toolchain for reproducible résumé builds (LuaLaTeX).
# A fixed tag keeps every build — yours, a friend's, CI's — byte-for-byte identical.
# Bump it deliberately. If this exact tag fails to pull, pick an existing one from
# https://hub.docker.com/r/texlive/texlive/tags (e.g. a different TLYYYY-historic).
FROM texlive/texlive:TL2025-historic
WORKDIR /work
