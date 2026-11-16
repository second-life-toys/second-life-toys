# second-life-toys

**Visibility: PUBLIC.** The public face: landing page, user docs, the field guide. No code.

## Layout

- `README.md`: the landing page.
- `docs/`: the user docs. `docs/field-guide/` is the reference layer. `docs/media/` holds the screenshots.
- `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `DISCLAIMER.md`, `SECURITY.md`: the community and policy pages.
- `marketing/`: the launch post.
- `scripts/secret-scan.sh`, `scripts/install-hooks.sh`: the scan and the installer of its pre-commit hook.
- `.github/`: the issue templates and the secret-scan workflow.

## Run and test

No tests. CI runs `bash scripts/secret-scan.sh` on every push and pull request
(`.github/workflows/secret-scan.yml`).

## Deploy

Not deployed.

## Secrets

None. CI and the pre-commit hook run `scripts/secret-scan.sh`.

## Rules

- Follow the house style in `CONTRIBUTING.md` (Documentation style) for every change to the docs.
- Never present the project as affiliated with or endorsed by a toy maker or brand (`DISCLAIMER.md`).

**Visibility: PUBLIC — everything committed here is world-visible.** The public face: landing page, user docs, the field guide. No code.

### Guardrail (read before committing)
Only consumer-safe content belongs here: the app/integration, user docs, and the BLE wire protocol
(intentionally public). NEVER commit the root/access mechanism, crypto keys beyond the public XOR codec
key, cloud secrets, owner PII (serials, MACs, unit-tied BLE names, account/profile IDs, owner hero
names), or any "jailbreak / hack / exploit" framing. This is repair, preservation, and interoperability.

Full policy: `spidey-meta/GUARDRAIL.md`. Repo map + ADRs: `spidey-meta/SPIDEY-REPOS-PRIMER.md`.
A local secret-scan pre-commit guard is installed via `scripts/install-hooks.sh` (run once per clone);
CI runs the same scan.
